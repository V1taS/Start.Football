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
            Color(.whiteColor)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(.error)))
                .frame(height: height * Size.shared.getAdaptSizeHeight(px: 51))
            Text("Отмена")
                .foregroundColor(Color(.error))
                .font(Font.event.robotoMedium16)
        }
        .padding(3)
    }
}

struct ButtonCancel_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCancel()
    }
}
