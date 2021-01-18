//
//  BoxButtonRound.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct TextButtonRound: View {
    let name: String
    var isOn: Bool
    
    var body: some View {
        Text(name)
            .foregroundColor(isOn ? Color.whiteColor : .secondaryColor)
            .font(Font.event.robotoRegular16)
            .roundedEdge(backgroundColor: isOn ? Color.primaryColor : .whiteColor,
                         boarderColor: isOn ? Color.primaryColor : .secondaryColor)
            .scaleEffect(0.95)
    }
}

struct BoxButtonRound_Previews: PreviewProvider {
    static var previews: some View {
        TextButtonRound(name: "Мини-футбол", isOn: true)
    }
}
