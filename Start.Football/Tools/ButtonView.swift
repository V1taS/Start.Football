//
//  ButtonView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 23.11.2020.
//

import SwiftUI

struct ButtonView: View {
    
    let background: UIColor
    let textColor: UIColor
    let borderColor: UIColor
    let text: String
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth

    var body: some View {
        ZStack {
            Color(background)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(borderColor)))
                .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
                
                .frame(height: height * Size.shared.getAdaptSizeHeight(px: 51))
                
            Text(text)
                .foregroundColor(Color(textColor))
                .font(Font.event.robotoMedium18)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(background: .primary,
                   textColor: .white,
                   borderColor: .primary,
                   text: "Продолжить с Apple")
    }
}
