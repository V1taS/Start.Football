//
//  InteractorsContainer.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 13.01.2021.
//

extension DIContainer {
    struct Interactors {
        let createGameInteractor: CreateGameInteractorProtocol
        
        init(createGameInteractor: CreateGameInteractorProtocol) {
            self.createGameInteractor = createGameInteractor
        }
        
        static var stub: Self {
            .init(createGameInteractor: CreateGameInteractor(appState: Store<AppState>(AppState())))
        }
    }
}
