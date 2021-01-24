//
//  CellGameCurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CellGameCurrentGame: View {
    
    @Environment(\.injected) private var injected: DIContainer
    private var appBinding: Binding<AppState.AppData>
    init(appBinding: Binding<AppState.AppData>) {
        self.appBinding = appBinding
    }
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            header
            streetGame
        }
        .padding(.top, 16)
        .padding(.bottom, 24)
    }
}

// MARK: UI
private extension CellGameCurrentGame {
    private var header: AnyView {
        AnyView(
            HStack {
                TextButtonRound(name: typeGameString(),
                                isOn: false)
                
                TextButtonRound(name: formatGame(),
                                isOn: false)
                
                TextButtonRound(name: privacyGame(),
                                isOn: false)
            }
        )
    }
}

private extension CellGameCurrentGame {
    private var streetGame: AnyView {
        AnyView(
            HStack(spacing: 10) {
                Image("cellLocator")
                Text("\(appBinding.currentGame.addressGame.wrappedValue)")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                Spacer()
                distance
            }
        )
    }
}

private extension CellGameCurrentGame {
    private var distance: AnyView {
        AnyView(
            Button(action: {
                presentMap()
            }) {
                HStack(spacing: 10)  {
                    Text("\(appBinding.currentGame.distance.wrappedValue) км")
                        .foregroundColor(.primaryColor)
                        .font(Font.event.robotoRegular16)
                    Image("right")
                }
            }
        )
    }
}

// MARK: Actions
private extension CellGameCurrentGame {
    private func typeGameString() -> String {
        if appBinding.currentGame.miniFootball.wrappedValue {
            return "Мини-футбол"
        }
        
        if appBinding.currentGame.football.wrappedValue {
            return "Футбол"
        }
        
        if appBinding.currentGame.footsal.wrappedValue {
            return "Футзал"
        }
        return ""
    }
}

// MARK: - Actions
private extension CellGameCurrentGame {
    private func formatGame() -> String {
        return "\(appBinding.currentGame.firstValue.wrappedValue) на \(appBinding.currentGame.secondValue.wrappedValue)"
    }
    
    private func privacyGame() -> String {
        if appBinding.currentGame.privacyGame.wrappedValue == .open {
            return "Для всех"
        }
        
        if appBinding.currentGame.privacyGame.wrappedValue == .close {
            return "По заявке"
        }
        return ""
    }
    
    private func presentMap() {
        self.viewController?.present(style: .pageSheet) {
            MapGameView(appBinding: appBinding)
        }
    }
}

struct CellGameCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        CellGameCurrentGame(appBinding: .constant(.init()))
    }
}
