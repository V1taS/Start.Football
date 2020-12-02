//
//  ButtonApple.swift
//  Start.Football
//
//  Created by Виталий Сосин on 02.12.2020.
//

import SwiftUI

struct ButtonApple: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
                .frame(height: height * Size.shared.getAdaptSizeHeight(px: 51))
            Text(" Продолжить с Apple")
                .foregroundColor(.white)
                .font(Font.event.SFProDisplayMedium18)
        }
    }
}

struct ButtonApple_Previews: PreviewProvider {
    static var previews: some View {
        ButtonApple()
    }
}
