//
//  HeaderGameView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 25.11.2020.
//

import SwiftUI

struct HeaderGameView: View {
    var body: some View {
        HStack {
            Image("test")
                .resizable()
                .renderingMode(.original)
                .scaledToFill()
                .frame(width: 48, height: 48)
            VStack(alignment: .leading, spacing: 2){
                Text("Апполинарий")
                    .font(Font.custom("Roboto-Medium", size: 20))
                Text("Санкт-Петербург")
                    .font(Font.custom("Roboto-Regular", size: 13))
            } .frame(width: 150, height: 50, alignment: .leading)
            Spacer()
            HStack(spacing: 24) {
                Image("map")
                Image("filter")
            }
        } .padding(.horizontal)
    }
}

struct HeaderGameView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderGameView()
    }
}
