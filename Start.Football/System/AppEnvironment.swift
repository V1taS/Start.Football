//
//  AppEnvironment.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 13.01.2021.
//

import UIKit
import Combine

struct AppEnvironment {
    let container: DIContainer
}

extension AppEnvironment {
    static func bootstrap() -> AppEnvironment {
        let appState = Store<AppState>(AppState())
        let interactors = configuredInteractors(appState: appState)
        let diContainer = DIContainer(appState: appState, interactors: interactors)
        return AppEnvironment(container: diContainer)
    }
    
    private static func configuredInteractors(appState: Store<AppState>) -> DIContainer.Interactors {
        let createGameInteractor = CreateGameInteractorImpl()
        let authInteractor = AuthInteractorImpl()
        let mainAppInteractor = MainAppInteractorImpl()
        let currentGameInteractor = CurrentGameInteractorImpl()
        let menuInteractor = MenuInteractorImpl()
        let editGameInteractor = EditGameInteractorImpl()
        return .init(createGameInteractor: createGameInteractor,
                     authInteractor: authInteractor,
                     mainAppInteractor: mainAppInteractor,
                     currentGameInteractor: currentGameInteractor,
                     menuInteractor: menuInteractor,
                     editGameInteractor: editGameInteractor)
    }
}
