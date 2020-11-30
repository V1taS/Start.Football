//
//  Plug.swift
//  Start.Football
//
//  Created by Виталий Сосин on 30.11.2020.
//

import SwiftUI

struct Plug: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        VStack(spacing: 0) {
            Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1))
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 343),
                        height: height * Size.shared.getAdaptSizeHeight(px: 214))
            
            VStack(spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                Text("Пока у тебя нет игр")
                    .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                    .font(Font.event.robotoBold20)
                    
                Button(action: {}) {
                    Text("Создай игру!")
                        .foregroundColor(Color(#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)))
                        .font(Font.event.robotoMedium16)
                }
                Spacer()
            }
            .padding(.top, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 24))
        }
        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 16))
    }
}

struct Plug_Previews: PreviewProvider {
    static var previews: some View {
        Plug()
    }
}
