//
//  ButtonGoogle.swift
//  Start.Football
//
//  Created by Виталий Сосин on 02.12.2020.
//

import SwiftUI

struct ButtonGoogle: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))))
                .frame(height: height * Size.shared.getAdaptSizeHeight(px: 51))
            
            Image("google")
                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 24),
                       height: height * Size.shared.getAdaptSizeHeight(px: 24))
                .offset(x: -(width * Size.shared.getAdaptSizeWidth(px: 140)))
            
            Text("Продолжить с Google")
                .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                .font(Font.event.robotoMedium16)
        }
        .padding(3)
    }
}

struct ButtonGoogle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonGoogle()
    }
}
