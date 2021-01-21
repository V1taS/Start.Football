//
//  FormatGameTextField.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 08.01.2021.
//

import SwiftUI

struct FormatGameTextField: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    @Binding var firstValue: String
    @Binding var secondValue: String
    
    var body: some View {
        VStack {
            HStack() {
                Text("Формат игры")
                    .foregroundColor(.defaultColor)
                    .font(Font.event.robotoMedium14)
                    .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 16))
                
                Spacer()
            }
            
            VStack(alignment: .center, spacing: 0) {
                HStack {
                    Spacer()
                    Spacer()
                    HStack(spacing: 0) {
                        TextFieldUIKit(placeholder: "10",
                                            text: $firstValue,
                                            font: UIFont.event.robotoRegular24!,
                                            foregroundColor: .secondaryColor,
                                            keyType: .numberPad,
                                            isSecureText: false)
                            .frame(height: 30)
                    }
                    .frame(width: 60)
                    
                    Spacer()
                    
                    Text("—")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular24)
                    Spacer()
                    Spacer()
                    
                    HStack {
                        TextFieldUIKit(placeholder: "10",
                                            text: $secondValue,
                                            font: UIFont.event.robotoRegular24!,
                                            foregroundColor: .secondaryColor,
                                            keyType: .numberPad,
                                            isSecureText: false)
                            .frame(height: 30)
                    }
                    .frame(width: 60)
                    
                    Spacer()
                }
            }
            
            VStack(alignment: .center, spacing: 0) {
                Color( #colorLiteral(red: 0.9137254902, green: 0.9137254902, blue: 0.9254901961, alpha: 1))
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 327),
                           height: height * Size.shared.getAdaptSizeHeight(px: 2))
            }
        }
    }
}

struct FormatGameTextField_Previews: PreviewProvider {
    static var previews: some View {
        FormatGameTextField(firstValue: .constant("5"),
                            secondValue: .constant("5"))
    }
}
