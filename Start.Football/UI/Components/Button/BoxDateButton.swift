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
                        day: "Пн",
                        strokeBoarder: mo ? Color.primaryColor : Color.secondaryColor,
                        font: mo ? Font.event.robotoMedium16 : Font.event.robotoRegular16
                    )
                } .disabled(disabledButton)
                
                Spacer()
                
                Button(action: { tu.toggle() }) {
                    DayOfWeeakCurrentGame(
                        background: tu ? UIColor.primaryColor : .whiteColor,
                        textColor: tu ? UIColor.whiteColor : .secondaryColor,
                        day: "Вт",
                        strokeBoarder: tu ? Color.primaryColor : Color.secondaryColor,
                        font: tu ? Font.event.robotoMedium16 : Font.event.robotoRegular16
                    )
                } .disabled(disabledButton)
                
                Spacer()
                
                Button(action: { we.toggle() }) {
                    DayOfWeeakCurrentGame(
                        background: we ? UIColor.primaryColor : .whiteColor,
                        textColor: we ? UIColor.whiteColor : .secondaryColor,
                        day: "Ср",
                        strokeBoarder: we ? .primaryColor : .secondaryColor,
                        font: we ? Font.event.robotoMedium16 : Font.event.robotoRegular16
                    )
                } .disabled(disabledButton)

                Spacer()
            }
            Group {
                Button(action: { th.toggle() }) {
                    DayOfWeeakCurrentGame(
                        background: th ? UIColor.primaryColor : .whiteColor,
                        textColor: th ? UIColor.whiteColor : .secondaryColor,
                        day: "Чт",
                        strokeBoarder: th ? .primaryColor : .secondaryColor,
                        font: th ? Font.event.robotoMedium16 : Font.event.robotoRegular16
                    )
                } .disabled(disabledButton)
                
                Spacer()
                
                Button(action: { fr.toggle() }) {
                    DayOfWeeakCurrentGame(
                        background: fr ? UIColor.primaryColor : .whiteColor,
                        textColor: fr ? UIColor.whiteColor : .secondaryColor,
                        day: "Пт",
                        strokeBoarder: fr ? .primaryColor : .secondaryColor,
                        font: fr ? Font.event.robotoMedium16 : Font.event.robotoRegular16
                    )
                } .disabled(disabledButton)
                
                Spacer()
                
                Button(action: { sa.toggle() }) {
                    DayOfWeeakCurrentGame(
                        background: sa ? UIColor.primaryColor : .whiteColor,
                        textColor: sa ? UIColor.whiteColor : .secondaryColor,
                        day: "Сб",
                        strokeBoarder: sa ? .primaryColor : .secondaryColor,
                        font: sa ? Font.event.robotoMedium16 : Font.event.robotoRegular16
                    )
                } .disabled(disabledButton)
                
                Spacer()
                
                Button(action: { su.toggle() }) {
                    DayOfWeeakCurrentGame(
                        background: su ? UIColor.primaryColor : .whiteColor,
                        textColor: su ? UIColor.whiteColor : .secondaryColor,
                        day: "Вс",
                        strokeBoarder: su ? .primaryColor : .secondaryColor,
                        font: su ? Font.event.robotoMedium16 : Font.event.robotoRegular16
                    )
                } .disabled(disabledButton)
            }
        }
    }
}

struct DayOfWeeakCurrentGame: View {
    
    let background: UIColor
    let textColor: UIColor
    let day: String
    let strokeBoarder: Color
    let font: Font
    
    
    var body: some View {
        ZStack {
            Color(background)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(strokeBoarder))
                .frame(width: 36,
                       height: 36)
            Text(day)
                .foregroundColor(Color(textColor))
                .font(font)
        }
    }
}

struct BoxDateButton_Previews: PreviewProvider {
    static var previews: some View {
        BoxDateButton(disabledButton: false,
                      mo: .constant(false),
                      tu: .constant(true),
                      we: .constant(false),
                      th: .constant(false),
                      fr: .constant(true),
                      sa: .constant(false),
                      su: .constant(false))
    }
}
