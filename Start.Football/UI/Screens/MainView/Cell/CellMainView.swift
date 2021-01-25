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
    
    var body: some View {
        ZStack {
            Color(.whiteColor)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.whiteColor))
            
            VStack(alignment: .leading,
                   spacing: 0) {
                
                
                VStack(alignment: .leading, spacing: 16) {
                    header
                    date
                    streetGame
                    coastAndPeople
                }
                typeGame
                .padding(.top, 16)

            }
            .padding(16)
        }
        .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 343),
               height: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 252))
    }
}

// MARK: UI
private extension CellMainView {
    private var header: AnyView {
        AnyView(
            Text(game.name)
                    .font(Font.event.robotoBold20)
                    .foregroundColor(.secondaryColor)
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
                    .foregroundColor(.primaryColor)
                    .font(Font.event.robotoRegular16)
                Image("right")
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


// MARK: Actions
private extension CellMainView {
    private func selectDate(regularGame: String, oneGameDate: Date) -> String {
        if regularGame == "yes" {
            return buildRegularGame()
        } else {
            let timeString = GetDateStringFromDate.shared.getTimeString(date: oneGameDate)
                let dateString = GetDateStringFromDate.shared.getDateStringFull(date: oneGameDate).firstUppercased
            return "\(dateString) в \(timeString)"
        }
    }
    
    private func buildRegularGame() -> String {
        var arrDate = [Date]()
        
        if game.listGameRegularGame[0] {
            arrDate.append(game.listDateRegularGame[0])
        }
        
        if game.listGameRegularGame[1] {
            arrDate.append(game.listDateRegularGame[1])
        }
        
        if game.listGameRegularGame[2] {
            arrDate.append(game.listDateRegularGame[2])
        }
        
        if game.listGameRegularGame[3] {
            arrDate.append(game.listDateRegularGame[3])
        }
        
        if game.listGameRegularGame[4] {
            arrDate.append(game.listDateRegularGame[4])
        }
        
        if game.listGameRegularGame[5] {
            arrDate.append(game.listDateRegularGame[5])
        }
        
        if game.listGameRegularGame[6] {
            arrDate.append(game.listDateRegularGame[6])
        }
        
        let nearDate = arrDate.sorted(by: { $0 > $1 })
        let timeString = GetDateStringFromDate.shared.getTimeString(date: nearDate.first!)
        let dateString = GetDateStringFromDate.shared.getDateStringFull(date: nearDate.first!).firstUppercased
        
        return "\(dateString) в \(timeString)"
    }
}

private extension CellMainView {
    private func typeGameString() -> String {
        if game.miniFootball {
            return "Мини"
        }
        
        if game.usualFootball {
            return "Футбол"
        }
        
        if game.footsal {
            return "Футзал"
        }
        return ""
    }
}

private extension CellMainView {
    private func formatGame() -> String {
        return "\(game.firstTeamCount) на \(game.secondTeamCount)"
    }
}

private extension CellMainView {
    private func privacyGame() -> String {
        if game.privacyGame == "open" {
            return "Для всех"
        }
        
        if game.privacyGame == "close" {
            return "По заявке"
        }
        return ""
    }
}

struct CellMainView_Previews: PreviewProvider {
    static var previews: some View {
        CellMainView(game: .plugGame)
    }
}
