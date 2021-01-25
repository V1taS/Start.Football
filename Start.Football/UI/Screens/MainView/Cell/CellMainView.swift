//
//  CellMainView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CellMainView: View {
    
    private var appBinding: Binding<AppState.AppData>
    init(appBinding: Binding<AppState.AppData>) {
        self.appBinding = appBinding
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
            Text("\(appBinding.currentGame.game.name.wrappedValue)")
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
                    Text(selectDate())
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
                Text("\(appBinding.currentGame.game.address.wrappedValue)")
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
                Text("\(appBinding.currentGame.distance.wrappedValue) км")
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
                Text("\(appBinding.currentGame.game.costGame.wrappedValue) ₽")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular24)
                Spacer()
                
                
                HStack(alignment: .center, spacing: -20) {
                    ForEach(0..<5, id: \.self) { index in
                        Image(appBinding.currentGame.plugPhotoPlayers[index].wrappedValue)
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
    private func selectDate() -> String {
        if appBinding.currentGame.game.regularGame.wrappedValue == "yes" {
            return buildRegularGame()
        } else {
            let timeString = GetDateStringFromDate.shared.getTimeString(date: appBinding.currentGame.game.oneGameDate.wrappedValue)
                let dateString = GetDateStringFromDate.shared.getDateStringFull(date: appBinding.currentGame.game.oneGameDate.wrappedValue).firstUppercased
            return "\(dateString) в \(timeString)"
        }
    }
    
    private func buildRegularGame() -> String {
        var arrDate = [Date]()
        
        if appBinding.currentGame.game.mo.wrappedValue {
            arrDate.append(appBinding.currentGame.game.listDateRegularGame[0].wrappedValue)
        }
        
        if appBinding.currentGame.game.tu.wrappedValue {
            arrDate.append(appBinding.currentGame.game.listDateRegularGame[1].wrappedValue)
        }
        
        if appBinding.currentGame.game.we.wrappedValue {
            arrDate.append(appBinding.currentGame.game.listDateRegularGame[2].wrappedValue)
        }
        
        if appBinding.currentGame.game.th.wrappedValue {
            arrDate.append(appBinding.currentGame.game.listDateRegularGame[3].wrappedValue)
        }
        
        if appBinding.currentGame.game.fr.wrappedValue {
            arrDate.append(appBinding.currentGame.game.listDateRegularGame[4].wrappedValue)
        }
        
        if appBinding.currentGame.game.sa.wrappedValue {
            arrDate.append(appBinding.currentGame.game.listDateRegularGame[5].wrappedValue)
        }
        
        if appBinding.currentGame.game.su.wrappedValue {
            arrDate.append(appBinding.currentGame.game.listDateRegularGame[6].wrappedValue)
        }
        
        let nearDate = arrDate.sorted(by: { $0 > $1 })
        let timeString = GetDateStringFromDate.shared.getTimeString(date: nearDate.first!)
        let dateString = GetDateStringFromDate.shared.getDateStringFull(date: nearDate.first!).firstUppercased
        
        return "\(dateString) в \(timeString)"
    }
}

private extension CellMainView {
    private func typeGameString() -> String {
        if appBinding.currentGame.game.miniFootball.wrappedValue {
            return "Мини"
        }
        
        if appBinding.currentGame.game.usualFootball.wrappedValue {
            return "Футбол"
        }
        
        if appBinding.currentGame.game.footsal.wrappedValue {
            return "Футзал"
        }
        return ""
    }
}

private extension CellMainView {
    private func formatGame() -> String {
        return "\(appBinding.currentGame.game.firstTeamCount.wrappedValue) на \(appBinding.currentGame.game.secondTeamCount.wrappedValue)"
    }
}

private extension CellMainView {
    private func privacyGame() -> String {
        if appBinding.currentGame.game.privacyGame.wrappedValue == "open" {
            return "Для всех"
        }
        
        if appBinding.currentGame.game.privacyGame.wrappedValue == "close" {
            return "По заявке"
        }
        return ""
    }
}

struct CellMainView_Previews: PreviewProvider {
    static var previews: some View {
        CellMainView(appBinding: .constant(.init()))
    }
}
