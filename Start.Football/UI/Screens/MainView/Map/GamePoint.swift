//
//  GamePoint.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 24.01.2021.
//

import Foundation
import MapKit

final class GamePoint: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    let subtitle: String?

    init(title: String?, coordinate: CLLocationCoordinate2D, subtitle: String?) {
        self.title = title
        self.coordinate = coordinate
        self.subtitle = subtitle
    }
}
