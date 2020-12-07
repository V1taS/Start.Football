//
//  CostView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 07.12.2020.
//

import SwiftUI

struct CostView: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    @State var text = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Стоимость")
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoMedium14)
                .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 18))
            
            HStack {
                Image("datePicerRubls")
                
                HStack(spacing: 0) {
                    TextField("500", text: $text)
                        .foregroundColor(.secondary)
                        .font(Font.event.robotoRegular24)
                        .keyboardType(.numberPad)
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 55))
                    
                    Text("₽")
                        .foregroundColor(.secondary)
                        .font(Font.event.robotoRegular24)
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 20))
                }
                
                Text("—")
                    .foregroundColor(.secondary)
                    .font(Font.event.robotoRegular24)
                
                HStack {
                    TextField("1000", text: $text)
                        .foregroundColor(.secondary)
                        .font(Font.event.robotoRegular24)
                        .keyboardType(.numberPad)
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 55))
                    
                    Text("₽")
                        .foregroundColor(.secondary)
                        .font(Font.event.robotoRegular24)
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 20))
                }
                Spacer()
                
                Image("datePicerClose")
            } .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 11))
            
            Color( #colorLiteral(red: 0.9137254902, green: 0.9137254902, blue: 0.9254901961, alpha: 1))
                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 327),
                       height: height * Size.shared.getAdaptSizeHeight(px: 2))
        } .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
    }
}

struct CostView_Previews: PreviewProvider {
    static var previews: some View {
        CostView()
    }
}
