//
//  ButtonCancel.swift
//  Start.Football
//
//  Created by Виталий Сосин on 02.12.2020.
//

import SwiftUI

struct ButtonCancel: View {
    
    private var text: String
    init(text: String) {
        self.text = text
    }

    var body: some View {
        ZStack {
            background
            textView
        }
    }
}


// MARK: UI
private extension ButtonCancel {
    private var background: AnyView {
        AnyView(
            Color(.whiteColor)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(.error)))
                .frame(height: UIScreen.screenHeight *
                        Size.shared.getAdaptSizeHeight(px: 51))
        )
    }
}

private extension ButtonCancel {
    private var textView: AnyView {
        AnyView(
            Text(text)
                .foregroundColor(Color(.error))
                .font(Font.event.robotoMedium16)
        )
    }
}

struct ButtonCancel_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCancel(text: "Отмена")
    }
}
