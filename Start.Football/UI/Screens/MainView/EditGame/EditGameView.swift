//
//  EditGameView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 01.02.2021.
//

import SwiftUI

struct EditGameView: View {
    
    @State private var appState: AppState.AppData = .init()
    private var appBinding: Binding<AppState.AppData> {
        $appState.dispatched(to: injected.appState, \.appData)
    }
    @Environment(\.injected) private var injected: DIContainer
    
    private var game: Game
    init(game: Game) {
        self.game = game
    }
    
    var body: some View {
        ScrollView {
            VStack {
                // Step 1
                VStack {
                    VStack(spacing: 24) {
                        nameGame
                        addressGame
                        TFdateAndTimeCGView(appBinding: appBinding)
                        TFhowMuchTimeDoWePlayCGView(appBinding: appBinding)
                        costGame
                    }
                    freeGameText
                }
                .padding(.top, 32)
                
                // Step 2
                VStack {
                    VStack(alignment: .leading, spacing: 16) {
                        header
                        selectionRegularGame
                        regularGame
                    }
                }
                .padding(.top, 32)
                
                // Step 3
                VStack(alignment: .leading, spacing: 16) {
                    Group {
                        gameType
                        formatGameTextField
                        boxSliderCreateGame
                            .accentColor(.primaryColor)
                        boxPrivacyCreateGame
                    }
                    Divider()
                    Group {
                        Text("Дополнительная информация")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoMedium20)
                        
                        placeType
                        fieldType
                        coatingProperties
                        infrastructure
                        ButtonParking(appBinding: appBinding)
                    }
                }
                .padding(.top, 32)
                
                // Step 4
                VStack(spacing: 16) {
                    descriptionPlaying
                    ownRules
                    commentFromOrganizer
                    
                    addPhotoFieldButton
                        .padding(.top, 16)
                    
                    HStack {
                        ImageViewMiniCG(image: "CGfield_1")
                        Spacer()
                        ImageViewMiniCG(image: "CGfield_2")
                    }
                    Spacer()
                }
                .padding(.top, 32)
                
                VStack(spacing: 16) {
                    ButtonCancel(text: "Удалить игру")
                    ButtonView(background: .primaryColor,
                               textColor: .whiteColor,
                               borderColor: .primaryColor,
                               text: "Сохранить изменения",
                               switchImage: false,
                               image: "")
                }
                .padding(.top, 32)
                
                Spacer()
            }
            .padding(.horizontal, 24)
        }
        .dismissingKeyboard()
        .keyboardAware()
        
        .navigationBarTitle(Text("Редактирование игры № \(game.gameNumber)"), displayMode: .inline)
    }
}

// MARK: UI
private extension EditGameView {
    var nameGame: some View {
        TextfieldOneLineView(text: appBinding.editGame.nameGame,
                             title: "Название",
                             icon: "",
                             iconShow: false,
                             placeholder: "Введите название",
                             keyboardType: .default,
                             success: appBinding.editGame.nameGameSuccess.wrappedValue)
    }
}

private extension EditGameView {
    var addressGame: some View {
        TextfieldOneLineView(text: appBinding.editGame.addressGame,
                             title: "Адрес",
                             icon: "locationCreateGame",
                             iconShow: true,
                             placeholder: "Укажите адрес",
                             keyboardType: .default,
                             success: appBinding.editGame.addressGameSuccess.wrappedValue)
    }
}

private extension EditGameView {
    var costGame: some View {
        TextfieldOneLineView(text: appBinding.editGame.costGame,
                             title: "Стоимость участия одного игрока",
                             icon: "rublsCreateGame",
                             iconShow: true,
                             placeholder: "Укажите стоимость",
                             keyboardType: .numberPad,
                             success: appBinding.editGame.costGameSuccess.wrappedValue)
    }
}

private extension EditGameView {
    var freeGameText: some View {
        HStack {
            Text("0 ₽ — игра бесплатная")
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoRegular14)
                .padding(.top, 2)
            Spacer()
        }
    }
}

// MARK: UI
private extension EditGameView {
    private var header: AnyView {
        AnyView(
            Text("Это регулярная игра?")
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoRegular18)
        )
    }
}

