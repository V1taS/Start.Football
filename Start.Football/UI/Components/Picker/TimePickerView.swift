//
//  TimePickerView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 07.12.2020.
//

import SwiftUI

struct TimePickerView: View {

    var appBinding: Binding<AppState.AppData>
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text("Время")
                    .foregroundColor(.defaultColor)
                    .font(Font.event.robotoMedium14)
                    .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 18))
                
                HStack {
                    Image("datePicerTime")
                    
                    DatePicker("", selection: appBinding.main.filter.timeSince,
                               displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .accentColor(.secondaryColor)
                    
                    Text("-")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular24)
                    
                    DatePicker("", selection: appBinding.main.filter.timeUntil,
                               displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .accentColor(.secondaryColor)
                    
                    Spacer()
                } .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 11))
            }
            
            VStack(alignment: .center, spacing: 0) {
                Color( #colorLiteral(red: 0.9137254902, green: 0.9137254902, blue: 0.9254901961, alpha: 1))
                    .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 327),
                           height: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 2))
            }
        }
    }
}

struct TimePickerView_Previews: PreviewProvider {
    static var previews: some View {
        TimePickerView(appBinding: .constant(.init()))
    }
}
