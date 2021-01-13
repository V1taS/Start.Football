//
//  ButtonRoundGreen.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct ButtonRoundGreen: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    let status: Bool
    
    var body: some View {
        Circle()
            .stroke(status ? Color.primaryColor : .defaultColor,
                    lineWidth: 3)
            .frame(width: width * Size.shared.getAdaptSizeWidth(px: 18),
                   height: height * Size.shared.getAdaptSizeHeight(px: 18))
            .padding(-5)
            .overlay(Circle())
            .foregroundColor(status ? Color.primaryColor : .clear)
    }
}

struct ButtonRoundGreen_Previews: PreviewProvider {
    static var previews: some View {
        ButtonRoundGreen(status: true)
    }
}
