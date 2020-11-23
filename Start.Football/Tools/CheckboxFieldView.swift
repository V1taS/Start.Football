//
//  CheckboxFieldView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 23.11.2020.
//

import SwiftUI

struct CheckboxFieldView : View {
    
    @Binding var checked: Bool
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: checked ? "checkmark.square.fill" : "square")
                .foregroundColor(checked ? Color(#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)) : Color.secondary)
                .onTapGesture {
                    self.checked.toggle()
                }
            Text(text)
                .font(Font.custom("Roboto", size: 16))
                .lineLimit(1)
        }.frame(minWidth: 30, maxWidth: 280, alignment: .leading)
    }
}

struct CheckboxFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxFieldView(checked: .constant(true),
                          text: "Хочу получать новости на почту")
    }
}
