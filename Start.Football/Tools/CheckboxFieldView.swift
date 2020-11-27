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
    let width: CGFloat
    
    var body: some View {
        HStack {
            Image(systemName: checked ? "checkmark.square.fill" : "square")
                .foregroundColor(checked ? Color(#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)) : Color.secondary)
                .onTapGesture {
                    self.checked.toggle()
                }
            Text(text)
                .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                .font(Font.event.robotoRegular16)
                .lineLimit(1)
        }
        .frame(minWidth: width * Size.shared.getAdaptSizeWidth(px: 30),
               maxWidth: width * Size.shared.getAdaptSizeWidth(px: 280),
               alignment: .leading)
    }
}

struct CheckboxFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxFieldView(checked: .constant(true),
                          text: "",
                          width: 375)
    }
}
