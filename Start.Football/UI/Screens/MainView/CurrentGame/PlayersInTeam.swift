//
//  PlayersInTeam.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 01.02.2021.
//

import SwiftUI

struct PlayersInTeam: View {
    
    private var players: [Player]
    init(players: [Player]) {
        self.players = players
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Text("Основной состав")
                        .foregroundColor(.whiteColor)
                        .font(Font.event.robotoMedium20)
                        .frame(width: 375, height: 48)
                        .background(Color.primaryColor)
                }
                
                ForEach(players.sorted(by: { $0.name > $1.name }), id: \.self) { player in
                    
                    VStack {
                        HStack(spacing: 10) {
                            Circle()
                                .frame(width: 32, height: 32)
                                .foregroundColor(.primaryColor)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("\(player.name)")
                                    .foregroundColor(.secondaryColor)
                                    .font(Font.event.robotoRegular16)
                                
                                Text("\(player.position)")
                                    .foregroundColor(.secondaryColor)
                                    .font(Font.event.robotoRegular12)
                            }
                            Spacer()
                        }
                        .padding(16)
                        Divider()
                    }
                }
                
                VStack {
                    Text("Резервный состав")
                        .foregroundColor(.whiteColor)
                        .font(Font.event.robotoMedium20)
                        .frame(width: 375, height: 48)
                        .background(Color.secondaryColor)
                }
                
                ForEach(players.sorted(by: { $0.name > $1.name }), id: \.self) { player in
                    
                    VStack {
                        HStack(spacing: 10) {
                            Circle()
                                .frame(width: 32, height: 32)
                                .foregroundColor(.primaryColor)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("\(player.name)")
                                    .foregroundColor(.secondaryColor)
                                    .font(Font.event.robotoRegular16)
                                
                                Text("\(player.position)")
                                    .foregroundColor(.secondaryColor)
                                    .font(Font.event.robotoRegular12)
                            }
                            Spacer()
                        }
                        .padding(16)
                        Divider()
                    }
                }
                
                
                
                
            }
            .navigationBarTitle(Text("Игроки"), displayMode: .inline)
        }
    }
}

struct PlayersInTeam_Previews: PreviewProvider {
    static var previews: some View {
        PlayersInTeam(players: Player.plugPlayers)
    }
}
