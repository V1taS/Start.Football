//
//  PlaceGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 23.01.2021.
//

import Foundation
import MapKit

struct PlaceGame {
    let title: String?
    let coordinate: CLLocationCoordinate2D

    init(title: String?, coordinate: CLLocationCoordinate2D) {
      self.title = title
      self.coordinate = coordinate
    }
}