private extension EditGameView {
    var selectionRegularGame: some View {
        VStack(spacing: 16) {
            Button(action: {
                noSelectionRegularGame(state: appBinding)
            }) {
                oneDayButton
            }
            
            Button(action: {
                yesSelectionRegularGame(state: appBinding)
            }) {
                regularDayButton
            }
        }
    }
}

private extension EditGameView {
    var oneDayButton: some View {
        HStack(spacing: 8) {
            ButtonRoundGreen(status: appBinding.editGame
                                .selectionRegularGame.wrappedValue == .no)
                .frame(width: 24)
            
            Text("Разово. Для проведения одной игры")
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoRegular16)
            Spacer()
        }
    }
}

private extension EditGameView {
    var regularDayButton: some View {
        HStack(spacing: 8) {
            ButtonRoundGreen(status: appBinding.editGame
                                .selectionRegularGame.wrappedValue == .yes)
                .frame(width: 24)
            
            Text("Регулярно. Проводится на постоянной основе")
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoRegular16)
            Spacer()
        }
    }
}

private extension EditGameView {
    var regularGame: some View {
        VStack(alignment: .leading, spacing: 0) {
            if appBinding.editGame.selectionRegularGame.wrappedValue == .yes {
                boxDateButton
                boxSelectDateGames
            }
        }
    }
}

private extension EditGameView {
    private var boxDateButton: AnyView {
        AnyView(
            BoxDateButton(disabledButton: false,
                          mo: appBinding.editGame.listGame[0],
                          tu: appBinding.editGame.listGame[1],
                          we: appBinding.editGame.listGame[2],
                          th: appBinding.editGame.listGame[3],
                          fr: appBinding.editGame.listGame[4],
                          sa: appBinding.editGame.listGame[5],
                          su: appBinding.editGame.listGame[6])
                .padding(.bottom, 8)
        )
    }
}

private extension EditGameView {
    private var boxSelectDateGames: AnyView {
        AnyView(
            ScrollView(.vertical, showsIndicators: false) {
                BoxSelectDateGames(title: "Игра в понедельник",
                                   date: appBinding.editGame.listDate[0],
                                   textHasBeenChanged: appBinding.editGame.anyTimeHasBeenChanged,
                                   dayOfGame: appBinding.editGame.listGame[0])
                
                BoxSelectDateGames(title: "Игра во вторник",
                                   date: appBinding.editGame.listDate[1],
                                   textHasBeenChanged: appBinding.editGame.anyTimeHasBeenChanged,
                                   dayOfGame: appBinding.editGame.listGame[1])
                
                BoxSelectDateGames(title: "Игра в среду",
                                   date: appBinding.editGame.listDate[2],
                                   textHasBeenChanged: appBinding.editGame.anyTimeHasBeenChanged,
                                   dayOfGame: appBinding.editGame.listGame[2])
                
                BoxSelectDateGames(title: "Игра в четверг",
                                   date: appBinding.editGame.listDate[3],
                                   textHasBeenChanged: appBinding.editGame.anyTimeHasBeenChanged,
                                   dayOfGame: appBinding.editGame.listGame[3])
                
                BoxSelectDateGames(title: "Игра в пятницу",
                                   date: appBinding.editGame.listDate[4],
                                   textHasBeenChanged: appBinding.editGame.anyTimeHasBeenChanged,
                                   dayOfGame: appBinding.editGame.listGame[4])
                
                BoxSelectDateGames(title: "Игра в субботу",
                                   date: appBinding.editGame.listDate[5],
                                   textHasBeenChanged: appBinding.editGame.anyTimeHasBeenChanged,
                                   dayOfGame: appBinding.editGame.listGame[5])
                
                BoxSelectDateGames(title: "Игра в воскресенье",
                                   date: appBinding.editGame.listDate[6],
                                   textHasBeenChanged: appBinding.editGame.anyTimeHasBeenChanged,
                                   dayOfGame: appBinding.editGame.listGame[6])
            }
            .animation(.easeIn)
        )
    }
}

// MARK: Actions
private extension EditGameView {
    private func noSelectionRegularGame(state: Binding<AppState.AppData>) {
        injected.interactors.createGameInteractor
            .noSelectionRegularGame(state: state)
    }
    
