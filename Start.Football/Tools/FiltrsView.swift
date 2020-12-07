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
            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                .cornerRadius(25)
                .frame(width: width, height: height - 93)
                .shadow(color: Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)), radius: 25)
            
            VStack(spacing: 0) {
                Color(#colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1))
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 48),
                           height: height * Size.shared.getAdaptSizeHeight(px: 5))
                    .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 18))
                
                VStack(alignment: .leading, spacing: 24) {

                    DatePickerView()
                    
                    TimePickerView()
                    
                    CostView()
                }
                .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 32))
                
                HStack {
                    Text("Доступность")
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
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
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .font(Font.event.robotoMedium18)
                    Spacer()
                }
                .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
                .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 21))
                
                HStack(spacing: width * Size.shared.getAdaptSizeWidth(px: 6)) {
                    Text("Футбол")
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .font(Font.event.robotoRegular16)
                        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                        .overlay(RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1))))
                    
                    Text("Мини-футбол")
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .font(Font.event.robotoRegular16)
                        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                        .overlay(RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1))))
                    
                    Text("Футзал")
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .font(Font.event.robotoRegular16)
                        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                        .overlay(RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1))))
                    Spacer()
                }
                .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 16))
                .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
                
                HStack {
                    Text("Где играть")
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .font(Font.event.robotoMedium18)
                    Spacer()
                }
                .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
                .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 21))
                
                HStack(spacing: width * Size.shared.getAdaptSizeWidth(px: 6)) {
                    Text("Зал")
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .font(Font.event.robotoRegular16)
                        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                        .overlay(RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1))))
                    
                    Text("Манеж")
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .font(Font.event.robotoRegular16)
                        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                        .overlay(RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1))))
                    
                    Text("Улица")
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .font(Font.event.robotoRegular16)
                        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                        .overlay(RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1))))
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
