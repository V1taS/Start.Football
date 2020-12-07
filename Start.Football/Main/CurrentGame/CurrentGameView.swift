//
//  CurrentGameView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 30.11.2020.
//

import SwiftUI

struct CurrentGameView: View {
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    Group {
                        HeaderCurrentGame()
                        CellGameCurrentGame()
                        Divider()
                        WhoWillBePlayCurrentGame()
                        CalendarCurrentGame()
                        Divider()
                        AboutCurrentGame()
                        Divider()
                        OrganizerCurrentGame()
                        Divider()
                    }
                    Group {
                        AboutTheAreaCurrentGame()
                        Divider()
                        RulesCurrentGame()
                        Divider()
                        CommentCurrentGame()
                        ADVCurrentGame()
                        ButtonsCurrentGame()
                    }
                    Spacer()
                }
            }
            
            .navigationBarItems(trailing:
                                    HStack(spacing: 16) {
                                        Button(action: {
                                            self.viewController?.dismiss(animated: true)
                                        }) {
                                            Image("currenrGameEdit")
                                                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 24),
                                                       height: height * Size.shared.getAdaptSizeHeight(px: 24))
                                        }
                                        
                                        Button(action: {
                                            self.viewController?.dismiss(animated: true)
                                        }) {
                                            Image("currenrGameVector")
                                                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 24),
                                                       height: height * Size.shared.getAdaptSizeHeight(px: 24))
                                            
                                        }
                                    }
            )
            
        }
    }
}

struct CurrentGameView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentGameView()
    }
}

struct HeaderCurrentGame: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        ZStack {
            Image("currentGamebg")
                .resizable()
                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 375),
                       height: height * Size.shared.getAdaptSizeHeight(px: 230))
            
            HStack {
                Text("Тренировка в ФОК")
                    .foregroundColor(.white)
                    .font(Font.event.robotoBold20)
                    .lineLimit(3)
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 200),
                           alignment: .leading)
                Spacer()
                ZStack {
                    Color(.primary)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 87),
                               height: height * Size.shared.getAdaptSizeHeight(px: 52))
                    Text("500 ₽")
                        .foregroundColor(.white)
                        .font(Font.event.robotoRegular24)
                }
            }
            .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
            .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0),
                    y: height * Size.shared.getAdaptSizeHeight(px: 75))
        }
        .navigationBarTitle("Игра №4867", displayMode: .inline)
    }
}

struct CellGameCurrentGame: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
            
            HStack {
                Text("Мини-футбол")
                    .foregroundColor(.secondary)
                    .font(Font.event.robotoRegular16)
                    .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                    .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                    .overlay(RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.secondary))
                
                Text("10 на 10")
                    .foregroundColor(.secondary)
                    .font(Font.event.robotoRegular16)
                    .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                    .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                    .overlay(RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.secondary))
                
                Text("Для всех")
                    .foregroundColor(.secondary)
                    .font(Font.event.robotoRegular16)
                    .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                    .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                    .overlay(RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.secondary))
                Spacer()
            }
            
            HStack(spacing: width * Size.shared.getAdaptSizeWidth(px: 10)) {
                Image("cellDate")
                Text("30 августа, 16:00-18:00")
                    .foregroundColor(.secondary)
                    .font(Font.event.robotoRegular16)
            }
            HStack(spacing: width * Size.shared.getAdaptSizeWidth(px: 10)) {
                Image("cellLocator")
                Text("ул. Хачтуряна, 12, стр. 2")
                    .foregroundColor(.secondary)
                    .font(Font.event.robotoRegular16)
                Spacer()
                Text("5,2 км")
                    .foregroundColor(.primary)
                    .font(Font.event.robotoRegular16)
                Image("right")
            }
        }
        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 16))
        .padding(.bottom, height * Size.shared.getAdaptSizeHeight(px: 24))
    }
}

struct WhoWillBePlayCurrentGame: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
            Text("КТО БУДЕТ")
                .foregroundColor(.secondary)
                .font(Font.event.robotoMedium18)
            
            HStack {
                HStack(alignment: .center, spacing: -20) {
                    Image("p5")
                        .resizable()
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 32),
                               height: height * Size.shared.getAdaptSizeHeight(px: 32))
                        .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0))
                    Image("p4")
                        .resizable()
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 32),
                               height: height * Size.shared.getAdaptSizeHeight(px: 32))
                        .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0))
                    Image("p3")
                        .resizable()
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 32),
                               height: height * Size.shared.getAdaptSizeHeight(px: 32))
                        .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0))
                    Image("p2")
                        .resizable()
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 32),
                               height: height * Size.shared.getAdaptSizeHeight(px: 32))
                        .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0))
                    Image("p1")
                        .resizable()
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 32),
                               height: height * Size.shared.getAdaptSizeHeight(px: 32))
                        .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0))
                }
                Spacer()
                Text("Посмотреть всех")
                    .foregroundColor(.primary)
                    .font(Font.event.robotoRegular16)
                Image("right")
            }
        }
        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 24))
    }
}

struct DayOfWeeakCurrentGame: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    let background: UIColor
    let textColor: UIColor
    let day: String
    
    
    var body: some View {
        ZStack {
            Color(background)
                .clipShape(RoundedRectangle(cornerRadius: 3))
                .overlay(RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.secondary))
                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 32),
                       height: height * Size.shared.getAdaptSizeHeight(px: 32))
            Text(day)
                .foregroundColor(Color(textColor))
                .font(Font.event.robotoRegular16)
        }
    }
}

