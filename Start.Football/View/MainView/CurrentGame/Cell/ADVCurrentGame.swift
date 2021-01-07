//
//  ADVCurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct ADVCurrentGame: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        ZStack {
            Button(action: {}) {
                Image("adv2")
                    .resizable()
                    .cornerRadius(5)
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 343),
                           height: height * Size.shared.getAdaptSizeHeight(px: 120))
            }
        }
        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 32))
    }
}

struct ADVCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        ADVCurrentGame()
    }
}
