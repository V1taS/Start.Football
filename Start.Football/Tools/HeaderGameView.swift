//
//  HeaderGameView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 25.11.2020.
//

import SwiftUI

struct HeaderGameView: View {
    let height: CGFloat
    let width: CGFloat
    var body: some View {
        HStack {
            Image("test")
                .resizable()
                .renderingMode(.original)
                .scaledToFill()
                .frame(width: width * 0.1159, height: height * 0.059)
            VStack(alignment: .leading, spacing: height * 0.0025){
                Text("Апполинарий")
                    .font(Font.event.robotoBold20)
                Text("Санкт-Петербург")
                    .font(Font.event.robotoRegular13)
            } .frame(width: width * 0.3623, height: height * 0.0614, alignment: .leading)
            Spacer()
            HStack(spacing: width * 0.058) {
                Image("map")
                Image("filter")
            }
        }
        .padding(.top, height * 0.059)
        .padding(.horizontal)
    }
}

struct HeaderGameView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderGameView(height: 2, width: 2)
    }
}
