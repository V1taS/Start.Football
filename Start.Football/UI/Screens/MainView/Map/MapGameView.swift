//
//  MapGameView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 30.11.2020.
//

import SwiftUI
import MapKit

struct MapGameView: View {
    
    private var appBinding: Binding<AppState.AppData>
    init(appBinding: Binding<AppState.AppData>) {
        self.appBinding = appBinding
    }
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundColor
                MapView(checkpoints: appBinding.main.map.gamePoint)
                    
                    .edgesIgnoringSafeArea(.all)
                    .navigationBarTitle(Text("Start.Football"), displayMode: .large)
                    .navigationBarItems(trailing: Button(action: {
                        dismissButton()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .imageScale(.large)
                            .foregroundColor(Color(.secondaryLabel))
                    }
                    )
            }
        }
    }
}

// MARK: Sheet View
private extension MapGameView {
    private var backgroundColor: some View {
        ZStack {
            Color.secondary
                .edgesIgnoringSafeArea(.all)
                .animation(.linear(duration: 10))
        }
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            self.viewController?.dismiss(animated: true, completion: nil)
        }
    }
}

// MARK: Actions
private extension MapGameView {
    private func dismissButton() {
        self.viewController?.dismiss(animated: true, completion: nil)
    }
}

struct MapGameView_Previews: PreviewProvider {
    static var previews: some View {
        MapGameView(appBinding: .constant(.init()))
    }
}