    private func yesSelectionRegularGame(state: Binding<AppState.AppData>) {
        injected.interactors.createGameInteractor
            .yesSelectionRegularGame(state: state)
    }
}

// MARK: Step - 3
private extension EditGameView {
    private var gameType: AnyView {
        AnyView(
            Group {
                Text("Тип игры")
                    .foregroundColor(.defaultColor)
                    .font(Font.event.robotoRegular14)
                HStack {
                    Button(action: {
                        selectMiniFootball()
                    }) {
                        TextButtonRound(name: "Мини-футбол",
                                        isOn: appBinding.editGame
                                            .miniFootball.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                    
                    Button(action: {
                        selectFootball()
                    }) {
                        TextButtonRound(name: "Футбол",
                                        isOn: appBinding.editGame
                                            .usualFootball.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                    
                    Button(action: {
                        selectFootsal()
                    }) {
                        TextButtonRound(name: "Футзал",
                                        isOn: appBinding.editGame
                                            .footsal.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                }
            }
        )
    }
}

private extension EditGameView {
    private var placeType: AnyView {
        AnyView(
            Group {
                Text("Где играть")
                    .foregroundColor(.defaultColor)
                    .font(Font.event.robotoRegular14)
                
                HStack {
                    Button(action: {
                        selectStreet()
                    }) {
                        TextButtonRound(name: "Улица",
                                        isOn: appBinding.editGame
                                            .street.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                    
                    Button(action: {
                        selectManege()
                    }) {
                        TextButtonRound(name: "Манеж",
                                        isOn: appBinding.editGame
                                            .manege.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                    
                    Button(action: {
                        selectHall()
                    }) {
                        TextButtonRound(name: "Зал",
                                        isOn: appBinding.editGame
                                            .hall.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                }
            }
        )
    }
}

private extension EditGameView {
    private var fieldType: AnyView {
        AnyView(
            Group {
                Text("Тип покрытия")
                    .foregroundColor(.defaultColor)
                    .font(Font.event.robotoRegular14)
                
                HStack {
                    
                    Button(action: {
                        selectParquet()
                    }) {
                        TextButtonRound(name: "Паркет",
                                        isOn: appBinding.editGame
                                            .parquet.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                    
                    Button(action: {
                        selectGrass()
                    }) {
                        TextButtonRound(name: "Газон",
                                        isOn: appBinding.editGame
                                            .grass.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                    
                    Button(action: {
                        selectCaoutchouc()
                    }) {
                        TextButtonRound(name: "Резина",
                                        isOn: appBinding.editGame
                                            .caoutchouc.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                }
            }
        )
    }
}

private extension EditGameView {
    private var coatingProperties: AnyView {
        AnyView(
            Group {
                HStack {
                    
                    Button(action: {
                        selectSynthetics()
                    }) {
                        TextButtonRound(name: "Синтетика",
                                        isOn: appBinding.editGame
                                            .synthetics.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                    
                    Button(action: {
                        selectHair()
                    }) {
                        TextButtonRound(name: "Ворс",
                                        isOn: appBinding.editGame
                                            .hair.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                    
                    Button(action: {
                        selectCrumb()
                    }) {
                        TextButtonRound(name: "Крошка",
                                        isOn: appBinding.editGame
                                            .crumb.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                }
            }
        )
    }
}

private extension EditGameView {
    private var formatGameTextField: AnyView {
        AnyView(
            FormatGameTextField(firstValue: appBinding.editGame.firstValue,
                                secondValue: appBinding.editGame.secondValue)
        )
    }
}

private extension EditGameView {
    private var boxSliderCreateGame: AnyView {
        AnyView(
            BoxSliderCreateGame(maxCountTeams: appBinding.editGame.maxCountTeams,
                                maxCountPlayers: appBinding.editGame.maxCountPlayers,
                                maxReservePlayers: appBinding.editGame.maxReservePlayers)
        )
    }
}

private extension EditGameView {
    private var boxPrivacyCreateGame: AnyView {
        AnyView(
            BoxPrivacyCreateGame(privacyGame: appBinding.editGame.privacyGame)
        )
    }
}

private extension EditGameView {
    private var infrastructure: AnyView {
        AnyView(
            Group {
                Text("Инфраструктура")
                    .foregroundColor(.defaultColor)
                    .font(Font.event.robotoRegular14)
                
                HStack {
                    Button(action: {
                        dressingRooms(state: appBinding)
                    }) {
                        TextButtonRound(name: "Раздевалки",
                                        isOn: appBinding.editGame
                                            .dressingRooms.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                    
                    Button(action: {
                        showers(state: appBinding)
                    }) {
                        TextButtonRound(name: "Душевые",
                                        isOn: appBinding.editGame
                                            .showers.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                    
                }
            }
        )
    }
}


// MARK: Actions
private extension EditGameView {
    // Type Game
    private func selectMiniFootball() {
        injected.interactors.createGameInteractor
            .selectMiniFootball(state: appBinding)
    }
    
    private func selectFootball() {
        injected.interactors.createGameInteractor
            .selectFootball(state: appBinding)
    }
    
    private func selectFootsal() {
        injected.interactors.createGameInteractor
            .selectFootsal(state: appBinding)
    }
}

private extension EditGameView {
    // Place Play
    private func selectStreet() {
        injected.interactors.createGameInteractor
            .selectStreet(state: appBinding)
    }
    
    private func selectManege() {
        injected.interactors.createGameInteractor
            .selectManege(state: appBinding)
    }
    
    private func selectHall() {
        injected.interactors.createGameInteractor
            .selectHall(state: appBinding)
    }
}

private extension EditGameView {
    // Type Field
    private func selectParquet() {
        injected.interactors.createGameInteractor
            .selectParquet(state: appBinding)
    }
    
    private func selectGrass() {
        injected.interactors.createGameInteractor
            .selectGrass(state: appBinding)
    }
    
    private func selectCaoutchouc() {
        injected.interactors.createGameInteractor
            .selectCaoutchouc(state: appBinding)
    }
}

private extension EditGameView {
    // Coating Properties
    private func selectSynthetics() {
        injected.interactors.createGameInteractor
            .selectSynthetics(state: appBinding)
    }
    
    private func selectHair() {
        injected.interactors.createGameInteractor
            .selectHair(state: appBinding)
    }
    
    private func selectCrumb() {
        injected.interactors.createGameInteractor
            .selectCrumb(state: appBinding)
    }
}

private extension EditGameView {
    private func dressingRooms(state: Binding<AppState.AppData>) {
        injected.interactors.createGameInteractor
            .dressingRooms(state: state)
    }
    
    private func showers(state: Binding<AppState.AppData>) {
        injected.interactors.createGameInteractor.showers(state: state)
    }
}

// MARK: Step 4
private extension EditGameView {
    private var descriptionPlaying: AnyView {
        AnyView(
            TextViewTitlePlaceholder(text: appBinding.editGame.descriptionGame,
                                     placeholder: "Большое поле, разделенное на два с 4 прожекторами. Газон обновлялся два года назад в связи с подготовкой к ЧМ. Есть 4 типа ворот: большие, средние, мини-футбольные и для игры в панну.",
                                     title: "Описание площадки")
        )
    }
}

private extension EditGameView {
    private var ownRules: AnyView {
        AnyView(
            TextViewTitlePlaceholder(text: appBinding.editGame.ownRules,
                                     placeholder: "Играем без подкатов. Любое попадание в руку считается нарушением. Вратарь не берет в руки от своих игроков.",
                                     title: "Свои правила")
        )
    }
}

private extension EditGameView {
    private var commentFromOrganizer: AnyView {
        AnyView(
            TextViewTitlePlaceholder(text: appBinding.editGame.commentFromOrganizer,
                                     placeholder: "Приходим за 10-15 минут. Игра начинается ровно в 21:30. Не задерживайте себя и других игроков!",
                                     title: "Комментарий от организатора")
        )
    }
}

private extension EditGameView {
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
private extension EditGameView {
    private func addPhotoField() {
        
    }
}

struct EditGameView_Previews: PreviewProvider {
    static var previews: some View {
        EditGameView(game: Game.plugGame)
    }
}
