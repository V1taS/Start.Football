//
//  FullscreenSheet.swift
//  Start.Football
//
//  Created by Виталий Сосин on 24.11.2020.
//

import SwiftUI

struct ViewControllerHolder {
    weak var value: UIViewController?
}

struct ViewControllerKey: EnvironmentKey {
    static var defaultValue: ViewControllerHolder {
        return ViewControllerHolder(value: UIApplication.shared.windows.first?.rootViewController)
    }
}

extension EnvironmentValues {
    var viewController: UIViewController? {
        get { return self[ViewControllerKey.self].value }
        set { self[ViewControllerKey.self].value = newValue }
    }
}

extension UIViewController {
    func present<Content: View>(style: UIModalPresentationStyle = .automatic, @ViewBuilder builder: () -> Content) {
        let toPresent = UIHostingController(rootView: AnyView(EmptyView()))
        toPresent.modalPresentationStyle = style
        toPresent.rootView = AnyView(
            builder()
                .environment(\.viewController, toPresent)
        )
        self.present(toPresent, animated: true, completion: nil)
    }
}
