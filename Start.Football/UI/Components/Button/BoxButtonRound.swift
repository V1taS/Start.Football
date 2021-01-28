//
//  BoxButtonRound.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct TextButtonRound: View {
    let name: String
    let isOn: Bool
    let backgroundColor: Color
    
    var body: some View {
        Text(name)
            
            .foregroundColor(isOn ? Color.whiteColor : .secondaryColor)
            .font(Font.event.robotoRegular16)
            .roundedEdge(backgroundColor: isOn ? backgroundColor : .whiteColor,
                         boarderColor: isOn ? backgroundColor : .secondaryColor)
            .padding(.horizontal, 3)
            .lineLimit(1)
    }
}

struct BoxButtonRound_Previews: PreviewProvider {
    static var previews: some View {
        TextButtonRound(name: "Мини-футбол",
                        isOn: true,
                        backgroundColor: .primaryColor)
    }
}
