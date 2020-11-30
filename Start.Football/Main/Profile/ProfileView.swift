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
                    Color(#colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9725490196, alpha: 1))
                    VStack(spacing: 0) {
                        HeaderProfileView()
                        AboutMyselfProfileView()
                        StatisticsProfileView()
                        ContactsProfileView()
                    }
                    
                }
            }
            .background(Color(#colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9725490196, alpha: 1)))
            .edgesIgnoringSafeArea(.bottom)
            
            .navigationBarTitle("Профиль", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: {}) {
                    Image(systemName: "pencil")
                        .font(.title)
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019608, green: 0.2745098039, blue: 0.3411764706, alpha: 1)))
                },
                trailing: Button(action: {
                    self.viewController?.dismiss(animated: true)
                }) {
                    Image(systemName: "multiply")
                        .font(.title)
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019608, green: 0.2745098039, blue: 0.3411764706, alpha: 1)))
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
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .font(Font.event.robotoRegular24)
                
                Text("Петропавловск-Камчатский")
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .font(Font.event.robotoRegular16)
                    .padding(.top, width * Size.shared.getAdaptSizeWidth(px: 4))
                
                HStack {
                    Text("180см")
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .font(Font.event.robotoRegular16)
                        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                        .overlay(RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))))
                    
                    Text("89кг")
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .font(Font.event.robotoRegular16)
                        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                        .overlay(RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))))
                    
                    Text("29 лет")
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .font(Font.event.robotoRegular16)
                        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                        .overlay(RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))))
                } .padding(.top, width * Size.shared.getAdaptSizeWidth(px: 16))
                
                HStack {
                    HStack {
                        Text("НАП")
                            .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                            .font(Font.event.robotoRegular24)
                            .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                            .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                            .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                            .clipShape(RoundedRectangle(cornerRadius: 3))
                            .overlay(RoundedRectangle(cornerRadius: 3)
                                        .stroke(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))))
                        
                        
                        Text("ПЗ")
                            .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                            .font(Font.event.robotoRegular24)
                            .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                            .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                            .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                            .clipShape(RoundedRectangle(cornerRadius: 3))
                            .overlay(RoundedRectangle(cornerRadius: 3)
                                        .stroke(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))))
                        
                        Text("ВРТ")
                            .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                            .font(Font.event.robotoRegular24)
                            .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                            .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                            .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                            .clipShape(RoundedRectangle(cornerRadius: 3))
                            .overlay(RoundedRectangle(cornerRadius: 3)
                                        .stroke(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))))
                    }
                    Spacer()
                    
                    ZStack {
                        Image("undershirt")
                            .resizable()
                            .frame(width: width * Size.shared.getAdaptSizeWidth(px: 87),
                                   height: height * Size.shared.getAdaptSizeHeight(px: 66))
                        Text("88")
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
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
            VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                Text("О СЕБЕ")
                    .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                    .font(Font.event.robotoBold13)
                Text("Валлийский футболист, игрок испанского клуба «Реал Мадрид» и национальной сборной Уэльса.")
                    .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                    .font(Font.event.robotoRegular16)
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
                    CellStatisticsProfileView(background: #colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1),
                                              textColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
                                              text: "Участвовал",
                                              count: "53")
                    Spacer()
                    CellStatisticsProfileView(background: #colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1),
                                              textColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
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
                    .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                    .font(Font.event.robotoBold13)
                HStack {
                    Circle()
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 16),
                               height: height * Size.shared.getAdaptSizeHeight(px: 16))
                    Text("+7 925 084-78-88")
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .font(Font.event.robotoRegular16)
                }
                HStack {
                    Circle()
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 16),
                               height: height * Size.shared.getAdaptSizeHeight(px: 16))
                    Text("roman@start.football")
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .font(Font.event.robotoRegular16)
                }
            }
            Spacer()
        }
        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 32))
    }
}
