//
//  GameView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 25.11.2020.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }
    
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9725490196, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                HeaderMainView(selectionGame: $viewModel.selectionGame)
                MenuMainView(selectionGame: $viewModel.selectionGame)
                    .padding(.top, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 8))
                
                if viewModel.selectionGame == .allGame {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 16)) {

                            Button(action: {
                                    self.viewController?.present(style: .fullScreen) {
                                    CurrentGameView()
                                } }) { CellMenuView() }
                            
                            Button(action: {
                                self.viewController?.present(style: .fullScreen) {
                                    CurrentGameView()
                                } }) { CellMenuView() }
                            
                            Button(action: {
                                self.viewController?.present(style: .fullScreen) {
                                    CurrentGameView()
                                } }) { CellMenuView() }
                            
                            Button(action: {
                                self.viewController?.present(style: .fullScreen) {
                                    CurrentGameView()
                                } }) { CellMenuView() }
                            
                            Button(action: {}) { ADV()}
                            
                            Button(action: {
                                self.viewController?.present(style: .fullScreen) {
                                    CurrentGameView()
                                } }) { CellMenuView() }
                            
                            Button(action: {
                                self.viewController?.present(style: .fullScreen) {
                                    CurrentGameView()
                                } }) { CellMenuView() }
                            
                        } .padding(.vertical, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 16))
                    }
                } else if viewModel.selectionGame == .myGames {
                    VStack {
                        ScrollView(.vertical, showsIndicators: false) {
                            Plug()
                        }
                    }
                } else if viewModel.selectionGame == .map {
                    VStack {
                        MapGameView()
                    } .padding(.vertical, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 4))
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct HeaderMainView: View {
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    @Binding var selectionGame: SelectionGame
    
    var body: some View {
        HStack {
            Button(action: {
                self.viewController?.present(style: .fullScreen) {
                    ProfileView() }
            }) {
                HStack(spacing: 13) {
                    Image("test")
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFill()
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 48),
                               height: height * Size.shared.getAdaptSizeHeight(px: 48))
                    
                    VStack(alignment: .leading,
                           spacing: height * Size.shared.getAdaptSizeHeight(px: 2)){
                        Text("Владислав")
                            .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                            .font(Font.event.robotoBold20)
                            .lineLimit(1)
                    } .frame(width: width * Size.shared.getAdaptSizeWidth(px: 180),
                             height: height * Size.shared.getAdaptSizeHeight(px: 50),
                             alignment: .leading)
                }
            }
            Spacer()
            HStack(spacing: width * Size.shared.getAdaptSizeWidth(px: 16)) {
                Button(action: { selectionGame = .map }) {
                    Image(selectionGame == .map ?
                            "map_active" :
                            "map_turnedOff")
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                }
                Button(action: {}) {
                    Image("filter")
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                }
            }
        }
        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
    }
}

struct MenuMainView: View {
    
    @Binding var selectionGame: SelectionGame
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        VStack {
            Divider()
                .offset(y: 39)
            HStack {
                VStack(spacing: 9) {
                    Button(action: {selectionGame = .allGame}) {
                        Text("Все игры")
                            .font(selectionGame == .allGame ?
                                    Font.event.robotoMedium16 :
                                    Font.event.robotoRegular16)
                            .foregroundColor(selectionGame == .allGame ?
                                                Color(#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)) :
                                                Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                            .fontWeight(selectionGame == .allGame ?
                                            .bold :
                                            .regular)
                    }
                    Color(selectionGame == .allGame ? (#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0))
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 80),
                               height: height * Size.shared.getAdaptSizeHeight(px: 2),
                               alignment: .center)
                }
                Spacer()
                VStack(spacing: 9) {
                    Button(action: {selectionGame = .myGames}) {
                        Text("Мои игры")
                            .font(selectionGame == .myGames ?
                                    Font.event.robotoMedium16 :
                                    Font.event.robotoRegular16)
                            .foregroundColor(selectionGame == .myGames ? Color(#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)) : Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                            .fontWeight(selectionGame == .myGames ? .bold : .regular)
                    }
                    Color(selectionGame == .myGames ? (#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0))
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 80),
                               height: height * Size.shared.getAdaptSizeHeight(px: 2),
                               alignment: .center)
                }
            }
            .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 64))
        }
    }
}

struct CellMenuView: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(#colorLiteral(red: 0.9450980392, green: 0.9490196078, blue: 0.9490196078, alpha: 1))))
            
            VStack(alignment: .leading,
                   spacing: 0) {
                

                VStack(alignment: .leading,
                       spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                    
                    Text("Тренировка в ФОК Отрадное")
                        .font(Font.event.robotoBold20)
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                    HStack(spacing: width * Size.shared.getAdaptSizeWidth(px: 10)) {
                        Image("cellDate")
                        Text("30 августа, 16:00-18:00")
                            .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                            .font(Font.event.robotoRegular16)
                    }
                    HStack(spacing: width * Size.shared.getAdaptSizeWidth(px: 10)) {
                        Image("cellLocator")
                        Text("ул. Хачтуряна, 12, стр. 2")
                            .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                            .font(Font.event.robotoRegular16)
                        Spacer()
                        Text("5,2 км")
                            .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                            .font(Font.event.robotoRegular16)
                    }
                    HStack(spacing: width * Size.shared.getAdaptSizeWidth(px: 10)) {
                        Image("cellMoney")
                        Text("500 ₽")
                            .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                            .font(Font.event.robotoRegular24)
                        Spacer()
                        HStack(alignment: .center, spacing: -20) {
                            Image("p5")
                                .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0))
                            Image("p4")
                                .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0))
                            Image("p3")
                                .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0))
                            Image("p2")
                                .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0))
                            Image("p1")
                                .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0))
                        }
                    }
                } .padding(.bottom, height * Size.shared.getAdaptSizeHeight(px: 16))
                
                HStack {
                    Text("Мини-футбол")
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .font(Font.event.robotoRegular16)
                        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                        .overlay(RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1))))
                    
                    Spacer(minLength: width * Size.shared.getAdaptSizeWidth(px: 6))
                    
                    Text("10 на 10")
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .font(Font.event.robotoRegular16)
                        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                        .overlay(RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1))))
                    
                    Spacer(minLength: width * Size.shared.getAdaptSizeWidth(px: 6))
                    
                    Text("По заявке")
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .font(Font.event.robotoRegular16)
                        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                        .overlay(RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1))))
                }
            }
            .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
            .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 16))
        }
        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 343),
               height: height * Size.shared.getAdaptSizeHeight(px: 252))
    }
}