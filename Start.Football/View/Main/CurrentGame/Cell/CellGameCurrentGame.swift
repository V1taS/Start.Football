//
//  CellGameCurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CellGameCurrentGame: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
            
            HStack {
                Text("Мини-футбол")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                    .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                    .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                    .overlay(RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.secondaryColor))
                
                Text("10 на 10")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                    .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                    .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                    .overlay(RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.secondaryColor))
                
                Text("Для всех")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                    .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                    .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                    .overlay(RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.secondaryColor))
                Spacer()
            }
            
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
                    .foregroundColor(.primaryColor)
                    .font(Font.event.robotoRegular16)
                Image("right")
            }
        }
        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 16))
        .padding(.bottom, height * Size.shared.getAdaptSizeHeight(px: 24))
    }
}

struct CellGameCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        CellGameCurrentGame()
    }
}
