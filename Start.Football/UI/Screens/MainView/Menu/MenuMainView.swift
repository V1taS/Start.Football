//
//  MenuMainView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct MenuMainView: View {
    
    private var appBinding: Binding<AppState.AppData>
    init(appBinding: Binding<AppState.AppData>) {
        self.appBinding = appBinding
    }
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        VStack {
            Divider()
                .offset(y: 39)
            
            HStack {
                VStack(spacing: 9) {
                    allGamesButton
                    dividerIsOn
                }
                Spacer()
                
                VStack(spacing: 9) {
                    myGamesButton
                    dividerIsOff
                }
            }
            .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 64))
        }
    }
}

// MARK: UI
private extension MenuMainView {
    private var allGamesButton: AnyView {
        AnyView(
            Button(action: {
                appBinding.main.selectionGame.wrappedValue = .allGame
                
            }) {
                Text("Все игры")
                    .font(appBinding.main.selectionGame.wrappedValue == .allGame ?
                            Font.event.robotoMedium16 :
                            Font.event.robotoRegular16)
                    .foregroundColor(appBinding.main.selectionGame.wrappedValue == .allGame ?
                                        .primaryColor :
                                        .secondaryColor)
                    .fontWeight(appBinding.main.selectionGame.wrappedValue == .allGame ?
                                    .bold :
                                    .regular)
            }
        )
    }
}

private extension MenuMainView {
    private var dividerIsOn: AnyView {
        AnyView(
            Color(appBinding.main.selectionGame.wrappedValue == .allGame ? .primaryColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0))
                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 80),
                       height: height * Size.shared.getAdaptSizeHeight(px: 2),
                       alignment: .center)
        )
    }
}

private extension MenuMainView {
    private var myGamesButton: AnyView {
        AnyView(
            Button(action: {
                appBinding.main.selectionGame.wrappedValue = .myGames
                
            }) {
                Text("Мои игры")
                    .font(appBinding.main.selectionGame.wrappedValue == .myGames ?
                            Font.event.robotoMedium16 :
                            Font.event.robotoRegular16)
                    .foregroundColor(appBinding.main.selectionGame.wrappedValue == .myGames ? .primaryColor : .secondaryColor)
                    .fontWeight(appBinding.main.selectionGame.wrappedValue == .myGames ? .bold : .regular)
            }
        )
    }
}

private extension MenuMainView {
    private var dividerIsOff: AnyView {
        AnyView(
            Color(appBinding.main.selectionGame.wrappedValue == .myGames ? .primaryColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0))
                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 80),
                       height: height * Size.shared.getAdaptSizeHeight(px: 2),
                       alignment: .center)
        )
    }
}

struct MenuMainView_Previews: PreviewProvider {
    static var previews: some View {
        MenuMainView(appBinding: .constant(.init()))
    }
}
