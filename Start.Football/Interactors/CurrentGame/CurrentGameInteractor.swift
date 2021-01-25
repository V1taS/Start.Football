//
//  CurrentGameInteractor.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 23.01.2021.
//

import Combine
import SwiftUI

protocol CurrentGameInteractor: CellCurrentGameInteractor, WhoWillPlayCurrentGameInteractor
                                , CalendarCurrentGameInteractor {

}

struct CurrentGameInteractorImpl: CurrentGameInteractor {

}
