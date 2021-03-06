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
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(backgroundColor)
            .cornerRadius(16)
            .overlay(RoundedRectangle(cornerRadius: 16)
                        .stroke(boarderColor))
    }
}

extension View {
    func roundedEdge(backgroundColor: Color, boarderColor: Color) -> some View {
        self.modifier(RoundedColorEdge(backgroundColor: backgroundColor, boarderColor: boarderColor))
    }
}
