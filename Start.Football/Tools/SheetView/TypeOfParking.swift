//
//  TypeOfParking.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 30.12.2020.
//

import SwiftUI

struct TypeOfParking: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        ZStack {
            Color(.backgroundColor)
                .cornerRadius(25)
                .frame(width: width, height: height * Size.shared.getAdaptSizeHeight(px: 600))
                .shadow(color: Color.secondaryColor, radius: 25)
            
            VStack(spacing: 0) {
                Color(.shotDividerColor)
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 48),
                           height: height * Size.shared.getAdaptSizeHeight(px: 5))
                    .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(.shotDividerColor)))
                    .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 18))
                
                HStack {
                    Text("Тип парковки")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoMedium32)
                    Spacer()
                }
                .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
                .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 21))
                
                VStack(spacing: height * Size.shared.getAdaptSizeHeight(px: 24)) {
                    
                    HStack {
                        Text("Платная городская")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular18)
                        Spacer()
                        ButtonRoundGreen(status: false)
                    }
                    Divider()
                    
                    HStack {
                        Text("Платная на территории")
                            .foregroundColor(.primaryColor)
                            .font(Font.event.robotoRegular18)
                        Spacer()
                        ButtonRoundGreen(status: true)
                    }
                    Divider()
                    
                    HStack {
                        Text("Бесплатная на территории")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular18)
                        Spacer()
                        ButtonRoundGreen(status: false)
                    }
                    Divider()
                    
                    HStack {
                        Text("Бесплатная городская")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular18)
                        Spacer()
                        ButtonRoundGreen(status: true)
                    }
                    Divider()
                    
                }
                .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
                .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 25))
                
                TextfieldOneLineView(text: .constant(""),
                                     title: "Стоимость",
                                     icon: "",
                                     iconShow: false,
                                     placeholder: "Укажите стоимость",
                                     keyboardType: .numberPad)
                    .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 24))
                
                HStack {
                    HStack {
                        ButtonRoundGreen(status: true)
                        Text("Разово")
                            .foregroundColor(.primaryColor)
                            .font(Font.event.robotoRegular16)
                    }
                    Spacer()
                    HStack {
                        ButtonRoundGreen(status: false)
                        Text("За час")
                            .foregroundColor(.defaultColor)
                            .font(Font.event.robotoRegular16)
                    }
                    Spacer()
                    Spacer()
                }
                .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
                .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 25))
                
                Spacer()
            }
            .offset(y: height * Size.shared.getAdaptSizeHeight(px: 70))
        }
    }
}

struct TypeOfParking_Previews: PreviewProvider {
    static var previews: some View {
        TypeOfParking()
    }
}
