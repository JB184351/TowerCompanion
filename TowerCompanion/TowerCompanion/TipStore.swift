//
//  TipStore.swift
//  TowerCompanion
//
//  Created by Justin on 9/20/23.
//

import Foundation
import StoreKit

typealias PurchaseResult = Product.PurchaseResult

enum TipsError: LocalizedError {
    case failedVerification
    case system(Error)
    
    var errorDescription: String? {
        switch self {
        case .failedVerification:
            return "User transaction verification failed"
        case .system(let error):
            return error.localizedDescription
        }
    }
}

enum TipsAction {
    case successful
    case failed(TipsError)
    
    static func == (lhs: TipsAction, rhs: TipsAction) -> Bool {
        switch (lhs, rhs) {
        case (.successful, .successful):
            return true
        case (let .failed(lhsError), let .failed(rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        default:
            return false
        }
    }
}

@MainActor
final class TipStore: ObservableObject {
    
    @Published private(set) var items = [Product]()
    @Published private(set) var action: TipsAction? {
        didSet {
            switch action {
            case .failed:
                hasError = true
            default:
                hasError = false
            }
        }
    }
    
    @Published var hasError = false
    
    var error: TipsError? {
        switch action {
        case .failed(let error):
            return error
        default:
            return nil
        }
    }
    
    init() {
        Task { [weak self] in
            await self?.retrieveProducts()
        }
    }
    
    func purchase(_ item: Product) async {
        do {
            let result = try await item.purchase()
            try await handlePurchase(from: result)
        } catch {
            action = .failed(.system(error))
            print(error.localizedDescription)
        }
    }
    
    func reset() {
        action = nil
    }
}

private extension TipStore {
    
    func retrieveProducts() async {
        
        do {
            let products = try await Product.products(for: myTipProductIdentifiers).sorted(by: { $0.price < $1.price })
            items = products
        } catch {
            action = .failed(.system(error))
            print(error.localizedDescription)
        }
    }
    
    private func handlePurchase(from result: PurchaseResult) async throws {
        switch result {
        case .success(let verification):
            print("Purchase was a success, now it's time to verify the purchase")
            let transaction = try checkVerification(verification)
            action = .successful
            await transaction.finish()
        case .pending:
            print("The user needs to complete some action on their account before they can complete purchase")
        case .userCancelled:
            print("The user hit cancel before their transaction started.")
        default:
            break
        }
    }
    
    func checkVerification<T>(_ result: VerificationResult<T>) throws -> T {
        switch result {
        case .unverified:
            print("The verification of the user failed.")
            throw TipsError.failedVerification
        case .verified(let safe):
            return safe
        }
    }
}
