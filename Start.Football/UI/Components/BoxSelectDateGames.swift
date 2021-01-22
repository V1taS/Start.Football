//
//  BoxSelectDateGames.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 22.01.2021.
//

import SwiftUI

struct BoxSelectDateGames: View {
    
    let title: String
    @Binding var date: Date
    @Binding var textHasBeenChanged: Bool
    @Binding var dayOfGame: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            if dayOfGame {
                
                HStack {
                    Text(title)
                        .foregroundColor(Color.secondaryColor)
                        .font(Font.event.robotoMedium18)
                    
                    Spacer()
                }
                
                DatePickerLineView(date: $date,
                                   text: "Укажите время:",
                                   header: "Время",
                                   iconShow: true,
                                   icon: "timeGreateGame",
                                   textHasBeenChanged: $textHasBeenChanged,
                                   hourAndMinute: .hourAndMinute)
            }
        }
        .padding(.top, 8)
    }
}

struct BoxSelectDateGames_Previews: PreviewProvider {
    static var previews: some View {
        BoxSelectDateGames(title: "Игра в понедельник",
                           date: .constant(Date()),
                           textHasBeenChanged: .constant(true),
                           dayOfGame: .constant(true))
    }
}
