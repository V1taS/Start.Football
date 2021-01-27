//
//  ButtonGoogle.swift
//  Start.Football
//
//  Created by Виталий Сосин on 02.12.2020.
//

import SwiftUI

struct ButtonGoogle: View {
    
    var body: some View {
        ZStack {
            background
            image
            text
        }
        .padding(3)
    }
}


// MARK: UI
private extension ButtonGoogle {
    private var background: AnyView {
        AnyView(
            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))))
                .frame(height: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 51))
        )
    }
}

private extension ButtonGoogle {
    private var image: AnyView {
        AnyView(
            Image("google")
                .frame(width: UIScreen.screenWidth *
                        Size.shared.getAdaptSizeWidth(px: 24),
                       height: UIScreen.screenHeight *
                        Size.shared.getAdaptSizeHeight(px: 24))
                .offset(x: -(UIScreen.screenWidth *
                                Size.shared.getAdaptSizeWidth(px: 140)))
        )
    }
}

private extension ButtonGoogle {
    private var text: AnyView {
        AnyView(
            Text("Продолжить с Google")
                .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                .font(Font.event.robotoMedium16)
        )
    }
}

struct ButtonGoogle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonGoogle()
    }
}
