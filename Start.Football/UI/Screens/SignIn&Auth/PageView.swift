//
//  PageView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 23.11.2020.
//

import SwiftUI

struct PageView: View {
    
    private var appBinding: Binding<AppState.AppData>
    init(appBinding: Binding<AppState.AppData>) {
        self.appBinding = appBinding
    }
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }
    
    var body: some View {
        ZStack {
            Color(.backgroundColor)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16) {
                Image("pageViewImage")
                text
                Spacer()
                startButton
            }
        }
        .padding(.horizontal, 24)
    }
}

// MARK: UI
private extension PageView {
    private var text: AnyView {
        AnyView(
            VStack(spacing: 16) {
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
        )
    }
}

private extension PageView {
    private var startButton: AnyView {
        AnyView(
            Button(action: {
                presentNextView()
            }) {
                ButtonView(background: .primaryColor,
                           textColor: .whiteColor,
                           borderColor: .primaryColor,
                           text: "Давай начнем!",
                           switchImage: false,
                           image: "")
            }
            .padding(.bottom, 17)
            .onAppear {
                UserDefaults.standard.set(true, forKey: "pageView")
            }
        )
    }
}

// MARK: Actions
private extension PageView {
    private func presentNextView() {
        self.viewController?.present(style: .fullScreen) {
            AuthView(appBinding: appBinding)
        }
    }
}


struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(appBinding: .constant(.init()))
    }
}
