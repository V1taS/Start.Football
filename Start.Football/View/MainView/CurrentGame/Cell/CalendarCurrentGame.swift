//
//  CalendarCurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CalendarCurrentGame: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
            Text("РЕГУЛЯРНЫЕ ТРЕНИРОВКИ")
                .foregroundColor(.secondaryColor)
                .font(Font.event.robotoMedium18)
            HStack {
                Group {
                    DayOfWeeakCurrentGame(background: .primaryColor, textColor: .whiteColor, day: "Пн")
                    
                    DayOfWeeakCurrentGame(background: .primaryColor, textColor: .whiteColor, day: "Вт")
                    
                    DayOfWeeakCurrentGame(background: .whiteColor, textColor: .secondaryColor, day: "Ср")
                }
                Group {
                    DayOfWeeakCurrentGame(background: .primaryColor, textColor: .whiteColor, day: "Чт")
                    
                    DayOfWeeakCurrentGame(background: .whiteColor, textColor: .secondaryColor, day: "Пт")
                    
                    DayOfWeeakCurrentGame(background: .primaryColor, textColor: .whiteColor, day: "Сб")
                    
                    DayOfWeeakCurrentGame(background: .primaryColor, textColor: .whiteColor, day: "Вс")
                }
                Spacer()
            }
            
            Text("Понедельники: 16:00-18:00")
                .foregroundColor(.secondaryColor)
                .font(Font.event.robotoRegular16)
                .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 8))
            
            Text("Четверги: 18:00-20:00")
                .foregroundColor(.secondaryColor)
                .font(Font.event.robotoRegular16)
            
        }
        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 24))
    }
}

struct CalendarCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        CalendarCurrentGame()
    }
}
