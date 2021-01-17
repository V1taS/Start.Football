//
//  InteractorsContainer.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 17.01.2021.
//

extension DIContainer {
    struct Interactors {
        let createGameInteractor: CreateGameInteractor
        
        init(createGameInteractor: CreateGameInteractor) {
            self.createGameInteractor = createGameInteractor
        }
        
        static var stub: Self {
            .init(createGameInteractor: CreateGameInteractorImpl())
        }
    }
}

