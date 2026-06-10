//
//  ReturnalFontExtension.swift
//  TowerCompanion
//

import SwiftUI

/// Applies a monospaced font that keeps the design's point size at the
/// default content size but scales with the user's Dynamic Type setting.
private struct ScaledMonoFont: ViewModifier {
    @ScaledMetric private var size: CGFloat
    private let weight: Font.Weight

    init(size: CGFloat, weight: Font.Weight, relativeTo textStyle: Font.TextStyle) {
        _size = ScaledMetric(wrappedValue: size, relativeTo: textStyle)
        self.weight = weight
    }

    func body(content: Content) -> some View {
        content.font(.system(size: size, weight: weight, design: .monospaced))
    }
}

extension View {
    /// Monospaced Returnal-style font that supports Dynamic Type.
    /// `textStyle` controls the scaling curve; pick the style closest
    /// to the role the text plays (e.g. `.largeTitle` for hero numbers).
    func returnalFont(size: CGFloat, weight: Font.Weight = .regular, relativeTo textStyle: Font.TextStyle = .body) -> some View {
        modifier(ScaledMonoFont(size: size, weight: weight, relativeTo: textStyle))
    }
}
