//
//  NotificationsView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 31.01.2021.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        VStack {
            Text("Уведомления")
                .foregroundColor(.secondaryColor)
                .font(Font.event.robotoMedium18)
                .padding(.top, 16)
            Divider()
            
            VStack {
                HStack(spacing: 10) {
                    Circle()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.primaryColor)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Василий Коновалов пригласил вас принять участие в Тренировка в ФОК Отрадное")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular16)
                        
                        Text("Сегодня, в 19:24")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular12)
                    }
                    Spacer()
                }
                .padding(16)
                Divider()
                
                
                
                HStack(spacing: 10) {
                    Circle()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.primaryColor)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Тренировка ФОК Отрадное начнется через 30 минут")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular16)
                        
                        Text("Сегодня, в 20:30")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular12)
                    }
                    Spacer()
                }
                .padding(16)
                Divider()
                
                
                
                
                HStack(spacing: 10) {
                    Circle()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.primaryColor)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Вы перемещены в Основной состав игры Автомобилист")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular16)
                        
                        Text("Сегодня, в 19:24")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular12)
                    }
                    Spacer()
                }
                .padding(16)
                Divider()
                
                
                
                
                HStack(spacing: 10) {
                    Circle()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.primaryColor)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Василий Коновалов отправил вам запрос на добавление в команду")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular16)
                        
                        Text("Сегодня, в 19:24")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular12)
                    }
                    Spacer()
                }
                .padding(16)
                Divider()
                
                
                
                
                HStack(spacing: 10) {
                    Circle()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.primaryColor)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("У игры Автомобилист изменилась дата")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular16)
                        
                        Text("Сегодня, в 19:24")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular12)
                    }
                    Spacer()
                }
                .padding(16)
                Divider()
            }
            Spacer()
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
