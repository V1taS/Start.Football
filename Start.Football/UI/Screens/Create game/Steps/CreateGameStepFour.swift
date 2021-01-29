//
//  CreateGameStepFour.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CreateGameStepFour: View {
    
    private var appBinding: Binding<AppState.AppData>
    init(appBinding: Binding<AppState.AppData>) {
        self.appBinding = appBinding
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 16) {
                descriptionPlaying
                ownRules
                commentFromOrganizer
                
                HStack {
                    ImageViewMiniCG(image: "CGfield_1")
                    Spacer()
                    ImageViewMiniCG(image: "CGfield_2")
                }
                
                addPhotoFieldButton
                Spacer()
            }
            .padding(.horizontal, 24)
        }
        .dismissingKeyboard()
        .padding(.top, 16)
    }
}


// MARK: UI
private extension CreateGameStepFour {
    private var descriptionPlaying: AnyView {
        AnyView(
            TextViewTitlePlaceholder(text: appBinding.createGame.descriptionGame,
                                     placeholder: "Большое поле, разделенное на два с 4 прожекторами. Газон обновлялся два года назад в связи с подготовкой к ЧМ. Есть 4 типа ворот: большие, средние, мини-футбольные и для игры в панну.",
                                     title: "Описание площадки")
        )
    }
}

private extension CreateGameStepFour {
    private var ownRules: AnyView {
        AnyView(
            TextViewTitlePlaceholder(text: appBinding.createGame.ownRules,
                                     placeholder: "Играем без подкатов. Любое попадание в руку считается нарушением. Вратарь не берет в руки от своих игроков.",
                                     title: "Свои правила")
        )
    }
}

private extension CreateGameStepFour {
    private var commentFromOrganizer: AnyView {
        AnyView(
            TextViewTitlePlaceholder(text: appBinding.createGame.commentFromOrganizer,
                                     placeholder: "Приходим за 10-15 минут. Игра начинается ровно в 21:30. Не задерживайте себя и других игроков!",
                                     title: "Комментарий от организатора")
        )
    }
}

private extension CreateGameStepFour {
    private var addPhotoFieldButton: AnyView {
        AnyView(
            Button(action: {
                addPhotoField()
            }) {
                ButtonView(background: .tertiary,
                           textColor: .whiteColor,
                           borderColor: .tertiary,
                           text: "Добавить фото площадки",
                           switchImage: true,
                           image: "CGphoto")
            }
        )
    }
}


// MARK: Actions
private extension CreateGameStepFour {
    private func addPhotoField() {
        
    }
}

struct CreateGameStepFour_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameStepFour(appBinding: .constant(.init()))
    }
}
