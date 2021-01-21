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

                    TextViewTitlePlaceholder(text: appBinding.descriptionPlaying,
                                        placeholder: "Большое поле, разделенное на два с 4 прожекторами. Газон обновлялся два года назад в связи с подготовкой к ЧМ. Есть 4 типа ворот: большие, средние, мини-футбольные и для игры в панну.",
                                        title: "Описание площадки")
                    
                    TextViewTitlePlaceholder(text: appBinding.ownRules,
                                        placeholder: "Играем без подкатов. Любое попадание в руку считается нарушением. Вратарь не берет в руки от своих игроков.",
                                        title: "Свои правила")
                    
                    TextViewTitlePlaceholder(text: appBinding.commentFromOrganizer,
                                        placeholder: "Приходим за 10-15 минут. Игра начинается ровно в 21:30. Не задерживайте себя и других игроков!",
                                        title: "Комментарий от организатора")
                    
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
