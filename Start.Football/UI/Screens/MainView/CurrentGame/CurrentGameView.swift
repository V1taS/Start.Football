//
//  CurrentGameView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 30.11.2020.
//

import SwiftUI

struct CurrentGameView: View {
    
    private let game: Game
    init(game: Game) {
        self.game = game
    }
    
    @Environment(\.injected) private var injected: DIContainer
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.backgroundColor)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        HeaderCurrentGame(game: game)
                        
                        VStack(spacing: 0) {
                            Group {
                                CellGameCurrentGame(game: game)
                                Divider()
                                WhoWillPlayCurrentGame(game: game)
                                CalendarCurrentGame(game: game)
                                Divider()
                                AboutCurrentGame(game: game)
                                Divider()
                                OrganizerCurrentGame(game: game)
                                Divider()
                            }
                            Group {
                                AboutTheAreaCurrentGame(game: game)
                                Divider()
                                RulesCurrentGame(game: game)
                                Divider()
                                CommentCurrentGame(game: game)
                                ADVone()
                                    .padding(.bottom, 16)
                                ButtonsCurrentGame()
                            }
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .navigationBarItems(trailing:
                                        HStack(spacing: 16) {
                                            currenrGameEditButton
                                            currenrGameSendInviteButton
                                        })
            }
        }
    }
}


// MARK: UI
private extension CurrentGameView {
    private var currenrGameEditButton: AnyView {
        AnyView(
            Button(action: {
                currenrGameEditShow()
            }
            ) {
                Image("currenrGameEdit")
                    .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 24),
                           height: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 24))
            }
        )
    }
}

private extension CurrentGameView {
    private var currenrGameSendInviteButton: AnyView {
        AnyView(
            Button(action: {
                currenrGameSendInvite()
            }) {
                Image("currenrGameVector")
                    .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 24),
                           height: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 24))
            }
        )
    }
}


// MARK: Actions
private extension CurrentGameView {
    private func currenrGameEditShow() {
        self.viewController?.dismiss(animated: true)
    }
    
    private func currenrGameSendInvite() {
        self.viewController?.dismiss(animated: true)
    }
}

struct CurrentGameView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentGameView(game: .plugGame)
    }
}
