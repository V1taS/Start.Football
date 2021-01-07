//
//  BoxButtonRound.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct TextButtonRound: View {
    let name: String
    let foregroundColor: Color
    let backgroundColor: Color
    let boarderColor: Color
    let disabledButton: Bool
    
    var body: some View {
        Button(action: {}) {
            Text(name)
                .foregroundColor(foregroundColor)
                .font(Font.event.robotoRegular16)
                .roundedEdge(backgroundColor: backgroundColor,
                             boarderColor: boarderColor)
        } .disabled(disabledButton)
    }
}

struct BoxButtonRound_Previews: PreviewProvider {
    static var previews: some View {
        TextButtonRound(name: "Мини-футбол",
                        foregroundColor: .secondaryColor,
                        backgroundColor: .whiteColor,
                        boarderColor: .secondaryColor,
                        disabledButton: true)
    }
}
