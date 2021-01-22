//
//  DatePickerLineView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 22.01.2021.
//

import SwiftUI

import SwiftUI

struct DatePickerLineView: View {
    
    @Binding var date: Date
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    let text: String
    let header: String
    let iconShow: Bool
    let icon: String
    @Binding var textHasBeenChanged: Bool
    let hourAndMinute: DatePickerComponents
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(header)
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoRegular14)
                .padding(.bottom, 16)
            
            HStack {
                Text(text)
                    .foregroundColor(textHasBeenChanged ? Color.secondaryColor : (Color.inactive).opacity(1))
                    .font(Font.event.robotoRegular18)
                
                Button(action: {
                    textHasBeenChanged = true
                }) {
                    DatePicker("", selection: $date,
                               displayedComponents: [hourAndMinute])
                        .environment(\.locale, .init(identifier: "ru"))
                        .labelsHidden()
                        .padding(.leading)
                }
                
                Spacer()
                
                if iconShow {
                    Image(icon)
                }
            } .padding(.bottom, 11)
            
            Color(.dividerColor)
                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 327),
                       height: height * Size.shared.getAdaptSizeHeight(px: 2))
        }
    }
}


struct DatePickerLineView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerLineView(date: .constant(.init()),
                           text: "Укажите время:",
                           header: "Название",
                           iconShow: true,
                           icon: "locationCreateGame",
                           textHasBeenChanged: .constant(true),
                           hourAndMinute: .date)
    }
}
