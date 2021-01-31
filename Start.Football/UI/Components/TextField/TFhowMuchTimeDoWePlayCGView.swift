//
//  TFhowMuchTimeDoWePlayCGView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 30.01.2021.
//

import SwiftUI

struct TFhowMuchTimeDoWePlayCGView: View {
    
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
private extension TFhowMuchTimeDoWePlayCGView {
    private var header: AnyView {
        AnyView(
            Text("Сколько играем?")
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoRegular14)
                .padding(.bottom, 16)
        )
    }
}

private extension TFhowMuchTimeDoWePlayCGView {
    private var textField: AnyView {
        AnyView(
            Button(action: {
                appBinding.createGame.showTimePicker.wrappedValue.toggle()
            }) {
                VStack {
                    if appBinding.createGame.currentTimeHasBeenChanged.wrappedValue {
                        Text("Продолжительность игры \(appBinding.createGame.howMuchTimeDoWePlay.wrappedValue)")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular18)
                            .padding(.bottom, 16)
                            .offset(x: 0, y: 9)
                    } else {
                        Text("Укажите время игры")
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

private extension TFhowMuchTimeDoWePlayCGView {
    private var iconView: AnyView {
        AnyView(
            VStack(spacing: 0) {
                    Image("timeGreateGame")
            }
        )
    }
}

private extension TFhowMuchTimeDoWePlayCGView {
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

private extension TFhowMuchTimeDoWePlayCGView {
    private func searchDateForOneDay(oneGameDate: Date) -> String {
        injected.interactors.mainAppInteractor
            .searchDateForOneDay(oneGameDate: oneGameDate)
    }
}



struct TFhowMuchTimeDoWePlayCGView_Previews: PreviewProvider {
    static var previews: some View {
        TFhowMuchTimeDoWePlayCGView(appBinding: .constant(.init()))
    }
}
