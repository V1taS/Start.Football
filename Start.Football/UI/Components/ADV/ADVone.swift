//
//  ADVCurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct ADVone: View {

    var body: some View {
        ZStack {
            Button(action: {}) {
                Image("adv2")
                    .resizable()
                    .cornerRadius(5)
                    .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 343),
                           height: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 120))
            }
        }
    }
}

struct ADVCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        ADVone()
    }
}
