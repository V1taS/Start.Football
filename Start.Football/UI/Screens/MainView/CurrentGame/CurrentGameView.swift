//
//  CurrentGameView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 30.11.2020.
//

import SwiftUI

struct CurrentGameView: View {
    private var appBinding: Binding<AppState.AppData>
    init(appBinding: Binding<AppState.AppData>) {
        self.appBinding = appBinding
    }
    @Environment(\.injected) private var injected: DIContainer
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.backgroundColor)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        HeaderCurrentGame(appBinding: appBinding)

                        VStack(spacing: 0) {
                            Group {
                                CellGameCurrentGame(appBinding: appBinding)
                                Divider()
                                WhoWillPlayCurrentGame(appBinding: appBinding)
                                CalendarCurrentGame(appBinding: appBinding)
                                Divider()
                                AboutCurrentGame()
                                Divider()
                                OrganizerCurrentGame()
                                Divider()
                            }
                            Group {
                                AboutTheAreaCurrentGame(appBinding: appBinding)
                                Divider()
                                RulesCurrentGame(appBinding: appBinding)
                                Divider()
                                CommentCurrentGame(appBinding: appBinding)
                                    .padding(.bottom, 16)
                                ADVCurrentGame()
                                    .padding(.bottom, 16)
                                ButtonsCurrentGame()
                                    .padding(.bottom, 24)
                            }
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                    }
                }
                
                .edgesIgnoringSafeArea(.all)
                .navigationBarTitle("Игра №\(appBinding.currentGame.game.gameNumber.wrappedValue)", displayMode: .large).accentColor(.primaryColor)
                
                                .navigationBarItems(trailing:
                                                        HStack(spacing: width * Size.shared.getAdaptSizeWidth(px: 16)) {
                                                            Button(action: {
                                                                self.viewController?.dismiss(animated: true)
                                                            }) {
                                                                Image("currenrGameEdit")
                                                                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 24),
                                                                           height: height * Size.shared.getAdaptSizeHeight(px: 24))
                                                            }
                
                                                            Button(action: {
                                                                self.viewController?.dismiss(animated: true)
                                                            }) {
                                                                Image("currenrGameVector")
                                                                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 24),
                                                                           height: height * Size.shared.getAdaptSizeHeight(px: 24))
                
                                                            }
                                                        }
                                )
                
            }
        }
    }
}

struct CurrentGameView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentGameView(appBinding: .constant(.init()))
    }
}
