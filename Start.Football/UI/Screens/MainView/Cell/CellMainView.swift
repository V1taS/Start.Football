//
//  CellMainView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CellMainView: View {
    
    private let game: Game
    init(game: Game) {
        self.game = game
    }
    @Environment(\.injected) private var injected: DIContainer
    var body: some View {
        ZStack {
            background
            
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 16) {
                    header
                    date
                    streetGame
                    coastAndPeople
                }
                .padding(.top, 16)
                Spacer()
                typeGame
                    .padding(.bottom, 14)
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 220)
    }
}

// MARK: UI
private extension CellMainView {
    private var background: AnyView {
        AnyView(
            Color(.backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.whiteColor, lineWidth: 1))
        )
    }
}

private extension CellMainView {
    private var header: AnyView {
        AnyView(
            Text(game.name)
                .font(Font.event.robotoBold20)
                .foregroundColor(.secondaryColor)
                .lineLimit(1)
        )
    }
}

private extension CellMainView {
    private var date: AnyView {
        AnyView(
            HStack(spacing: 10) {
                Image("cellDate")
                Text(selectDate(regularGame: game.regularGame, oneGameDate: game.oneGameDate))
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                    .lineLimit(1)
            }
        )
    }
}

private extension CellMainView {
    private var streetGame: AnyView {
        AnyView(
            HStack(spacing: 10) {
                Image("cellLocator")
                Text("\(game.address)")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                    .lineLimit(1)
                    .frame(width: 170)
                Spacer()
                distance
            }
        )
    }
}

private extension CellMainView {
    private var distance: AnyView {
        AnyView(
            HStack(spacing: 10)  {
                Text("5,2 км")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                    .lineLimit(1)
                    .frame(width: 70, alignment: .trailing)
            }
        )
    }
}

private extension CellMainView {
    private var coastAndPeople: AnyView {
        AnyView(
            HStack(spacing: 10) {
                Image("cellMoney")
                Text("\(game.costGame) ₽")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular24)
                Spacer()
                
                let plugPhotoPlayers = ["p1", "p2", "p3", "p4", "p5"]
                HStack(alignment: .center, spacing: -20) {
                    ForEach(0..<5, id: \.self) { index in
                        Image(plugPhotoPlayers[index])
                    }
                }
            }
        )
    }
}

private extension CellMainView {
    private var typeGame: AnyView {
        AnyView(
            HStack(spacing: 6)  {
                
                TextButtonRound(name: typeGameString(game: game),
                                isOn: false,
                                backgroundColor: .primaryColor)
                TextButtonRound(name: formatGame(game: game),
                                isOn: false,
                                backgroundColor: .primaryColor)
                TextButtonRound(name: privacyGame(game: game),
                                isOn: false,
                                backgroundColor: .primaryColor)
            }
        )
    }
}


// MARK: Actions
private extension CellMainView {
    private func selectDate(regularGame: String, oneGameDate: Date) -> String {
        if regularGame == "yes" {
            return searchDateForRegular(game: game)
        } else {
            return searchDateForOneDay(oneGameDate: oneGameDate)
        }
    }
    
    private func searchDateForRegular(game: Game) -> String {
        injected.interactors.mainAppInteractor
            .searchDateForRegular(game: game)
    }
    
    private func searchDateForOneDay(oneGameDate: Date) -> String {
        injected.interactors.mainAppInteractor
            .searchDateForOneDay(oneGameDate: oneGameDate)
            
    }
    
    private func typeGameString(game: Game) -> String {
        injected.interactors.mainAppInteractor
            .typeGameString(game: game)
    }
    
    private func formatGame(game: Game) -> String {
        injected.interactors.mainAppInteractor
            .formatGame(game: game)
    }
    
    private func privacyGame(game: Game) -> String {
        injected.interactors.mainAppInteractor.privacyGame(game: game)
    }
}

struct CellMainView_Previews: PreviewProvider {
    static var previews: some View {
        CellMainView(game: .plugGame)
    }
}
