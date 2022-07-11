//
//  Alert.swift
//  Candyspace
//
//  Created by Manish on 13/05/22.
//

import Foundation

import UIKit


class Alert: NSObject {    
    static func show(_ title: String, message: String, onVC: UIViewController) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        let cancelAction = UIAlertAction(title: "OK",
                                         style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        DispatchQueue.main.async {
            onVC.present(alert, animated: true, completion: nil)
        }
    }
}

class AlertMsg: NSObject {
    static var emptySearchKey: String = "Please enter searchkey"
}
