//
//  ButtonCancel.swift
//  Start.Football
//
//  Created by Виталий Сосин on 02.12.2020.
//

import SwiftUI

struct ButtonCancel: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(#colorLiteral(red: 1, green: 0.2784313725, blue: 0.2274509804, alpha: 1))))
                .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
                .frame(height: height * Size.shared.getAdaptSizeHeight(px: 51))
            Text("Отмена")
                .foregroundColor(Color(#colorLiteral(red: 1, green: 0.2784313725, blue: 0.2274509804, alpha: 1)))
                .font(Font.event.robotoMedium16)
        }
    }
}

struct ButtonCancel_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCancel()
    }
}
