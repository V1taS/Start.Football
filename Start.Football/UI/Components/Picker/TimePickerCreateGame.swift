//
//  TimePickerCreateGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct TimePickerCreateGame: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    @Binding var currentDate: Date
    
    var body: some View {
        VStack(spacing: 0) {
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Время")
                    .foregroundColor(.defaultColor)
                    .font(Font.event.robotoMedium14)
                    .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 18))
                
                HStack {
                    Image("datePicerTime")
                    
                    DatePicker("vsdvsvdbdb", selection: $currentDate,
                               displayedComponents: .hourAndMinute)
                                .labelsHidden()
                    Spacer()
                }
                .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 11))
            }
            
            VStack(alignment: .center, spacing: 0) {
                Color( #colorLiteral(red: 0.9137254902, green: 0.9137254902, blue: 0.9254901961, alpha: 1))
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 270),
                           height: height * Size.shared.getAdaptSizeHeight(px: 2))
            }
        }
    }
}

struct TimePickerCreateGame_Previews: PreviewProvider {
    static var previews: some View {
        TimePickerCreateGame(currentDate: .constant(Date(timeIntervalSince1970: TimeInterval(10))))
    }
}
