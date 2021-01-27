//
//  showAlert.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 25.01.2021.
//

import SwiftUI

// MARK: - Show Alert
extension UIViewController {
    func showAlert(
        with title: String,
        and message: String,
        completion: @escaping () -> Void = { }
    ) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            completion()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
