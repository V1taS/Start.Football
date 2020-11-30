//
//  ADV.swift
//  Start.Football
//
//  Created by Виталий Сосин on 30.11.2020.
//

import SwiftUI

struct ADV: View {
    var body: some View {
        Image("adv")
            .resizable()
            .cornerRadius(5)
            .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 343), height: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 343), alignment: .center)
    }
}

struct ADV_Previews: PreviewProvider {
    static var previews: some View {
        ADV()
    }
}
