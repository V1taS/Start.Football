//
//  CellWithPlayerButton.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 19.01.2021.
//

import SwiftUI

struct CellWithPlayerButton: View {
    
    let image: String
    let name: String
    let typePlayers: String
    
    var body: some View {
        HStack {
            Image(image)
            
            VStack(alignment: .leading) {
                Text(name)
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular18)
                Text(typePlayers)
                    .foregroundColor(.defaultColor)
                    .font(Font.event.robotoRegular14)
            }
        }
    }
}

struct CellWithPlayerButton_Previews: PreviewProvider {
    static var previews: some View {
        CellWithPlayerButton(image: "player1CG",
                             name: "Виталий Сосин",
                             typePlayers: "Защитник, полузащитник, нападающий")
    }
}
