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

//// MARK: - Show Alert
//extension UIViewController {
//    func showAlertAction(
//        with title: String,
//        and message: String,
//        completion: @escaping () -> Void = { }
//    ) {
//        let joinTeam = UIAlertAction(
//            title: NSLocalizedString("SetupProfileViewControllerJoinTeam",
//                                     comment: message),
//            style: .default
//        )
//        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
//            completion()
//        }
//        alertController.addAction(okAction)
//        present(alertController, animated: true, completion: nil)
//    }
//}
//
//
//
//
//let joinTeam = UIAlertAction(
//    title: NSLocalizedString("SetupProfileViewControllerJoinTeam",
//                             comment: "Join the team"),
//    style: .default
//) { _ in
//    let joinToFooTeam = UIHostingController(rootView: JoinToTeamView())
//    joinToFooTeam.modalPresentationStyle = .fullScreen
//    self.present(joinToFooTeam, animated: true, completion: nil)
//}
