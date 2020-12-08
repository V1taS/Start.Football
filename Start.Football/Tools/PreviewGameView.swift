//
//  PreviewGameView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 05.12.2020.
//

import SwiftUI

struct PreviewGameView: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        ZStack {
            Color(.whiteColor)
                .cornerRadius(25)
                .frame(width: width - width * Size.shared.getAdaptSizeWidth(px: 20), height: height * Size.shared.getAdaptSizeHeight(px: 340))
                .shadow(color: Color.secondaryColor, radius: 25)
            
            VStack(spacing: 0) {
                Color(#colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1))
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 48),
                           height: height * Size.shared.getAdaptSizeHeight(px: 5))
                    .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(#colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1))))
                    .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 18))
                
                HStack(spacing: width * Size.shared.getAdaptSizeWidth(px: 16)) {
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
                .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 32))
                .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
                
                VStack(alignment: .leading,
                       spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                    
                    Text("Тренировка в ФОК Отрадное")
                        .font(Font.event.robotoBold20)
                        .foregroundColor(.secondaryColor)
                    HStack(spacing: width * Size.shared.getAdaptSizeWidth(px: 10)) {
                        Image("cellDate")
                        Text("30 августа, 16:00-18:00")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular16)
                    }
                    HStack(spacing: width * Size.shared.getAdaptSizeWidth(px: 10)) {
                        Image("cellLocator")
                        Text("ул. Хачтуряна, 12, стр. 2")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular16)
                        Spacer()
                        Text("5,2 км")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular16)
                    }
                    HStack(spacing: width * Size.shared.getAdaptSizeWidth(px: 10)) {
                        Image("cellMoney")
                        Text("500 ₽")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular24)
                        Spacer()
                        HStack(alignment: .center, spacing: -20) {
                            Image("p5")
                                .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0))
                            Image("p4")
                                .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0))
                            Image("p3")
                                .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0))
                            Image("p2")
                                .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0))
                            Image("p1")
                                .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0))
                        }
                    }
                }
                .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 16))
                .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
                
                Button(action: {}) {
                    ButtonView(background: .primaryColor,
                               textColor: .whiteColor,
                               borderColor: .primaryColor,
                               text: "Подробнее об игре")
                }
                .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 24))
            }
            .offset(y: height * Size.shared.getAdaptSizeHeight(px: -10))
        }
    }
}

/*
 @State var viewState = CGSize.zero
 
 PreviewGameView()
     .offset(y: height * Size.shared.getAdaptSizeHeight(px: 160))
     .animation(.spring())
     .offset(y: showFiltrsView ? viewState.height : 1000)
     .gesture(
         DragGesture().onChanged { value in
             self.viewState = value.translation
             
             if value.translation.height < -50 {
                 self.viewState.height = .zero
             }
             if value.translation.height > 100 {
                 self.showFiltrsView.toggle()
             }
         }
         .onEnded { value in
             self.viewState.height = .zero
         }
     )
 */

struct PreviewGameView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewGameView()
    }
}
