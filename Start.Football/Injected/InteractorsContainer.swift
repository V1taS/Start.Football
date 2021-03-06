//
//  InteractorsContainer.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 17.01.2021.
//

extension DIContainer {
    struct Interactors {
        let createGameInteractor: CreateGameInteractor
        let editGameInteractor: EditGameInteractor
        let editProfileInteractor: EditProfileInteractor
        let authInteractor: AuthInteractor
        let mainAppInteractor: MainAppInteractor
        let currentGameInteractor: CurrentGameInteractor
        let menuInteractor: MenuInteractor

        init(createGameInteractor: CreateGameInteractor,
             authInteractor: AuthInteractor,
             mainAppInteractor: MainAppInteractor,
             currentGameInteractor: CurrentGameInteractor,
             menuInteractor: MenuInteractor,
             editGameInteractor: EditGameInteractor,
             editProfileInteractor: EditProfileInteractor) {
            self.createGameInteractor = createGameInteractor
            self.authInteractor = authInteractor
            self.mainAppInteractor = mainAppInteractor
            self.currentGameInteractor = currentGameInteractor
            self.menuInteractor = menuInteractor
            self.editGameInteractor = editGameInteractor
            self.editProfileInteractor = editProfileInteractor
        }

        static var stub: Self {
            .init(createGameInteractor: CreateGameInteractorImpl(),
                  authInteractor: AuthInteractorImpl(),
                  mainAppInteractor: MainAppInteractorImpl(),
                  currentGameInteractor: CurrentGameInteractorImpl(),
                  menuInteractor: MenuInteractorImpl(),
                  editGameInteractor: EditGameInteractorImpl(),
                  editProfileInteractor: EditProfileInteractorImpl())
        }
    }
}

