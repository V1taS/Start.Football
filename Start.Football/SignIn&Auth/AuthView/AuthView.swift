//
//  ContentView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 23.11.2020.
//

import SwiftUI

struct AuthView: View {
    
    @ObservedObject var viewModel = AuthViewModel()
    
    var body: some View {
        VStack {
            Text("Регистрация")
                .font(Font.custom("Roboto", size: 32))
                .padding(.top, 76)
            
            VStack(spacing: 24) {
                Button(action: { viewModel.isPresentedProfile.toggle() }) {
                    ButtonView(background: #colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1),
                               text: "Продолжить с Apple")
                } .sheet(isPresented: $viewModel.isPresentedProfile) {
                    SignUpView() }
                
                Button(action: { viewModel.isPresentedProfile.toggle() }) {
                    ButtonView(background: #colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1),
                               text: "Зарегистрироваться с Google")
                } .sheet(isPresented: $viewModel.isPresentedProfile) {
                    SignUpView() }
                
                Button(action: { viewModel.isPresentedProfile.toggle() }) {
                    ButtonView(background: #colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1),
                               text: "Зарегистрироваться с VK")
                } .sheet(isPresented: $viewModel.isPresentedProfile) {
                    SignUpView() }
                
                Button(action: { viewModel.isPresentedProfile.toggle() }) {
                    ButtonView(background: #colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1),
                               text: "Зарегистрироваться с Facebook")
                } .sheet(isPresented: $viewModel.isPresentedProfile) {
                    SignUpView() }
                
                HStack {
                    Text("Регистрация")
                        .font(Font.custom("Roboto", size: 16))
                    Button(action: { viewModel.isPresentedProfile.toggle() }) {
                        Text("по e-mail")
                            .font(Font.custom("Roboto", size: 16))
                            .foregroundColor(Color(#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)))
                    } .sheet(isPresented: $viewModel.isPresentedProfile) {
                        SignUpView() }
                }
            } .padding(.top, 170)
            
            Spacer()
            
            Divider()
                .padding(.bottom, 32)
            
            HStack {
                Text("Уже есть аккаунт?")
                    .font(Font.custom("Roboto", size: 16))
                Button(action: { viewModel.isPresentedLogin.toggle() }) {
                    Text("Войдите")
                        .font(Font.custom("Roboto", size: 16))
                        .foregroundColor(Color(#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)))
                } .sheet(isPresented: $viewModel.isPresentedLogin) {
                    LoginView() }
                
            } .padding(.bottom, 32)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
