//
//  DatePickerLineWithoutButtonView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 29.01.2021.
//

import SwiftUI

struct DatePickerLineWithoutButtonView: View {
    
    var appBinding: Binding<AppState.AppData>
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                headerView
                
                HStack(spacing: 10) {
                    iconView
                    textView
                    Spacer()
                    
                }
                .padding(.bottom, 11)
                divider
            }
            
            ZStack {
                if appBinding.createGame.showDatePicker.wrappedValue {
                    Color.gray
                        .edgesIgnoringSafeArea(.all)
                    buttonAndPickerView
                }
            }
        }
    }
}

// MARK: UI
private extension DatePickerLineWithoutButtonView {
    private var headerView: AnyView {
        AnyView(
            Text("Дата и время игры")
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoRegular14)
                .padding(.bottom, 8)
        )
    }
}

private extension DatePickerLineWithoutButtonView {
    private var textView: AnyView {
        AnyView(
            Button(action: {
                appBinding.createGame.showDatePicker.wrappedValue = true
            }) {
                Text("Укажите дату и время игры")
                    .lineLimit(1)
                    .foregroundColor(appBinding.createGame.currentTimeHasBeenChanged.wrappedValue ?
                                        Color.secondaryColor :
                                        Color.inactive)
                    .font(Font.event.robotoRegular18)
            }
        )
    }
}

private extension DatePickerLineWithoutButtonView {
    private var buttonAndPickerView: AnyView {
        AnyView(
            Button(action: {
                appBinding.createGame.currentTimeHasBeenChanged.wrappedValue = true
            }) {
                DatePicker("", selection: appBinding.createGame.currentDate,
                           displayedComponents: [.date, .hourAndMinute])
                    .environment(\.locale, .init(identifier: "ru"))
                    .labelsHidden()
                    .padding(.leading)
            }
        )
    }
}

private extension DatePickerLineWithoutButtonView {
    private var iconView: AnyView {
        AnyView(
            VStack(spacing: 0) {
                    Image("dateCreateGame")
            }
        )
    }
}

// MARK: UI
private extension DatePickerLineWithoutButtonView {
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

struct DatePickerLineWithoutButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerLineWithoutButtonView(appBinding: .constant(.init()))
    }
}
