//
//  Font.swift
//  Start.Football
//
//  Created by Виталий Сосин on 25.11.2020.
//

import SwiftUI

extension Font {
    struct Event {
        let title = Font.custom("Roboto-Regular", size: 32)
        let regularBold = Font.custom("Roboto-Medium", size: 18)
        let regular = Font.custom("Roboto-Regular", size: 16)
        
        
        let name = Font.custom("Roboto-Black", size: 14)
        let location = Font.custom("Roboto-Black", size: 10)
        let date = Font.custom("Roboto-Black", size: 16)
        let price = Font.custom("Roboto-Black", size: 12)
    }
    static let event = Event()
}

/*
 Roboto-Black
 Roboto-Bold
 Roboto-Light
 Roboto-Medium
 Roboto-Regular
 Roboto-Thin
 
 Text("iPhone 12 Pro Super Max").font(Font.event.name)
 */
