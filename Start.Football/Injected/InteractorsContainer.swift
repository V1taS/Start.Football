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
        
        init(createGameInteractor: CreateGameInteractor,
             authInteractor: AuthInteractor) {
            self.createGameInteractor = createGameInteractor
            self.authInteractor = authInteractor
        }
        
        static var stub: Self {
            .init(createGameInteractor: CreateGameInteractorImpl(),
                  authInteractor: AuthInteractorImpl())
        }
    }
}

