//
//  FiltrsView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 05.12.2020.
//

import SwiftUI

struct FiltrsView: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        ZStack {
            Color(.whiteColor)
                .cornerRadius(25)
                .frame(width: width, height: height - 93)
                .shadow(color: Color.secondaryColor, radius: 25)
            
            VStack(spacing: 0) {
                Color(#colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1))
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 48),
                           height: height * Size.shared.getAdaptSizeHeight(px: 5))
                    .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(#colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1))))
                    .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 18))
                
                VStack(alignment: .leading, spacing: 24) {

                    DatePickerView()
                    
                    TimePickerView()
                    
                    CostView()
                }
                .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 32))
                
                HStack {
                    Text("Доступность")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoMedium18)
                    Spacer()
                }
                .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
                .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 21))
                
                VStack(alignment: .leading, spacing: 16) {
                    CheckboxFieldView(checked: .constant(false),
                                      text: "Только бесплатные игры")
                    CheckboxFieldView(checked: .constant(false),
                                      text: "Не показывать игры с резервом")
                    CheckboxFieldView(checked: .constant(false),
                                      text: "Для всех желающих (без заявок)")
                }
                .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 32))
                
                HStack {
                    Text("Тип игры")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoMedium18)
                    Spacer()
                }
                .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
                .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 21))
                
                HStack(spacing: width * Size.shared.getAdaptSizeWidth(px: 6)) {
                    Text("Футбол")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                        .overlay(RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.secondaryColor))
                    
                    Text("Мини-футбол")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                        .overlay(RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.secondaryColor))
                    
                    Text("Футзал")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                        .overlay(RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.secondaryColor))
                    Spacer()
                }
                .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 16))
                .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
                
                HStack {
                    Text("Где играть")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoMedium18)
                    Spacer()
                }
                .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
                .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 21))
                
                HStack(spacing: width * Size.shared.getAdaptSizeWidth(px: 6)) {
                    Text("Зал")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                        .overlay(RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.secondaryColor))
                    
                    Text("Манеж")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                        .overlay(RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.secondaryColor))
                    
                    Text("Улица")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                        .overlay(RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.secondaryColor))
                    Spacer()
                }
                .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 16))
                .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
                Spacer()
            }
        }
    }
}

struct FiltrsView_Previews: PreviewProvider {
    static var previews: some View {
        FiltrsView()
    }
}
