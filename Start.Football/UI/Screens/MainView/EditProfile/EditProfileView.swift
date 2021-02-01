//
//  EditProfileView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 01.02.2021.
//

import SwiftUI

struct EditProfileView: View {
    
    @State private var appState: AppState.AppData = .init()
    private var appBinding: Binding<AppState.AppData> {
        $appState.dispatched(to: injected.appState, \.appData)
    }
    @Environment(\.injected) private var injected: DIContainer
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }
    
    private let player: Player
    init(player: Player) {
        self.player = player
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    image
                        .sheet(isPresented: appBinding.editProfile.showImagePicker, onDismiss: {
                            appBinding.editProfile.showImagePicker.wrappedValue = false
                        }, content: {
                            ImagePicker(isShown: appBinding.editProfile.showImagePicker,
                                        uiImage: appBinding.editProfile.uiImage)
                        })
                        .actionSheet(isPresented: appBinding.editProfile.showAction) {
                            sheet
                        }
                    
                    VStack(alignment: .leading, spacing: 24) {
                        Text("Основная информация")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoBold13)
                        
                        Group {
                            namePlayer
                            surnamePlayer
                            cityPlayer
                            dateOfbirthPlayer
                            genderPlayer
                            wightPlayer
                            growthPlayer
                            aboutMySelfPlayer
                            positionPlayer
                            contactsPlayer
                        }
                        
                        VStack(alignment: .center, spacing: 16) {
                            saveButton
                            deletetButton
                        }
                        .padding(.top, 8)
                        
                        
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 32)
                }
                .navigationBarTitle(Text("Редактирование игрока"), displayMode: .inline)
                .navigationBarItems(leading: HStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            self.viewController?.dismiss(animated: true, completion: nil)
                        }) {
                            ZStack {
                                Image(systemName: "xmark.circle.fill")
                                    .imageScale(.large)
                                    .foregroundColor(Color(.primaryColor))
                            }
                            
                        }
                    }
                })
            }
        }
    }
}

