//
//  PageView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 23.11.2020.
//

import SwiftUI

struct PageView: View {
    
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
            
            VStack(spacing: 0) {
                Image("pageViewImage")
                    .frame(width: UIScreen.screenWidth, height: height / 2)
                
                VStack(spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                    VStack {
                        Text("Мы хотим популяризировать футбол в ")
                            .font(Font.event.robotoRegular16)
                            .lineLimit(1)
                            .foregroundColor(.secondaryColor)
                        Text("России и сделать его доступнее.")
                            .font(Font.event.robotoRegular16)
                            .lineLimit(1)
                            .foregroundColor(.secondaryColor)
                    }
                    
                    VStack {
                        Text("С помощью этого приложения вы найдете")
                            .font(Font.event.robotoRegular16)
                            .lineLimit(1)
                            .foregroundColor(.secondaryColor)
                        Text("площадки и людей, которые хотят поиграть")
                            .font(Font.event.robotoRegular16)
                            .lineLimit(1)
                            .foregroundColor(.secondaryColor)
                        Text("в футбол в вашем городе.")
                            .font(Font.event.robotoRegular16)
                            .lineLimit(1)
                            .foregroundColor(.secondaryColor)
                    }
                }
                Spacer()
                
                Button(action: {
                    self.viewController?.present(style: .fullScreen) {
                        AuthView()
                    }
                }) {
                    ButtonView(background: .primaryColor,
                               textColor: .whiteColor,
                               borderColor: .primaryColor,
                               text: "Давай начнем!")
                } .onAppear {
                    UserDefaults.standard.set(true, forKey: "tabViewApp")
                }
                .padding(.bottom, height * Size.shared.getAdaptSizeHeight(px: 17))
            }
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView()
    }
}
