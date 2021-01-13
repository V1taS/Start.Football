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
    
    @Binding var mo: Bool
    @Binding var tu: Bool
    @Binding var we: Bool
    @Binding var th: Bool
    @Binding var fr: Bool
    @Binding var sa: Bool
    @Binding var su: Bool
    
    var body: some View {
        HStack {
            Group {
                Button(action: { mo.toggle() }) {
                    DayOfWeeakCurrentGame(
                        background: mo ? UIColor.primaryColor : .whiteColor,
                        textColor: mo ? UIColor.whiteColor : .secondaryColor,
                        day: "Пн"
                    )
                } .disabled(disabledButton)
                
                Spacer()
                
                Button(action: { tu.toggle() }) {
                    DayOfWeeakCurrentGame(
                        background: tu ? UIColor.primaryColor : .whiteColor,
                        textColor: tu ? UIColor.whiteColor : .secondaryColor,
                        day: "Вт"
                    )
                } .disabled(disabledButton)
                
                Spacer()
                
                Button(action: { we.toggle() }) {
                    DayOfWeeakCurrentGame(
                        background: we ? UIColor.primaryColor : .whiteColor,
                        textColor: we ? UIColor.whiteColor : .secondaryColor,
                        day: "Ср"
                    )
                } .disabled(disabledButton)

                Spacer()
            }
            Group {
                Button(action: { th.toggle() }) {
                    DayOfWeeakCurrentGame(
                        background: th ? UIColor.primaryColor : .whiteColor,
                        textColor: th ? UIColor.whiteColor : .secondaryColor,
                        day: "Чт"
                    )
                } .disabled(disabledButton)
                
                Spacer()
                
                Button(action: { fr.toggle() }) {
                    DayOfWeeakCurrentGame(
                        background: fr ? UIColor.primaryColor : .whiteColor,
                        textColor: fr ? UIColor.whiteColor : .secondaryColor,
                        day: "Пт"
                    )
                } .disabled(disabledButton)
                
                Spacer()
                
                Button(action: { sa.toggle() }) {
                    DayOfWeeakCurrentGame(
                        background: sa ? UIColor.primaryColor : .whiteColor,
                        textColor: sa ? UIColor.whiteColor : .secondaryColor,
                        day: "Сб"
                    )
                } .disabled(disabledButton)
                
                Spacer()
                
                Button(action: { su.toggle() }) {
                    DayOfWeeakCurrentGame(
                        background: su ? UIColor.primaryColor : .whiteColor,
                        textColor: su ? UIColor.whiteColor : .secondaryColor,
                        day: "Вс"
                    )
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
        BoxDateButton(disabledButton: false,
                      mo: .constant(false),
                      tu: .constant(false),
                      we: .constant(false),
                      th: .constant(false),
                      fr: .constant(false),
                      sa: .constant(false),
                      su: .constant(false))
    }
}
