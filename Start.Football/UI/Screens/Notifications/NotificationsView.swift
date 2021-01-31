//
//  NotificationsView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 31.01.2021.
//

import SwiftUI

struct NotificationsView: View {
    
    private var appBinding: Binding<AppState.AppData>
    init(appBinding: Binding<AppState.AppData>) {
        self.appBinding = appBinding
    }
    
    var body: some View {
        VStack {
            Text("Уведомления")
                .foregroundColor(.secondaryColor)
                .font(Font.event.robotoMedium18)
                .padding(.top, 16)
            Divider()
            
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    ForEach(appBinding.main.listNotificationGames
                                .wrappedValue.sorted(
                                    by: { $0.dataCreateNotifications > $1.dataCreateNotifications }),
                            id: \.self) { notification in
                        
                        VStack {
                            HStack(spacing: 10) {
                                Circle()
                                    .frame(width: 32, height: 32)
                                    .foregroundColor(.primaryColor)
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("\(notification.description)")
                                        .foregroundColor(.secondaryColor)
                                        .font(Font.event.robotoRegular16)
                                    
                                    Text("\(notification.dataCreateNotifications)")
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
            }
            Spacer()
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView(appBinding: .constant(.init()))
    }
}
