//
//  CreateGameStepFour.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CreateGameStepFour: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    private var appBinding: Binding<AppState.AppData.CreateGame>
    
    init(appBinding: Binding<AppState.AppData.CreateGame>) {
        self.appBinding = appBinding
    }
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                VStack(spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                    
                    TextviewOneLineView(text: appBinding.descriptionPlaying,
                                        title: "Описание площадки",
                                        heightTextView: 120)
                    
                    TextviewOneLineView(text: appBinding.ownRules,
                                        title: "Свои правила",
                                        heightTextView: 70)

                    TextviewOneLineView(text: appBinding.commentFromOrganizer,
                                        title: "Комментарий от организатора",
                                        heightTextView: 70)
                    
                    HStack {
                        ImageViewMiniCG(image: "CGfield_1")
                        Spacer()
                        ImageViewMiniCG(image: "CGfield_2")
                    }
                    
                    Button(action: {}) {
                        ButtonView(background: .tertiary,
                                   textColor: .whiteColor,
                                   borderColor: .tertiary,
                                   text: "Добавить фото площадки",
                                   switchImage: true,
                                   image: "CGphoto")
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 32))
        }
    }
}

struct CreateGameStepFour_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameStepFour(appBinding: .constant(.init()))
    }
}
