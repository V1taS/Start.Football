//
//  NoTextfieldOneLineView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct NoTextfieldOneLineView: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    let text: String
    let header: String
    let iconShow: Bool
    let icon: String
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(header)
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoMedium14)
                .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 18))
            
            HStack {
                Text(text)
                    .foregroundColor(.inactive).opacity(0.7)
                    .font(Font.event.robotoRegular18)
                
                Spacer()
                
                if iconShow {
                    Image(icon)
                }
            } .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 11))
            
            Color(.dividerColor)
                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 327),
                       height: height * Size.shared.getAdaptSizeHeight(px: 2))
        }
    }
}

struct NoTextfieldOneLineView_Previews: PreviewProvider {
    static var previews: some View {
        NoTextfieldOneLineView(text: "Введите название",
                               header: "Название",
                               iconShow: true,
                               icon: "locationCreateGame")
    }
}


