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
    
    private let player: Player
    init(player: Player) {
        self.player = player
    }
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        ZStack {
            Color(.paleWhite)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 0) {
                    HeaderProfileView(player: player)
                    VStack(spacing: 0) {
                        AboutMySelfProfileView(player: player)
                        BoxStatisticsProfileView(player: player)
                        ContactsProfileView(player: player)
                    }
                    .padding(.horizontal, 16)
                }
                
                
            }
            dismiss
                .padding()
                .offset(y: -350)
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color(.paleWhite))
        
    }
}

private extension ProfileView {
    private var dismiss: AnyView {
        AnyView(
            HStack {
                Spacer()
                Button(action: {
                    self.viewController?.dismiss(animated: true, completion: nil)
                }) {
                    ZStack {
                        Image(systemName: "xmark.circle.fill")
                            .imageScale(.large)
                            .foregroundColor(Color(.secondaryLabel))
                    }
                    
                }
            }
        )
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(player: .plugPlayer)
    }
}
