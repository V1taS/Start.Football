//
//  ColorExtensions.swift
//  Start.Football
//
//  Created by Виталий Сосин on 08.12.2020.
//

import SwiftUI

extension Color {
    static let defaultColor = Color("default")
    static let desc = Color("desc")
    static let error = Color("error")
    static let inactive = Color("inactive")
    static let pressed = Color("pressed")
    static let primary = Color("primary")
    static let secondary = Color("secondary")
    static let tertiary = Color("tertiary")
    static let white = Color("white")
}

extension UIColor {
    private static func getColorForName(_ colorName: String) -> UIColor {
        UIColor(named: colorName) ?? UIColor.red
    }

    static var defaultColor: UIColor {
        self.getColorForName("default")
    }
    
    static var desc: UIColor {
        self.getColorForName("desc")
    }
    
    static var error: UIColor {
        self.getColorForName("error")
    }
    
    static var inactive: UIColor {
        self.getColorForName("inactive")
    }
    
    static var pressed: UIColor {
        self.getColorForName("pressed")
    }
    
    static var primary: UIColor {
        self.getColorForName("primary")
    }
    
    static var secondary: UIColor {
        self.getColorForName("secondary")
    }
    
    static var tertiary: UIColor {
        self.getColorForName("tertiary")
    }
    
    static var white: UIColor {
        self.getColorForName("white")
    }
}
