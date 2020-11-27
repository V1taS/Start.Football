//
//  CellGameView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 26.11.2020.
//

import SwiftUI

struct CellGameView: View {
    
    let height: CGFloat
    let width: CGFloat
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(#colorLiteral(red: 0.9450980392, green: 0.9490196078, blue: 0.9490196078, alpha: 1))))
            VStack(alignment: .leading,
                   spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                Text("Тренировка в ФОК Отрадное")
                    .font(Font.event.robotoMedium20)
                    .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                HStack(spacing: width * Size.shared.getAdaptSizeWidth(px: 10)) {
                    Image("cellDate")
                    Text("30 августа, 16:00-18:00")
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .font(Font.event.robotoRegular16)
                }
                HStack(spacing: width * Size.shared.getAdaptSizeWidth(px: 10)) {
                    Image("cellLocator")
                    Text("ул. Хачтуряна, 12, стр. 2")
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .font(Font.event.robotoRegular16)
                    Spacer()
                    Text("5,2 км")
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .font(Font.event.robotoRegular16)
                }
                HStack(spacing: width * Size.shared.getAdaptSizeWidth(px: 10)) {
                    Image("cellMoney")
                    Text("500 ₽")
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .font(Font.event.robotoRegular24)
                    Spacer()
                    HStack {
                        Image("p5")
                            .offset(x: width * Size.shared.getAdaptSizeWidth(px: 195))
                        Image("p4")
                            .offset(x: width * Size.shared.getAdaptSizeWidth(px: 128))
                        Image("p3")
                            .offset(x: width * Size.shared.getAdaptSizeWidth(px: 60))
                        Image("p2")
                            .offset(x: -(width * Size.shared.getAdaptSizeWidth(px: 8)))
                        Image("p1")
                            .offset(x: -(width * Size.shared.getAdaptSizeWidth(px: 75)))
                    }
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 100))
                    .offset(x: -(width * Size.shared.getAdaptSizeWidth(px: 70)))
                    
                }
                HStack(spacing: width * Size.shared.getAdaptSizeWidth(px: 6)) {
                    Text("По заявке")
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .font(Font.event.robotoRegular16)
                        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                        .overlay(RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1))))
                    Text("Мини-футбол")
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .font(Font.event.robotoRegular16)
                        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                        .overlay(RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1))))
                    Text("10 на 10")
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .font(Font.event.robotoRegular16)
                        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                        .overlay(RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1))))
                    
                }
                Spacer()
            }
            .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 16))
            .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
            
        }
        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 343),
               height: height * Size.shared.getAdaptSizeHeight(px: 220))
    }
}

struct CellGameView_Previews: PreviewProvider {
    static var previews: some View {
        CellGameView(height: 734,
                     width: 375)
    }
}