private extension EditProfileView {
    private var image: AnyView {
        AnyView(
            VStack {
                if (appBinding.editProfile.uiImage.wrappedValue == nil) {
                    Image(systemName: "camera.on.rectangle")
                        .foregroundColor(.white)
                        .font(.title)
                        .padding(20)
                        .background(Color.primaryColor)
                        .cornerRadius(20)
                        .frame(width: 375, height: 416)
                        .background(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .onTapGesture {
                            appBinding.editProfile.showImagePicker.wrappedValue = true
                        }
                } else {
                    
                    ZStack {
                        Image(uiImage: appBinding.editProfile.uiImage.wrappedValue!)
                            .resizable()

                        Rectangle()
                            .foregroundColor(.clear)
                            .background(LinearGradient(gradient: Gradient(colors: [.clear, .secondaryColor]), startPoint: .top, endPoint: .bottom))
                    }
                    .frame(width: 375, height: 416)
                        .onTapGesture {
                            appBinding.editProfile.showAction.wrappedValue = true
                        }
                }
            }
        )
    }
}

private extension EditProfileView {
    var sheet: ActionSheet {
        ActionSheet(
            title: Text("Фото футбольного поля"),
            message: Text("добавить"),
            buttons: [
                .default(Text("Изменить"), action: {
                    appBinding.editProfile.showAction.wrappedValue = false
                    appBinding.editProfile.showImagePicker.wrappedValue = true
                }),
                .cancel(Text("Отмена"), action: {
                    appBinding.editProfile.showAction.wrappedValue = false
                }),
                .destructive(Text("Удалить"), action: {
                    appBinding.editProfile.showAction.wrappedValue = false
                    appBinding.editProfile.uiImage.wrappedValue = nil
                })
            ])
    }
}

private extension EditProfileView {
    var namePlayer: some View {
        TextfieldOneLineView(text: appBinding.editProfile.name,
                             title: "Имя",
                             icon: "",
                             iconShow: false,
                             placeholder: "Имя",
                             keyboardType: .default,
                             success: true)
    }
}

private extension EditProfileView {
    var surnamePlayer: some View {
        TextfieldOneLineView(text: appBinding.editProfile.name,
                             title: "Фамилия",
                             icon: "",
                             iconShow: false,
                             placeholder: "Фамилия",
                             keyboardType: .default,
                             success: true)
    }
}

private extension EditProfileView {
    var cityPlayer: some View {
        TextfieldOneLineView(text: appBinding.editProfile.name,
                             title: "Город",
                             icon: "",
                             iconShow: false,
                             placeholder: "Город",
                             keyboardType: .default,
                             success: true)
    }
}

private extension EditProfileView {
    var dateOfbirthPlayer: some View {
        TextfieldOneLineView(text: appBinding.editProfile.name,
                             title: "Дата рождения",
                             icon: "",
                             iconShow: false,
                             placeholder: "Дата рождения",
                             keyboardType: .default,
                             success: true)
    }
}

private extension EditProfileView {
    var genderPlayer: some View {
        TextfieldOneLineView(text: appBinding.editProfile.name,
                             title: "Пол",
                             icon: "",
                             iconShow: false,
                             placeholder: "Пол",
                             keyboardType: .default,
                             success: true)
    }
}

private extension EditProfileView {
    var wightPlayer: some View {
        TextfieldOneLineView(text: appBinding.editProfile.name,
                             title: "Вес",
                             icon: "",
                             iconShow: false,
                             placeholder: "Вес",
                             keyboardType: .default,
                             success: true)
    }
}

private extension EditProfileView {
    var growthPlayer: some View {
        TextfieldOneLineView(text: appBinding.editProfile.name,
                             title: "Рост",
                             icon: "",
                             iconShow: false,
                             placeholder: "Рост",
                             keyboardType: .default,
                             success: true)
    }
}

private extension EditProfileView {
    var aboutMySelfPlayer: some View {
        TextfieldOneLineView(text: appBinding.editProfile.name,
                             title: "О себе",
                             icon: "",
                             iconShow: false,
                             placeholder: "О себе",
                             keyboardType: .default,
                             success: true)
    }
}

private extension EditProfileView {
    var positionPlayer: some View {
        VStack {
            VStack(alignment: .leading, spacing: 24) {
                Text("Позиция и игровой номер")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoBold13)
                
                HStack {
                    VStack(alignment: .leading, spacing: 16) {
                        CheckboxFieldView(checked: appBinding.signUpAuth.receiveNews,
                                          text: "Нападающий")
                        CheckboxFieldView(checked: appBinding.signUpAuth.receiveNews,
                                          text: "Полузащитник")
                        CheckboxFieldView(checked: appBinding.signUpAuth.receiveNews,
                                          text: "Защитник")
                        CheckboxFieldView(checked: appBinding.signUpAuth.receiveNews,
                                          text: "Вратарь")
                    }
                    Spacer()
                    VStack {
                        TextFieldUIKit(placeholder: "17",
                                       text: appBinding.editProfile.tShirtNumber,
                                       font: UIFont.event.robotoLight48!,
                                       foregroundColor: .secondaryColor,
                                       keyType: .numberPad,
                                       isSecureText: false)
                            .frame(width: 55)
                            .padding(35)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.secondaryColor))
                    }
                }
            }
        }
    }
}

private extension EditProfileView {
    var contactsPlayer: some View {
        VStack {
            VStack(alignment: .leading, spacing: 32) {
                Text("Контакты")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoBold13)
                
                TextfieldOneLineView(text: appBinding.editProfile.name,
                                     title: "Телефон",
                                     icon: "",
                                     iconShow: false,
                                     placeholder: "Телефон",
                                     keyboardType: .default,
                                     success: true)
                
                TextfieldOneLineView(text: appBinding.editProfile.name,
                                     title: "E-mail",
                                     icon: "",
                                     iconShow: false,
                                     placeholder: "E-mail",
                                     keyboardType: .default,
                                     success: true)
            }
            .padding(.top, 24)
        }
    }
}

private extension EditProfileView {
    var saveButton: some View {
        ButtonView(background: .primaryColor,
                   textColor: .whiteColor,
                   borderColor: .primaryColor,
                   text: "Сохранить изменения",
                   switchImage: false,
                   image: "")
    }
}

private extension EditProfileView {
    var deletetButton: some View {
        ButtonCancel(text: "Удалить профиль")
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(player: Player.plugPlayer)
    }
}
