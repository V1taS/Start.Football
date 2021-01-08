//
//  TextfieldOneLineView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct TextfieldOneLineView: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    @Binding var text: String
    let title: String
    let icon: String
    let iconShow: Bool
    let placeholder: String
    let keyboardType: UIKeyboardType
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoRegular14)
                .padding(.bottom, height * Size.shared.getAdaptSizeHeight(px: 16))
            
            HStack {
                TextField(placeholder, text: $text)
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular18)
                    .keyboardType(keyboardType)
                if iconShow {
                    Image(icon)
                }
            } .padding(.bottom, height * Size.shared.getAdaptSizeHeight(px: 8))
            
            Color(.dividerColor)
                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 327),
                       height: height * Size.shared.getAdaptSizeHeight(px: 2))
        }
    }
}

struct TextfieldOneLineView_Previews: PreviewProvider {
    static var previews: some View {
        TextfieldOneLineView(text: .constant(""),
                             title: "Название",
                             icon: "locationCreateGame",
                             iconShow: true,
                             placeholder: "Введите название",
                             keyboardType: .default)
    }
}
