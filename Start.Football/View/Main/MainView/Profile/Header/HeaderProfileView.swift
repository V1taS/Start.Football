//
//  HeaderProfileView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct HeaderProfileView: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        ZStack {
            Image("player_profile")
                .resizable()
                .edgesIgnoringSafeArea(.top)
                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 375),
                       height: height * Size.shared.getAdaptSizeHeight(px: 416))
            VStack(alignment: .leading, spacing: 0) {
                Text("Роман Соколов")
                    .foregroundColor(.whiteColor)
                    .font(Font.event.robotoRegular24)
                    .lineLimit(1)
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 250),
                           alignment: .leading)
                
                Text("Петропавловск-Камчатский")
                    .foregroundColor(.whiteColor)
                    .font(Font.event.robotoRegular16)
                    .lineLimit(1)
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 250),
                           alignment: .leading)
                    .padding(.top, width * Size.shared.getAdaptSizeWidth(px: 4))
                
                HStack {
                    Text("180см")
                        .foregroundColor(.whiteColor)
                        .font(Font.event.robotoRegular16)
                        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                        .overlay(RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.whiteColor))
                    
                    Text("89кг")
                        .foregroundColor(.whiteColor)
                        .font(Font.event.robotoRegular16)
                        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                        .overlay(RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.whiteColor))
                    
                    Text("29 лет")
                        .foregroundColor(.whiteColor)
                        .font(Font.event.robotoRegular16)
                        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                        .overlay(RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.whiteColor))
                } .padding(.top, width * Size.shared.getAdaptSizeWidth(px: 16))
                
                HStack {
                    HStack {
                        Text("НАП")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular24)
                            .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                            .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                            .background(Color.whiteColor)
                            .clipShape(RoundedRectangle(cornerRadius: 3))
                            .overlay(RoundedRectangle(cornerRadius: 3)
                                        .stroke(Color.whiteColor))
                        
                        
                        Text("ПЗ")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular24)
                            .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                            .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                            .background(Color.whiteColor)
                            .clipShape(RoundedRectangle(cornerRadius: 3))
                            .overlay(RoundedRectangle(cornerRadius: 3)
                                        .stroke(Color.whiteColor))
                        
                        Text("ВРТ")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular24)
                            .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                            .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                            .background(Color.whiteColor)
                            .clipShape(RoundedRectangle(cornerRadius: 3))
                            .overlay(RoundedRectangle(cornerRadius: 3)
                                        .stroke(Color.whiteColor))
                    }
                    Spacer()
                    
                    ZStack {
                        Image("undershirt")
                            .resizable()
                            .frame(width: width * Size.shared.getAdaptSizeWidth(px: 87),
                                   height: height * Size.shared.getAdaptSizeHeight(px: 66))
                        Text("88")
                            .foregroundColor(.whiteColor)
                            .font(Font.event.robotoRegular24)
                    }
                }
                .padding(.top, width * Size.shared.getAdaptSizeWidth(px: 16))
                
            }
            .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
            .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0),
                    y: height * Size.shared.getAdaptSizeHeight(px: 150))
        }
    }
}

struct HeaderProfileView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderProfileView()
    }
}
