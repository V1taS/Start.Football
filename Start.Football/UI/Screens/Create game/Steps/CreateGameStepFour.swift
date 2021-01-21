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
                    
//                    TextView(placeholder: "Большое поле, разделенное на два с 4 прожекторами. Газон обновлялся два года назад в связи с подготовкой к ЧМ. Есть 4 типа ворот: большие, средние, мини-футбольные и для игры в панну.",
//                             text: appBinding.descriptionPlaying)
//
//                    TextView(placeholder: "Играем без подкатов. Любое попадание в руку считается нарушением. Вратарь не берет в руки от своих игроков.",
//                             text: appBinding.ownRules)
//
//                    TextView(placeholder: "Приходим за 10-15 минут. Игра начинается ровно в 21:30. Не задерживайте себя и других игроков!",
//                             text: appBinding.commentFromOrganizer)
                    
                    
                    
                    TextviewOneLineView(text: appBinding.descriptionPlaying,
                                        placeholder: "Большое поле, разделенное на два с 4 прожекторами. Газон обновлялся два года назад в связи с подготовкой к ЧМ. Есть 4 типа ворот: большие, средние, мини-футбольные и для игры в панну.",
                                        title: "Описание площадки")
                    
                    TextviewOneLineView(text: appBinding.ownRules,
                                        placeholder: "Играем без подкатов. Любое попадание в руку считается нарушением. Вратарь не берет в руки от своих игроков.",
                                        title: "Свои правила")
                    
                    TextviewOneLineView(text: appBinding.commentFromOrganizer,
                                        placeholder: "Приходим за 10-15 минут. Игра начинается ровно в 21:30. Не задерживайте себя и других игроков!",
                                        title: "Комментарий от организатора")
//
//                    TextviewOneLineView(text: appBinding.descriptionPlaying,
//                                        title: "Описание площадки",
//                                        heightTextView: 120)
//
//                    TextviewOneLineView(text: appBinding.ownRules,
//                                        title: "Свои правила",
//                                        heightTextView: 70)
//
//                    TextviewOneLineView(text: appBinding.commentFromOrganizer,
//                                        title: "Комментарий от организатора",
//                                        heightTextView: 70)
                    
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
