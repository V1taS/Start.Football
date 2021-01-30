//
//  DatePickerLineView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 22.01.2021.
//

import SwiftUI

struct DatePickerLineView: View {
    
    @Binding var date: Date
    @Binding var textHasBeenChanged: Bool
    let text: String
    let header: String
    let iconShow: Bool
    let icon: String
    let hourAndMinute: DatePickerComponents
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            headerView
            
            HStack(spacing: 10) {
                iconView
                textView
                buttonAndPickerView
                Spacer()
                
            }
            .padding(.bottom, 11)
            divider
        }
    }
}

// MARK: UI
private extension DatePickerLineView {
    private var headerView: AnyView {
        AnyView(
            Text(header)
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoRegular14)
                .padding(.bottom, 8)
        )
    }
}

private extension DatePickerLineView {
    private var textView: AnyView {
        AnyView(
            Text(text)
                .lineLimit(1)
                .foregroundColor(textHasBeenChanged ?
                                    Color.secondaryColor :
                                    Color.inactive)
                .font(Font.event.robotoRegular18)
        )
    }
}

private extension DatePickerLineView {
    private var buttonAndPickerView: AnyView {
        AnyView(
            Button(action: {
                textHasBeenChanged = true
            }) {
                DatePicker("", selection: $date,
                           displayedComponents: [hourAndMinute])
                    .environment(\.locale, .init(identifier: "ru"))
                    .labelsHidden()
                    .padding(.leading)
            }
        )
    }
}

private extension DatePickerLineView {
    private var iconView: AnyView {
        AnyView(
            VStack(spacing: 0) {
                if iconShow {
                    Image(icon)
                }
            }
        )
    }
}

// MARK: UI
private extension DatePickerLineView {
    private var divider: AnyView {
        AnyView(
            VStack(spacing: 0) {
                Color(.dividerColor)
                    .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 327),
                           height: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 2))
            }
        )
    }
}


struct DatePickerLineView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerLineView(date: .constant(Date()),
                           textHasBeenChanged: .constant(true),
                           text: "Укажите время",
                           header: "Название",
                           iconShow: false,
                           icon: "",
                           hourAndMinute: .date)
    }
}
