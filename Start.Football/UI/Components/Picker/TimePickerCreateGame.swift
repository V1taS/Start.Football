//
//  TimePickerCreateGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct TimePickerCreateGame: View {
    
    @Binding var currentDate: Date
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                header
                content
            }
            divider
        }
    }
}


// MARK: UI
private extension TimePickerCreateGame {
    private var header: AnyView {
        AnyView(
            Text("Время")
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoMedium14)
                .padding(.bottom, 18)
        )
    }
}

private extension TimePickerCreateGame {
    private var content: AnyView {
        AnyView(
            HStack {
                Image("datePicerTime")
                
                DatePicker("vsdvsvdbdb", selection: $currentDate,
                           displayedComponents: .hourAndMinute)
                    .labelsHidden()
                Spacer()
            }
            .padding(.bottom, 11)
        )
    }
}

private extension TimePickerCreateGame {
    private var divider: AnyView {
        AnyView(
            VStack(alignment: .center, spacing: 0) {
                Color( #colorLiteral(red: 0.9137254902, green: 0.9137254902, blue: 0.9254901961, alpha: 1))
                    .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 327),
                           height: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 2))
            }
        )
    }
}

struct TimePickerCreateGame_Previews: PreviewProvider {
    static var previews: some View {
        TimePickerCreateGame(currentDate: .constant(Date()))
    }
}
