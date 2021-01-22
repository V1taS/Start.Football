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
        HStack {
            HStack(alignment: .firstTextBaseline, spacing: 7) {
                Image(systemName: checked ? "checkmark.square.fill" : "square")
                    .foregroundColor(checked ? .secondaryColor : .defaultColor)
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 14),
                           height: height * Size.shared.getAdaptSizeHeight(px: 14))
                    .onTapGesture {
                        self.checked.toggle()
                    }
                Text(text)
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
            }
            .frame(width: width * Size.shared.getAdaptSizeWidth(px: 270), alignment: .leading)
            Spacer()
        }
        .padding(3)
    }
}

struct CheckboxFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxFieldView(checked: .constant(true),
                          text: "Создавая аккаунт вы принимаете правила сервиса и политику конфиденциальности")
    }
}
