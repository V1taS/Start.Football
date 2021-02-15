//
//  EditProfileView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 01.02.2021.
//

import SwiftUI

struct EditProfileView: View {
    
    @State var image: Data? = nil
    @State var uiImage: UIImage? = nil
    @State var showAction: Bool = false
    @State var showImagePicker: Bool = false
    @State var checkboxFieldView = false
    
    @State private var sex = ["М", "Ж"]
    @State private var selectedSex = 0
    
    @Environment(\.injected) private var injected: DIContainer
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }
    
    private let player: Binding<Player>
    init(player: Binding<Player>) {
        self.player = player
    }
    
    var body: some View {
        ScrollView {
            VStack {
                imageView
                    .sheet(isPresented: $showImagePicker, onDismiss: {
                        showImagePicker = false
                    }, content: {
                        ImagePicker(isShown: $showImagePicker,
                                    uiImage: $uiImage)
                    })
                    .actionSheet(isPresented: $showAction) {
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

private extension EditProfileView {
    private var imageView: AnyView {
        AnyView(
            VStack {
                if (uiImage == nil) {
                    Image(systemName: "camera.on.rectangle")
                        .foregroundColor(.white)
                        .font(.title)
                        .padding(20)
                        .background(Color.primaryColor)
                        .cornerRadius(20)
                        .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 375),
                               height: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 416))
                        .background(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .onTapGesture {
                            showImagePicker = true
                        }
                } else {
                    
                    ZStack {
                        Image(uiImage: uiImage!)
                            .resizable()
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .background(LinearGradient(gradient: Gradient(colors: [.clear, .secondaryColor]), startPoint: .top, endPoint: .bottom))
                    }
                    .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 375),
                           height: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 416))
                    .onTapGesture {
                        showAction = true
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
                    showAction = false
                    showImagePicker = true
                }),
                .cancel(Text("Отмена"), action: {
                    showAction = false
                }),
                .destructive(Text("Удалить"), action: {
                    showAction = false
                    uiImage = nil
                })
            ])
    }
}

private extension EditProfileView {
    var namePlayer: some View {
        TextfieldOneLineView(text: player.name,
                             title: "Имя",
                             icon: "",
                             iconShow: false,
                             placeholder: "Имя",
                             keyboardType: .default,
                             success: true,
                             textAlignment: .left,
                             limitLength: 10)
    }
}

private extension EditProfileView {
    var surnamePlayer: some View {
        TextfieldOneLineView(text: player.surname,
                             title: "Фамилия",
                             icon: "",
                             iconShow: false,
                             placeholder: "Фамилия",
                             keyboardType: .default,
                             success: true,
                             textAlignment: .left,
                             limitLength: 10)
    }
}

private extension EditProfileView {
    var cityPlayer: some View {
        TextfieldOneLineView(text: player.city,
                             title: "Город",
                             icon: "",
                             iconShow: false,
                             placeholder: "Город",
                             keyboardType: .default,
                             success: true,
                             textAlignment: .left,
                             limitLength: 10)
    }
}

private extension EditProfileView {
    var dateOfbirthPlayer: some View {
        TextfieldOneLineView(text: player.age,
                             title: "Возраст",
                             icon: "",
                             iconShow: false,
                             placeholder: "Возраст",
                             keyboardType: .numberPad,
                             success: true,
                             textAlignment: .left,
                             limitLength: 2)
    }
}

private extension EditProfileView {
    var genderPlayer: some View {
        VStack {
            HStack {
                Text("Пол")
                    .foregroundColor(.defaultColor)
                    .font(Font.event.robotoRegular14)
                    .padding(.bottom, 16)
                
                Spacer()
            }
            
            Picker(selection: $selectedSex,
                   label: Text("")) {
                ForEach(0..<sex.count) {
                    Text("\(sex[$0])")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            VStack(alignment: .leading, spacing: 0) {
                Color(.dividerColor)
                    .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 327),
                           height: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 2))
                
            }
        }
    }
}

private extension EditProfileView {
    var wightPlayer: some View {
        TextfieldOneLineView(text: player.weight,
                             title: "Вес",
                             icon: "",
                             iconShow: false,
                             placeholder: "Вес",
                             keyboardType: .numberPad,
                             success: true,
                             textAlignment: .left,
                             limitLength: 2)
    }
}

private extension EditProfileView {
    var growthPlayer: some View {
        TextfieldOneLineView(text: player.growth,
                             title: "Рост",
                             icon: "",
                             iconShow: false,
                             placeholder: "Рост",
                             keyboardType: .numberPad,
                             success: true,
                             textAlignment: .left,
                             limitLength: 3)
    }
}

private extension EditProfileView {
    var aboutMySelfPlayer: some View {
        TextfieldOneLineView(text: player.aboutMe,
                             title: "О себе",
                             icon: "",
                             iconShow: false,
                             placeholder: "О себе",
                             keyboardType: .default,
                             success: true,
                             textAlignment: .left,
                             limitLength: 30)
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
                        CheckboxFieldView(checked: $checkboxFieldView,
                                          text: "Нападающий")
                        CheckboxFieldView(checked: $checkboxFieldView,
                                          text: "Полузащитник")
                        CheckboxFieldView(checked: $checkboxFieldView,
                                          text: "Защитник")
                        CheckboxFieldView(checked: $checkboxFieldView,
                                          text: "Вратарь")
                    }
                    Spacer()
                    VStack {
                        TextFieldUIKit(placeholder: "17",
                                       text: player.tShirtNumber,
                                       font: UIFont.event.robotoLight48!,
                                       foregroundColor: .secondaryColor,
                                       keyType: .numberPad,
                                       isSecureText: false,
                                       textAlignment: .center,
                                       limitLength: 2)
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
                
                TextfieldOneLineView(text: player.phoneNumber,
                                     title: "Телефон",
                                     icon: "",
                                     iconShow: false,
                                     placeholder: "Телефон",
                                     keyboardType: .numberPad,
                                     success: true,
                                     textAlignment: .left,
                                     limitLength: 11)
                
                TextfieldOneLineView(text: player.mail,
                                     title: "E-mail",
                                     icon: "",
                                     iconShow: false,
                                     placeholder: "E-mail",
                                     keyboardType: .default,
                                     success: true,
                                     textAlignment: .left,
                                     limitLength: 20)
            }
            .padding(.top, 24)
        }
    }
}

private extension EditProfileView {
    var saveButton: some View {
        Button(action: {}) {
            ButtonView(background: .primaryColor,
                       textColor: .whiteColor,
                       borderColor: .primaryColor,
                       text: "Сохранить изменения",
                       switchImage: false,
                       image: "")
        }
    }
}

private extension EditProfileView {
    var deletetButton: some View {
        ButtonCancel(text: "Удалить профиль")
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(player: .constant(.plugPlayer))
    }
}
