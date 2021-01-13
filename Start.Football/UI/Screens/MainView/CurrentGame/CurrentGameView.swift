//
//  CurrentGameView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 30.11.2020.
//

import SwiftUI

struct CurrentGameView: View {
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        ZStack {
            Color(.backgroundColor)
                .edgesIgnoringSafeArea(.all)
            
            NavigationView {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        HeaderCurrentGame()
                        VStack(spacing: 0) {
                            Group {
                                CellGameCurrentGame()
                                Divider()
                                WhoWillPlayCurrentGame()
                                CalendarCurrentGame()
                                Divider()
                                AboutCurrentGame()
                                Divider()
                                OrganizerCurrentGame()
                                Divider()
                            }
                            Group {
                                AboutTheAreaCurrentGame()
                                Divider()
                                RulesCurrentGame()
                                Divider()
                                CommentCurrentGame()
                                ADVCurrentGame()
                                ButtonsCurrentGame()
                            }
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                    }
                }
                
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
        CurrentGameView()
    }
}
