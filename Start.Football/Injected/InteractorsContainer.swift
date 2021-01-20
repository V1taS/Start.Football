//
//  InteractorsContainer.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 17.01.2021.
//

extension DIContainer {
    struct Interactors {
        let createGameInteractor: CreateGameInteractor
        let authInteractor: AuthInteractor
        let mainAppInteractor: MainAppInteractor
        
        init(createGameInteractor: CreateGameInteractor,
             authInteractor: AuthInteractor,
             mainAppInteractor: MainAppInteractor) {
            self.createGameInteractor = createGameInteractor
            self.authInteractor = authInteractor
            self.mainAppInteractor = mainAppInteractor
        }
        
        static var stub: Self {
            .init(createGameInteractor: CreateGameInteractorImpl(),
                  authInteractor: AuthInteractorImpl(),
                  mainAppInteractor: MainAppInteractorImpl())
        }
    }
}

