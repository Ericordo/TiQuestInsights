//
//  SplashScreenViewController.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 17/06/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {

    private let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(activityIndicator)
        activityIndicator.frame = view.bounds
        activityIndicator.backgroundColor = UIColor(white: 0, alpha: 0.4)
        makeServiceCall()
    }
    
    private func makeServiceCall() {
        activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
            self.activityIndicator.stopAnimating()
            
            if defaults.bool(forKey: "LOGGED_IN") {
                // navigate to protected page
                AppDelegate.shared.rootViewController.switchToMainScreen()
            } else {
                // navigate to login screen
                AppDelegate.shared.rootViewController.switchToLogout()
            }
        }
    }

}
