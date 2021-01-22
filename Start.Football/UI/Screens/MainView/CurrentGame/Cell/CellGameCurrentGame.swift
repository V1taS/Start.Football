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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            header
            dateGame
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
                TextButtonRound(name: "Мини-футбол",
                                isOn: false)
                
                TextButtonRound(name: "10 на 10",
                                isOn: false)
                
                TextButtonRound(name: "Для всех",
                                isOn: false)
            }
        )
    }
}

private extension CellGameCurrentGame {
    private var dateGame: AnyView {
        AnyView(
            HStack(spacing: 10) {
                Image("cellDate")
                Text("30 августа, 16:00-18:00")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
            }
        )
    }
}

private extension CellGameCurrentGame {
    private var streetGame: AnyView {
        AnyView(
            HStack(spacing: 10) {
                Image("cellLocator")
                Text("ул. Хачтуряна, 12, стр. 2")
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
            Button(action: {}) {
                HStack(spacing: 10)  {
                    Text("5,2 км")
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
    private func actions() {}
}

struct CellGameCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        CellGameCurrentGame(appBinding: .constant(.init()))
    }
}
