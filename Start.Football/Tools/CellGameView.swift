//
//  CellGameView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 26.11.2020.
//

import SwiftUI

struct CellGameView: View {
    var body: some View {
        VStack {
            ZStack {
                Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(Color(#colorLiteral(red: 0.9450980392, green: 0.9490196078, blue: 0.9490196078, alpha: 1))))
                VStack(alignment: .leading, spacing: 16) {
                    Text("Тренировка в ФОК Отрадное")
                        .font(Font.event.robotoMedium20)
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                    HStack(spacing: 10) {
                        Image("cellDate")
                        Text("30 августа, 16:00-18:00")
                            .font(Font.event.robotoRegular16)
                    }
                    HStack(spacing: 10) {
                        Image("cellLocator")
                        Text("ул. Хачтуряна, 12, стр. 2")
                            .font(Font.event.robotoRegular16)
                        Spacer()
                        Text("5,2 км")
                            .font(Font.event.robotoRegular16)
                    }
                    HStack(spacing: 10) {
                        Image("cellMoney")
                        Text("500 ₽")
                            .font(Font.event.robotoRegular24)
                        Spacer()
                        HStack {
                            Image("p5")
                                .offset(x: 195)
                            Image("p4")
                                .offset(x: 128)
                            Image("p3")
                                .offset(x: 60)
                            Image("p2")
                                .offset(x: -8)
                            Image("p1")
                                .offset(x: -75)
                        } .frame(width: 100).offset(x: -70)
                        
                    }
                    HStack(spacing: 6) {
                        Text("По заявке")
                            .font(Font.event.robotoRegular16)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .overlay(RoundedRectangle(cornerRadius: 3)
                                        .stroke(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1))))
                        Text("Мини-футбол")
                            .font(Font.event.robotoRegular16)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .overlay(RoundedRectangle(cornerRadius: 3)
                                        .stroke(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1))))
                        Text("10 на 10")
                            .font(Font.event.robotoRegular16)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .overlay(RoundedRectangle(cornerRadius: 3)
                                        .stroke(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1))))
                        
                    }
                    Spacer()
                }
                .padding(.top, 16)
                .padding(.horizontal, 16)
                
            }
        } .frame(width: 343, height: 220)
        .padding(.top, 16)
    }
}

struct CellGameView_Previews: PreviewProvider {
    static var previews: some View {
        CellGameView()
    }
}
