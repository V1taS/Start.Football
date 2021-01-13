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
                        
                        VStack(spacing: 0) {
                            AboutMySelfProfileView()
                            BoxStatisticsProfileView()
                            ContactsProfileView()
                        }
                        .padding(.horizontal, 16)
                    }
                    
                }
            }
            .background(Color(.backgroundColor))
            .edgesIgnoringSafeArea(.bottom)
            
            .navigationBarTitle("Профиль", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: {}) {
                    Image(systemName: "pencil")
                        .font(.title)
                        .foregroundColor(.secondaryColor)
                },
                trailing: Button(action: {
                    self.viewController?.dismiss(animated: true)
                }) {
                    Image(systemName: "multiply")
                        .font(.title)
                        .foregroundColor(.secondaryColor)
                })
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
