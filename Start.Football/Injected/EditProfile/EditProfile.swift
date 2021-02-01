//
//  EditProfile.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 01.02.2021.
//

import SwiftUI

extension AppState.AppData {
    struct EditProfile: Equatable {
        var name: String = ""
        var login: String = ""
        var mail: String = ""
        var password: String = ""
        var tShirtNumber: String = ""
        var position: String = ""
        var avatarStringURL: String = ""
        var weight: String = ""
        var growth: String = ""
        var age: String = ""
        var city: String = ""
        var aboutMe: String = ""
        var takePart: String = ""
        var organized: String = ""
        var phoneNumber: String = ""
        var rating: String = ""
        var payment: String = ""
        
        var image: Data? = nil
        var uiImage: UIImage? = nil
        var showAction: Bool = false
        var showImagePicker: Bool = false

    }
}
