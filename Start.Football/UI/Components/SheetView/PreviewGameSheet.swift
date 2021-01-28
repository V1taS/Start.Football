//
//  BottomSheet.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct PreviewGameSheet: View {
    
    var game: Game
    @Binding var isSheetActive: Bool
    @State private var viewState = CGSize.zero
    var isExpanded: Bool {
        isSheetActive
    }
    private let height = UIScreen.screenHeight
    private let width = UIScreen.screenWidth
    @Environment(\.injected) private var injected: DIContainer
    
    var body: some View {
        ZStack{
            closeButton
            
            if isSheetActive {
                VStack(spacing: 0) {
                    shotDivider
                    gameType
                    VStack(alignment: .leading, spacing: 16) {
                        header
                        dateView
                        streetGame
                        coastAndPeople
                    }
                    .padding(.top, 16)
                    button
                }
            }
        }
        .padding(.all, 24)
        .background(Color(.backgroundColor))
        .cornerRadius(25)
        .shadow(color: Color(.black)
                    .opacity(self.viewState.height == 0 ? 0.2 : 0),
                radius: 5)
        .offset(y: offset())
        .zIndex(isExpanded ? 1 : 0)
        .gesture(
            DragGesture().onChanged { value in
                self.viewState = value.translation
            }
            .onEnded(onDragEnded)
        )
        .animation(.easeInOut)
        .frame(width: width,
               height: height * Size.shared.getAdaptSizeHeight(px: 340))
    }
}

// MARK: UI
private extension PreviewGameSheet {
    private var closeButton: AnyView {
        AnyView(
            VStack(spacing: 0) {
                if isExpanded {
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                self.collapse()
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .imageScale(.large)
                                    .foregroundColor(Color(.secondaryLabel))
                            }
                        }
                        Spacer()
                    }
                }
            }
        )
    }
}

private extension PreviewGameSheet {
    private var shotDivider: AnyView {
        AnyView(
            Color(.shotDividerColor)
                .frame(width: 48, height: 5)
                .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(.shotDividerColor)))
                .offset(y: -15)
        )
    }
}

private extension PreviewGameSheet {
    private var gameType: AnyView {
        AnyView(
                HStack {
                    TextButtonRound(name: "Зал",
                                    isOn: game.hall,
                                    backgroundColor: .primaryColor)
                    
                    TextButtonRound(name: "Манеж",
                                    isOn: game.manege,
                                    backgroundColor: .primaryColor)
                    
                    TextButtonRound(name: "Улица",
                                    isOn: game.street,
                                    backgroundColor: .primaryColor)
                    Spacer()
                }
                .padding(.top, 32)
        )
    }
}

private extension PreviewGameSheet {
    private var header: AnyView {
        AnyView(
            Text(game.name)
                .font(Font.event.robotoBold20)
                .foregroundColor(.secondaryColor)
        )
    }
}

private extension PreviewGameSheet {
    private var dateView: AnyView {
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

private extension PreviewGameSheet {
    private var streetGame: AnyView {
        AnyView(
            HStack(spacing: 10) {
                Image("cellLocator")
                Text("\(game.address)")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                    .lineLimit(2)
                Spacer()
                distance
            }
        )
    }
}

private extension PreviewGameSheet {
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

private extension PreviewGameSheet {
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

private extension PreviewGameSheet {
    private var button: AnyView {
        AnyView(
            Button(action: {}) {
                ButtonView(background: .primaryColor,
                           textColor: .whiteColor,
                           borderColor: .primaryColor,
                           text: "Подробнее об игре",
                           switchImage: false,
                           image: "")
            }
            .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 24))
        )
    }
}


// MARK: Actions
private extension PreviewGameSheet {
    private func selectDate(regularGame: String, oneGameDate: Date) -> String {
        if regularGame == "yes" {
            return searchDateForRegular(game: game)
        } else {
            return searchDateForOneDay(game: game, oneGameDate: oneGameDate)
        }
    }
    
    private func searchDateForRegular(game: Game) -> String {
        injected.interactors.mainAppInteractor
            .searchDateForRegular(game: game)
    }
    
    private func searchDateForOneDay(game: Game, oneGameDate: Date) -> String {
        injected.interactors.mainAppInteractor
            .searchDateForOneDay(game: game, oneGameDate: oneGameDate)
    }
    
    private func onDragEnded(drag: DragGesture.Value) {
        self.viewState = .zero
        let direction = drag.predictedEndLocation.y - drag.location.y
        
        if direction > 0 {
            self.collapse()
        } else {
            self.expand()
        }
    }
    
    private func offset()  -> CGFloat {
        var offset: CGFloat = 0
        if self.isExpanded {
            offset = 0 + self.viewState.height
        } else {
            offset = 500 + self.viewState.height
        }
        
        return offset < 0 ? 0 : offset > 500 ? 500 : offset
    }
    
    private func collapse() {
        self.isSheetActive = false
    }
    
    private func expand() {
        self.isSheetActive = false
    }
}

struct BottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        PreviewGameSheet(game: .plugGame, isSheetActive: .constant(true))
    }
}
