//
//  TimePickerView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 07.12.2020.
//

import SwiftUI

struct TimePickerView: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    @State private var currentDate = Date()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Время")
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoMedium14)
                .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 18))
            
            HStack {
                Image("datePicerTime")
                
                DatePicker("", selection: $currentDate,
                           displayedComponents: .hourAndMinute)
                            .labelsHidden()
                
                Text("-")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular24)
                
                DatePicker("", selection: $currentDate,
                           displayedComponents: .hourAndMinute)
                            .labelsHidden()
                
                Spacer()
                
                Image("datePicerClose")
            } .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 11))
            
            Color( #colorLiteral(red: 0.9137254902, green: 0.9137254902, blue: 0.9254901961, alpha: 1))
                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 327),
                       height: height * Size.shared.getAdaptSizeHeight(px: 2))
        } .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
    }
}

struct TimePickerView_Previews: PreviewProvider {
    static var previews: some View {
        TimePickerView()
    }
}
