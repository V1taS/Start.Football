//
//  TFdateAndTimeCGView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 30.01.2021.
//

import SwiftUI

struct TFdateAndTimeCGView: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    private var appBinding: Binding<AppState.AppData>
    init(appBinding: Binding<AppState.AppData>) {
        self.appBinding = appBinding
    }
    @Environment(\.injected) private var injected: DIContainer
    
    var body: some View {
        VStack(spacing: 0) {
            
            VStack(alignment: .leading, spacing: 0) {
                header
                
                HStack(alignment: .center, spacing: 10) {
                    iconView
                    textField
                    Spacer()
                    
                }
                .padding(.bottom, 8)
            }
            divider
        }
    }
}


// MARK: UI
private extension TFdateAndTimeCGView {
    private var header: AnyView {
        AnyView(
            Text("Дата и время игры")
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoRegular14)
                .padding(.bottom, 16)
        )
    }
}

private extension TFdateAndTimeCGView {
    private var textField: AnyView {
        AnyView(
            Button(action: {
                appBinding.createGame.showDatePicker.wrappedValue.toggle()
            }) {
                VStack {
                    if appBinding.createGame.currentDateHasBeenChanged.wrappedValue {
                        Text("\(searchDateForOneDay(oneGameDate: appBinding.createGame.currentDate.wrappedValue))")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular18)
                            .padding(.bottom, 16)
                            .offset(x: 0, y: 9)
                    } else {
                        Text("Укажите дату и время игры")
                            .foregroundColor(.inactive)
                            .font(Font.event.robotoRegular18)
                            .padding(.bottom, 16)
                            .offset(x: 0, y: 9)
                    }
                }
            }
            
            
        )
    }
}

private extension TFdateAndTimeCGView {
    private var iconView: AnyView {
        AnyView(
            VStack(spacing: 0) {
                    Image("dateCreateGame")
            }
        )
    }
}

private extension TFdateAndTimeCGView {
    private var divider: AnyView {
        AnyView(
            VStack(alignment: .leading, spacing: 0) {
                Color(.dividerColor)
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 327),
                           height: height * Size.shared.getAdaptSizeHeight(px: 2))
            }
        )
    }
}

private extension TFdateAndTimeCGView {
    private func searchDateForOneDay(oneGameDate: Date) -> String {
        injected.interactors.mainAppInteractor
            .searchDateForOneDay(oneGameDate: oneGameDate)
    }
}


struct NoTextfieldOneLineView_Previews: PreviewProvider {
    static var previews: some View {
        TFdateAndTimeCGView(appBinding: .constant(.init()))
    }
}
