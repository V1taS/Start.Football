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
    let switchImage: Bool
    let image: String
    
    var body: some View {
        ZStack {
            Color(background)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(borderColor)))
                
                .frame(height: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 51))
            
            HStack {
                if switchImage {
                    Image(image)
                        .renderingMode(.template)
                        .foregroundColor(Color(textColor))
                }
                
                Text(text)
                    .foregroundColor(Color(textColor))
                    .font(Font.event.robotoMedium18)
            }
        }
        .padding(3)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(background: .primaryColor,
                   textColor: .whiteColor,
                   borderColor: .primaryColor,
                   text: "Продолжить с Apple",
                   switchImage: true,
                   image: "datePicerRubls")
    }
}
