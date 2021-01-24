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
                Text("\(appBinding.currentGame.nameGame.wrappedValue)")
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
                Text("\(appBinding.currentGame.addressGame.wrappedValue)")
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
                Text("\(appBinding.currentGame.costGame.wrappedValue) ₽")
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
        if appBinding.currentGame.regularGame.wrappedValue == .yes {
            return buildRegularGame()
        } else {
                let timeString = GetDateStringFromDate.shared.getTimeString(date: appBinding.currentGame.oneGame.wrappedValue)
                let dateString = GetDateStringFromDate.shared.getDateStringFull(date: appBinding.currentGame.oneGame.wrappedValue).firstUppercased
            return "\(dateString) в \(timeString)"
        }
    }
    
    private func buildRegularGame() -> String {
        var arrDate = [Date]()
        
        if appBinding.currentGame.mo.wrappedValue {
            arrDate.append(appBinding.currentGame.listDate[0].wrappedValue)
        }
        
        if appBinding.currentGame.tu.wrappedValue {
            arrDate.append(appBinding.currentGame.listDate[1].wrappedValue)
        }
        
        if appBinding.currentGame.we.wrappedValue {
            arrDate.append(appBinding.currentGame.listDate[2].wrappedValue)
        }
        
        if appBinding.currentGame.th.wrappedValue {
            arrDate.append(appBinding.currentGame.listDate[3].wrappedValue)
        }
        
        if appBinding.currentGame.fr.wrappedValue {
            arrDate.append(appBinding.currentGame.listDate[4].wrappedValue)
        }
        
        if appBinding.currentGame.sa.wrappedValue {
            arrDate.append(appBinding.currentGame.listDate[5].wrappedValue)
        }
        
        if appBinding.currentGame.su.wrappedValue {
            arrDate.append(appBinding.currentGame.listDate[6].wrappedValue)
        }
        
        let nearDate = arrDate.sorted(by: { $0 > $1 })
        let timeString = GetDateStringFromDate.shared.getTimeString(date: nearDate.first!)
        let dateString = GetDateStringFromDate.shared.getDateStringFull(date: nearDate.first!).firstUppercased
        
        return "\(dateString) в \(timeString)"
    }
}

private extension CellMainView {
    private func typeGameString() -> String {
        if appBinding.currentGame.miniFootball.wrappedValue {
            return "Мини"
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

private extension CellMainView {
    private func formatGame() -> String {
        return "\(appBinding.currentGame.firstValue.wrappedValue) на \(appBinding.currentGame.secondValue.wrappedValue)"
    }
}

private extension CellMainView {
    private func privacyGame() -> String {
        if appBinding.currentGame.privacyGame.wrappedValue == .open {
            return "Для всех"
        }
        
        if appBinding.currentGame.privacyGame.wrappedValue == .close {
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
