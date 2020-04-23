//
//  BasicErrorPresenter.swift
//  CroesusApp
//
//  Created by Grace Njoroge on 23/04/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit

// use this to display basic errors
struct BasicErrorPresenter {
    let message : String
}

/// primary used to display API Errors so the presentation is pushed to main thread by default
extension BasicErrorPresenter {
    func present(in viewcontroller: UIViewController) {
        let actionsheet = UIAlertController(title: "Error",
                                            message: message,
                                            preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel) { (action) in
            actionsheet.dismiss(animated: true, completion: nil)
        }
        actionsheet.addAction(action)
        DispatchQueue.main.async {
            viewcontroller.present(actionsheet, animated: true, completion: nil)
        }
    }
}
