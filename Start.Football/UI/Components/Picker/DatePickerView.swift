//
//  DatePickerView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 07.12.2020.
//

import SwiftUI

struct DatePickerView: View {
    
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
private extension DatePickerView {
    private var header: AnyView {
        AnyView(
            Text("Дата")
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoMedium14)
                .padding(.bottom, 16)
        )
    }
}

private extension DatePickerView {
    private var content: AnyView {
        AnyView(
            HStack {
                Image("datePicerDate")
                
                DatePicker("", selection: $currentDate,
                           displayedComponents: .date)
                    .labelsHidden()
                    .accentColor(.secondaryColor)
                
                Spacer()
            }
            .padding(.bottom, 11)
        )
    }
}

private extension DatePickerView {
    private var divider: AnyView {
        AnyView(
            VStack(alignment: .leading, spacing: 0) {
                Color(#colorLiteral(red: 0.9137254902, green: 0.9137254902, blue: 0.9254901961, alpha: 1))
                    .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 327),
                           height:  UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 2))
            }
        )
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView(currentDate: .constant(Date(timeIntervalSince1970: TimeInterval(12))))
    }
}