struct CalendarCurrentGame: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
            Text("РЕГУЛЯРНЫЕ ТРЕНИРОВКИ")
                .foregroundColor(.secondary)
                .font(Font.event.robotoMedium18)
            HStack {
                Group {
                    DayOfWeeakCurrentGame(background: .primary, textColor: .white, day: "Пн")
                    
                    DayOfWeeakCurrentGame(background: .primary, textColor: .white, day: "Вт")
                    
                    DayOfWeeakCurrentGame(background: .white, textColor: .secondary, day: "Ср")
                }
                Group {
                    DayOfWeeakCurrentGame(background: .primary, textColor: .white, day: "Чт")
                    
                    DayOfWeeakCurrentGame(background: .white, textColor: .secondary, day: "Пт")
                    
                    DayOfWeeakCurrentGame(background: .primary, textColor: .white, day: "Сб")
                    
                    DayOfWeeakCurrentGame(background: .primary, textColor: .white, day: "Вс")
                }
                Spacer()
            }
            
            Text("Понедельники: 16:00-18:00")
                .foregroundColor(.secondary)
                .font(Font.event.robotoRegular16)
                .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 8))
            
            Text("Четверги: 18:00-20:00")
                .foregroundColor(.secondary)
                .font(Font.event.robotoRegular16)
            
        }
        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 24))
    }
}

struct AboutCurrentGame: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                Text("Что есть")
                    .foregroundColor(.secondary)
                    .font(Font.event.robotoMedium18)
                HStack {
                    Image("sun")
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 18),
                               height: height * Size.shared.getAdaptSizeHeight(px: 18))
                    Text("Открытое поле")
                        .foregroundColor(.secondary)
                        .font(Font.event.robotoRegular16)
                }
                HStack {
                    Image("grass")
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 18),
                               height: height * Size.shared.getAdaptSizeHeight(px: 18))
                    Text("Искуственный газон")
                        .foregroundColor(.secondary)
                        .font(Font.event.robotoRegular16)
                }
                HStack {
                    Image("shirt")
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 18),
                               height: height * Size.shared.getAdaptSizeHeight(px: 18))
                    Text("Раздевалки")
                        .foregroundColor(.secondary)
                        .font(Font.event.robotoRegular16)
                }
                HStack {
                    Image("shower")
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 18),
                               height: height * Size.shared.getAdaptSizeHeight(px: 18))
                    Text("Душевые")
                        .foregroundColor(.secondary)
                        .font(Font.event.robotoRegular16)
                }
                HStack {
                    Image("parking")
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 18),
                               height: height * Size.shared.getAdaptSizeHeight(px: 18))
                    Text("На территории, 150 ₽ в час")
                        .foregroundColor(.secondary)
                        .font(Font.event.robotoRegular16)
                }
            }
            Spacer()
        }
        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 24))
    }
}

struct OrganizerCurrentGame: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                Text("ОРГАНИЗАТОР")
                    .foregroundColor(.secondary)
                    .font(Font.event.robotoMedium18)
                HStack {
                    Image("testOrganizator")
                        .resizable()
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 32),
                               height: height * Size.shared.getAdaptSizeHeight(px: 32))
                    Text("Юрий Долговязов")
                        .foregroundColor(.secondary)
                        .font(Font.event.robotoBold20)
                    Spacer()
                    Text(">")
                        .foregroundColor(.primary)
                        .font(Font.event.robotoBold20)
                }
            }
            Spacer()
        }
        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 24))
    }
}

struct AboutTheAreaCurrentGame: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                Text("О ПЛОЩАДКЕ")
                    .foregroundColor(.secondary)
                    .font(Font.event.robotoMedium18)
                Text("Большое поле, разделенное на два с 4 прожекторами. Газон обновлялся два года назад в связи с подготовкой к ЧМ. Есть 4 типа ворот: большие, средние, мини-футбольные и для игры в панну.")
                    .foregroundColor(.secondary)
                    .font(Font.event.robotoRegular16)
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 330))
            }
            Spacer()
        }
        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 24))
    }
}

struct RulesCurrentGame: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                Text("ПРАВИЛА")
                    .foregroundColor(.secondary)
                    .font(Font.event.robotoMedium18)
                Text("Играем без подкатов. Любое попадание в руку считается нарушением. Вратарь не берет в руки от своих игроков.")
                    .foregroundColor(.secondary)
                    .font(Font.event.robotoRegular16)
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 330))
            }
            Spacer()
        }
        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 24))
    }
}

struct CommentCurrentGame: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                Text("КОММЕНТАРИЙ")
                    .foregroundColor(.secondary)
                    .font(Font.event.robotoMedium18)
                Text("Приходим за 10-15 минут. Игра начинается ровно в 21:30. Не задерживайте себя и других игроков!")
                    .foregroundColor(.secondary)
                    .font(Font.event.robotoRegular16)
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 330))
            }
            Spacer()
        }
        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 24))
    }
}

struct ADVCurrentGame: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        ZStack {
            Button(action: {}) {
            Image("adv2")
                .resizable()
                .cornerRadius(5)
                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 343),
                       height: height * Size.shared.getAdaptSizeHeight(px: 120))
            }
        }
        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 32))
    }
}

struct ButtonsCurrentGame: View {
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        VStack(spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
            Button(action: {}) {
                ButtonView(background: .primary,
                           textColor: .white,
                           borderColor: .primary,
                           text: "Записаться на игру")
            }
            
            Button(action: {}) {
                ButtonView(background: .white,
                           textColor: .primary,
                           borderColor: .primary,
                           text: "Записаться в резерв")
            }
        }
    }
}
