//
//  Font.swift
//  Start.Football
//
//  Created by Виталий Сосин on 25.11.2020.
//

import SwiftUI

extension Font {
    struct Event {
        let robotoBold20 = Font.custom("Roboto-Bold", size: 20)
        let robotoBold14 = Font.custom("Roboto-Bold", size: 14)
        let robotoRegular32 = Font.custom("Roboto-Regular", size: 32)
        let robotoRegular24 = Font.custom("Roboto-Regular", size: 24)
        let robotoRegular16 = Font.custom("Roboto-Regular", size: 16)
        let robotoRegular13 = Font.custom("Roboto-Regular", size: 13)
        let robotoMedium20 = Font.custom("Roboto-Medium", size: 20)
        let robotoMedium18 = Font.custom("Roboto-Medium", size: 18)
        let robotoMedium16 = Font.custom("Roboto-Medium", size: 16)
        let robotoMedium14 = Font.custom("Roboto-Medium", size: 14)
        let robotoMedium10 = Font.custom("Roboto-Medium", size: 10)
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
