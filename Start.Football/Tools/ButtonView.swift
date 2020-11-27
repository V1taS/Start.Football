//
//  ButtonView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 23.11.2020.
//

import SwiftUI

struct ButtonView: View {
    
    let background: UIColor
    let text: String
    let height: CGFloat
    let width: CGFloat

    var body: some View {
        ZStack {
            Color(background)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
                .frame(height: height * Size.shared.getAdaptSizeHeight(px: 51))
            Text(text)
                .foregroundColor(.white)
                .font(Font.event.robotoMedium18)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(background: #colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1), text: "Продолжить с Apple", height: 734, width: 375)
    }
}
