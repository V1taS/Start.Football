//
//  RoundedColorEdge.swift
//  Start.Football
//
//  Created by Виталий Сосин on 11.12.2020.
//

import SwiftUI

struct RoundedColorEdge: ViewModifier {
    let backgroundColor: Color
    let boarderColor: Color

    func body(content: Content) -> some View {
        content
            .padding(.horizontal, UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 12))
            .padding(.vertical, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 9))
            .background(backgroundColor)
            .cornerRadius(12)
            .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(boarderColor))
    }
}

extension View {
    func roundedEdge(backgroundColor: Color, boarderColor: Color) -> some View {
        self.modifier(RoundedColorEdge(backgroundColor: backgroundColor, boarderColor: boarderColor))
    }
}
