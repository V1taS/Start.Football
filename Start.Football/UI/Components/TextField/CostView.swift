//
//  CostView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 07.12.2020.
//

import SwiftUI

struct CostView: View {
    
    var appBinding: Binding<AppState.AppData>
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text("Стоимость")
                    .foregroundColor(.defaultColor)
                    .font(Font.event.robotoMedium14)
                    .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 18))
                
                HStack {
                    Image("datePicerRubls")
                    
                    HStack(spacing: 0) {
                        TextFieldUIKit(placeholder: "500",
                                            text: appBinding.main.costSince,
                                            font: UIFont.event.robotoRegular24!,
                                            foregroundColor: .secondaryColor,
                                            keyType: .numberPad,
                                            isSecureText: false)
                            .frame(height: 30)
                            .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 55))
                        
                        Text("₽")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular24)
                            .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 20))
                    }
                    
                    Text("—")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular24)
                    
                    HStack {
                        TextFieldUIKit(placeholder: "1000",
                                            text: appBinding.main.costUntil,
                                            font: UIFont.event.robotoRegular24!,
                                            foregroundColor: .secondaryColor,
                                            keyType: .numberPad,
                                            isSecureText: false)
                            .frame(height: 30)
                            .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 55))
                        
                        Text("₽")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular24)
                            .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 20))
                    }
                    Spacer()
                    
                }
                .padding(.bottom, 11)
            }
            
            VStack(alignment: .center, spacing: 0) {
                Color( #colorLiteral(red: 0.9137254902, green: 0.9137254902, blue: 0.9254901961, alpha: 1))
                    .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 327),
                           height: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 2))
            }
        }
    }
}

struct CostView_Previews: PreviewProvider {
    static var previews: some View {
        CostView(appBinding: .constant(.init()))
    }
}
