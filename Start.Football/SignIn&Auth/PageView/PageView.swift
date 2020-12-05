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
    
    var body: some View {
        VStack(spacing: 0) {
            Image("pageViewImage")
                .resizable()
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 2)
                .edgesIgnoringSafeArea(.top)
                .padding(.bottom, 20)
                
            VStack(spacing: 16) {
                VStack {
                    Text("Мы хотим популяризировать футбол в ")
                        .font(Font.event.robotoRegular16)
                        .lineLimit(1)
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019608, green: 0.2745098039, blue: 0.3411764706, alpha: 1)))
                    Text("России и сделать его доступнее.")
                        .font(Font.event.robotoRegular16)
                        .lineLimit(1)
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019608, green: 0.2745098039, blue: 0.3411764706, alpha: 1)))
                }
                
                VStack {
                    Text("С помощью этого приложения вы найдете")
                        .font(Font.event.robotoRegular16)
                        .lineLimit(1)
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019608, green: 0.2745098039, blue: 0.3411764706, alpha: 1)))
                    Text("площадки и людей, которые хотят поиграть")
                        .font(Font.event.robotoRegular16)
                        .lineLimit(1)
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019608, green: 0.2745098039, blue: 0.3411764706, alpha: 1)))
                    Text("в футбол в вашем городе.")
                        .font(Font.event.robotoRegular16)
                        .lineLimit(1)
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019608, green: 0.2745098039, blue: 0.3411764706, alpha: 1)))
                }
            }
            Spacer()
            
            Button(action: {
                self.viewController?.present(style: .fullScreen) {
                    AuthView()
                }
            }) {
                ButtonView(background: #colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1),
                           textColor: .white,
                           borderColor: #colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1),
                           text: "Давай начнем!")
            } .onAppear {
                UserDefaults.standard.set(true, forKey: "tabViewApp")
            }
            .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 17))
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView()
    }
}
