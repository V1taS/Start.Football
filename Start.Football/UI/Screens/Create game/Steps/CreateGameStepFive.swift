//
//  CreateGameStepFive.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CreateGameStepFive: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 2)) {
                    
                    Text("Все готово!")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoMedium32)
                    
                    Text("Осталось пригласить друзей!")
                        .foregroundColor(.defaultColor)
                        .font(Font.event.robotoRegular18)
                }
                Spacer()
            }
            
            ButtonView(background: .tertiary,
                       textColor: .whiteColor,
                       borderColor: .tertiary,
                       text: "Пригласить друзей")
                .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 24))
        }
        .padding(.horizontal, 24)
        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 32))
    }
}

struct CreateGameStepFive_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameStepFive()
    }
}
