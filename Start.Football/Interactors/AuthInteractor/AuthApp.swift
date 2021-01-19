//
//  AuthApp.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 19.01.2021.
//

import Foundation

extension AppActions {
    struct AuthApp {
        enum AuthError: String {
            case notFilled = "Поля не заполнены"
            case invalidEmail = "Неверный адрес электронной почты"
            case passwordsNotMatched = "Пароли не соответствуют"
            case unknownError = "Неизвестная ошибка"
            case serverError = "Ошибка сервера"
            case success = ""
        }
        
        enum UserError {
            case notFilled
            case photoNotExist
            case cannotGetUserInfo
        }
    }
}

extension AppActions.AuthApp.AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return "Поле не заполнено"
        case .invalidEmail:
            return "Неверный адрес электронной почты или логин"
        case .passwordsNotMatched:
            return "Пароли не соответствуют"
        case .unknownError:
            return "Неизвестная ошибка"
        case .serverError:
            return "Ошибка сервера"
        case .success:
            return ""
        }
    }
}

extension AppActions.AuthApp.UserError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return "Заполните все поля"
        case .photoNotExist:
            return "Пользователь не выбрал фото"
        case .cannotGetUserInfo:
            return "Не удалось загрузить информацию о пользователе"
        }
    }
}
