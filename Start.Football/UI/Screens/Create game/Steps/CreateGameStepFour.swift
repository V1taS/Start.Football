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
                    imageOne
                        .sheet(isPresented: appBinding.createGame.showImagePickerOne, onDismiss: {
                            appBinding.createGame.showImagePickerOne.wrappedValue = false
                        }, content: {
                            ImagePicker(isShown: appBinding.createGame.showImagePickerOne,
                                        uiImage: appBinding.createGame.uiImageOne)
                        })
                        .actionSheet(isPresented: appBinding.createGame.showActionOne) {
                            sheetOne
                        }
                    Spacer()
                    imageTwo
                        .sheet(isPresented: appBinding.createGame.showImagePickerTwo, onDismiss: {
                            appBinding.createGame.showImagePickerTwo.wrappedValue = false
                        }, content: {
                            ImagePicker(isShown: appBinding.createGame.showImagePickerTwo,
                                        uiImage: appBinding.createGame.uiImageTwo)
                        })
                        .actionSheet(isPresented: appBinding.createGame.showActionTwo) {
                            sheetTwo
                        }
                }
                .padding(.top, 16)
                Spacer()
            }
            .padding(.horizontal, 24)
        }

        
        .keyboardAware()
        .dismissingKeyboard()
        .padding(.top, 24)
    }
}


// MARK: UI
private extension CreateGameStepFour {
    private var imageOne: AnyView {
        AnyView(
            VStack {
                if (appBinding.createGame.uiImageOne.wrappedValue == nil) {
                    Image(systemName: "camera.on.rectangle")
                        .font(.title)
                        .frame(width: 155, height: 155)
                        .accentColor(Color.purple)
                        .background(Color.gray)
                        .cornerRadius(16)
                        .onTapGesture {
                            appBinding.createGame.showImagePickerOne.wrappedValue = true
                        }
                } else {
                    Image(uiImage: appBinding.createGame.uiImageOne.wrappedValue!)
                        .resizable()
                        .frame(width: 155, height: 155)
                        .cornerRadius(16)
                        .onTapGesture {
                            appBinding.createGame.showActionOne.wrappedValue = true
                        }
                }
            }
        )
    }
}

private extension CreateGameStepFour {
    var sheetOne: ActionSheet {
        ActionSheet(
            title: Text("Фото футбольного поля"),
            message: Text("добавить"),
            buttons: [
                .default(Text("Изменить"), action: {
                    appBinding.createGame.showActionOne.wrappedValue = false
                    appBinding.createGame.showImagePickerOne.wrappedValue = true
                }),
                .cancel(Text("Отмена"), action: {
                    appBinding.createGame.showActionOne.wrappedValue = false
                }),
                .destructive(Text("Удалить"), action: {
                    appBinding.createGame.showActionOne.wrappedValue = false
                    appBinding.createGame.uiImageOne.wrappedValue = nil
                })
            ])
    }
}

private extension CreateGameStepFour {
    var sheetTwo: ActionSheet {
        ActionSheet(
            title: Text("Фото футбольного поля"),
            message: Text("добавить"),
            buttons: [
                .default(Text("Изменить"), action: {
                    appBinding.createGame.showActionTwo.wrappedValue = false
                    appBinding.createGame.showImagePickerTwo.wrappedValue = true
                }),
                .cancel(Text("Отмена"), action: {
                    appBinding.createGame.showActionTwo.wrappedValue = false
                }),
                .destructive(Text("Удалить"), action: {
                    appBinding.createGame.showActionTwo.wrappedValue = false
                    appBinding.createGame.uiImageTwo.wrappedValue = nil
                })
            ])
    }
}

private extension CreateGameStepFour {
    private var imageTwo: AnyView {
        AnyView(
            VStack {
                if (appBinding.createGame.uiImageTwo.wrappedValue == nil) {
                    Image(systemName: "camera.on.rectangle")
                        .font(.title)
                        .frame(width: 155, height: 155)
                        .accentColor(Color.purple)
                        .background(Color.gray)
                        .cornerRadius(16)
                        .onTapGesture {
                            appBinding.createGame.showImagePickerTwo.wrappedValue = true
                        }
                } else {
                    Image(uiImage: appBinding.createGame.uiImageTwo.wrappedValue!)
                        .resizable()
                        .frame(width: 155, height: 155)
                        .cornerRadius(16)
                        .onTapGesture {
                            appBinding.createGame.showActionTwo.wrappedValue = true
                        }
                }
            }
        )
    }
}

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
