//
//  ProfileView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 01.12.2020.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ZStack {
                    VStack(spacing: 0) {
                        HeaderProfileView()
                        AboutMyselfProfileView()
                        StatisticsProfileView()
                        ContactsProfileView()
                    }
                    
                }
            }
            .background(Color(.white))
            .edgesIgnoringSafeArea(.bottom)
            
            .navigationBarTitle("Профиль", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: {}) {
                    Image(systemName: "pencil")
                        .font(.title)
                        .foregroundColor(.secondary)
                },
                trailing: Button(action: {
                    self.viewController?.dismiss(animated: true)
                }) {
                    Image(systemName: "multiply")
                        .font(.title)
                        .foregroundColor(.secondary)
                })
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct HeaderProfileView: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        ZStack {
            Image("player_profile")
                .resizable()
                .edgesIgnoringSafeArea(.top)
                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 375),
                       height: height * Size.shared.getAdaptSizeHeight(px: 416))
            VStack(alignment: .leading, spacing: 0) {
                Text("Роман Соколов")
                    .foregroundColor(.white)
                    .font(Font.event.robotoRegular24)
                    .lineLimit(1)
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 250),
                           alignment: .leading)
                
                Text("Петропавловск-Камчатский")
                    .foregroundColor(.white)
                    .font(Font.event.robotoRegular16)
                    .lineLimit(1)
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 250),
                           alignment: .leading)
                    .padding(.top, width * Size.shared.getAdaptSizeWidth(px: 4))
                
                HStack {
                    Text("180см")
                        .foregroundColor(.white)
                        .font(Font.event.robotoRegular16)
                        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                        .overlay(RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.white))
                    
                    Text("89кг")
                        .foregroundColor(.white)
                        .font(Font.event.robotoRegular16)
                        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                        .overlay(RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.white))
                    
                    Text("29 лет")
                        .foregroundColor(.white)
                        .font(Font.event.robotoRegular16)
                        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                        .overlay(RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.white))
                } .padding(.top, width * Size.shared.getAdaptSizeWidth(px: 16))
                
                HStack {
                    HStack {
                        Text("НАП")
                            .foregroundColor(.secondary)
                            .font(Font.event.robotoRegular24)
                            .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                            .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 3))
                            .overlay(RoundedRectangle(cornerRadius: 3)
                                        .stroke(Color.white))
                        
                        
                        Text("ПЗ")
                            .foregroundColor(.secondary)
                            .font(Font.event.robotoRegular24)
                            .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                            .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 3))
                            .overlay(RoundedRectangle(cornerRadius: 3)
                                        .stroke(Color.white))
                        
                        Text("ВРТ")
                            .foregroundColor(.secondary)
                            .font(Font.event.robotoRegular24)
                            .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                            .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 3))
                            .overlay(RoundedRectangle(cornerRadius: 3)
                                        .stroke(Color.white))
                    }
                    Spacer()
                    
                    ZStack {
                        Image("undershirt")
                            .resizable()
                            .frame(width: width * Size.shared.getAdaptSizeWidth(px: 87),
                                   height: height * Size.shared.getAdaptSizeHeight(px: 66))
                        Text("88")
                            .foregroundColor(.white)
                            .font(Font.event.robotoRegular24)
                    }
                }
                .padding(.top, width * Size.shared.getAdaptSizeWidth(px: 16))
                
            }
            .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
            .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0),
                    y: height * Size.shared.getAdaptSizeHeight(px: 150))
        }
    }
}

struct AboutMyselfProfileView: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        HStack {
            VStack(alignment: .leading,
                   spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                Text("О СЕБЕ")
                    .foregroundColor(.secondary)
                    .font(Font.event.robotoBold13)
                Text("Валлийский футболист, игрок испанского клуба «Реал Мадрид» и национальной сборной Уэльса.")
                    .foregroundColor(.secondary)
                    .font(Font.event.robotoRegular16)
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 330))
            }
            Spacer()
        }
        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 42))
    }
}

struct CellStatisticsProfileView: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    let background: UIColor
    let textColor: UIColor
    let text: String
    let count: String
    
    var body: some View {
        ZStack {
            Color(background)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 164),
                       height: height * Size.shared.getAdaptSizeHeight(px: 138))
            VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 24)) {
                Text(text)
                    .foregroundColor(Color(textColor))
                    .font(Font.event.robotoMedium16)
                Text(count)
                    .foregroundColor(Color(textColor))
                    .font(Font.event.robotoLight48)
            }
            .frame(width: width * Size.shared.getAdaptSizeWidth(px: 140), alignment: .leading)
        }
    }
}

struct StatisticsProfileView: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                Text("СТАТИСТИКА ИГР")
                    .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                    .font(Font.event.robotoBold13)
                HStack {
                    CellStatisticsProfileView(background: .primary,
                                              textColor: .white,
                                              text: "Участвовал",
                                              count: "53")
                    Spacer()
                    CellStatisticsProfileView(background: .secondary,
                                              textColor: .white,
                                              text: "Организовал",
                                              count: "1245")
                }
            }
        }
        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 16))
    }
}

struct ContactsProfileView: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                Text("КОНТАКТЫ")
                    .foregroundColor(.secondary)
                    .font(Font.event.robotoBold13)
                HStack {
                    Circle()
                        .foregroundColor(.secondary)
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 16),
                               height: height * Size.shared.getAdaptSizeHeight(px: 16))
                    Text("+7 925 084-78-88")
                        .foregroundColor(.secondary)
                        .font(Font.event.robotoRegular16)
                }
                HStack {
                    Circle()
                        .foregroundColor(.secondary)
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 16),
                               height: height * Size.shared.getAdaptSizeHeight(px: 16))
                    Text("roman@start.football")
                        .foregroundColor(.secondary)
                        .font(Font.event.robotoRegular16)
                }
            }
            Spacer()
        }
        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 32))
    }
}
