//
//  BoxDateButton.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct BoxDateButton: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    let disabledButton: Bool
    
    var body: some View {
        HStack {
            Group {
                Button(action: {}) {
                    DayOfWeeakCurrentGame(background: .primaryColor, textColor: .whiteColor, day: "Пн")
                } .disabled(disabledButton)
                
                Spacer()
                
                Button(action: {}) {
                    DayOfWeeakCurrentGame(background: .primaryColor, textColor: .whiteColor, day: "Вт")
                } .disabled(disabledButton)
                
                Spacer()
                
                Button(action: {}) {
                    DayOfWeeakCurrentGame(background: .whiteColor, textColor: .secondaryColor, day: "Ср")
                } .disabled(disabledButton)

                Spacer()
            }
            Group {
                Button(action: {}) {
                    DayOfWeeakCurrentGame(background: .primaryColor, textColor: .whiteColor, day: "Чт")
                } .disabled(disabledButton)
                
                Spacer()
                
                Button(action: {}) {
                    DayOfWeeakCurrentGame(background: .whiteColor, textColor: .secondaryColor, day: "Пт")
                } .disabled(disabledButton)
                
                Spacer()
                
                Button(action: {}) {
                    DayOfWeeakCurrentGame(background: .primaryColor, textColor: .whiteColor, day: "Сб")
                } .disabled(disabledButton)
                
                Spacer()
                
                Button(action: {}) {
                    DayOfWeeakCurrentGame(background: .primaryColor, textColor: .whiteColor, day: "Вс")
                } .disabled(disabledButton)
            }
        }
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
                            .stroke(Color.secondaryColor))
                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 32),
                       height: height * Size.shared.getAdaptSizeHeight(px: 32))
            Text(day)
                .foregroundColor(Color(textColor))
                .font(Font.event.robotoRegular16)
        }
    }
}

struct BoxDateButton_Previews: PreviewProvider {
    static var previews: some View {
        BoxDateButton(disabledButton: true)
    }
}
