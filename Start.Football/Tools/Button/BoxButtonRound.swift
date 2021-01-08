//
//  BoxButtonRound.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct TextButtonRound: View {
    let name: String
    @Binding var isOn: Bool
    let disabledButton: Bool
    
    var body: some View {
        Button(action: { isOn.toggle() }) {
            Text(name)
                .foregroundColor(isOn ? Color.whiteColor : .secondaryColor)
                .font(Font.event.robotoRegular16)
                .roundedEdge(backgroundColor: isOn ? Color.primaryColor : .whiteColor,
                             boarderColor: isOn ? Color.primaryColor : .secondaryColor)
                .padding(.leading, 2)
        } .disabled(disabledButton)
    }
}

struct BoxButtonRound_Previews: PreviewProvider {
    static var previews: some View {
        TextButtonRound(name: "Мини-футбол",
                        isOn: .constant(true),
                        disabledButton: false)
    }
}
