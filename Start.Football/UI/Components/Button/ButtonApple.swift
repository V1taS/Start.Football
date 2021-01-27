//
//  ButtonApple.swift
//  Start.Football
//
//  Created by Виталий Сосин on 02.12.2020.
//

import SwiftUI

struct ButtonApple: View {
    
    var body: some View {
        ZStack {
            background
            text
        }
        .padding(3)
    }
}


// MARK: UI
private extension ButtonApple {
    private var background: AnyView {
        AnyView(
            Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .frame(height: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 51))
        )
    }
}

private extension ButtonApple {
    private var text: AnyView {
        AnyView(
            Text(" Продолжить с Apple")
                .foregroundColor(.whiteColor)
                .font(Font.event.SFProDisplayMedium18)
        )
    }
}

struct ButtonApple_Previews: PreviewProvider {
    static var previews: some View {
        ButtonApple()
    }
}
