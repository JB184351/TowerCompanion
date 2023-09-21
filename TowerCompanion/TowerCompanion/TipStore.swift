//
//  TipStore.swift
//  TowerCompanion
//
//  Created by Justin on 9/20/23.
//

import Foundation
import StoreKit

typealias PurchaseResult = Product.PurchaseResult

enum TipError: LocalizedError {
    case failedVerification
}

enum TipsAction {
    case successful
}

final class TipStore: ObservableObject {
    @Published private(set) var items = [Product]()
    @Published private(set) var action: TipsAction?
    
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
            // MARK: - TODO handle actual errors
            print(error.localizedDescription)
        }
    }
    
    func reset() {
        action = nil
    }
}

private extension TipStore {
    
    @MainActor
    func retrieveProducts() async {
        
        do {
            let products = try await Product.products(for: myTipProductIdentifiers).sorted(by: { $0.price < $1.price })
            items = products
        } catch {
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
            throw TipError.failedVerification
        case .verified(let safe):
            return safe
        }
    }
}
