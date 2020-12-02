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
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 7) {
            Image(systemName: checked ? "checkmark.square.fill" : "square")
                .foregroundColor(checked ? Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)) : Color.secondary)
                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 14),
                       height: height * Size.shared.getAdaptSizeHeight(px: 14))
                .onTapGesture {
                    self.checked.toggle()
                }
            Text(text)
                .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                .font(Font.event.robotoRegular16)
        }
        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 327), alignment: .leading)
    }
}

struct CheckboxFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxFieldView(checked: .constant(true),
                          text: "Создавая аккаунт вы принимаете правила сервиса и политику конфиденциальности")
    }
}
