//
//  ViewController.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 16/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit


class RootViewController: UIViewController {

    private var current: UIViewController
    
    init() {
        self.current = SplashScreenViewController()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(current)               // 1
        current.view.frame = view.bounds              // 2
        view.addSubview(current.view)                 // 3
        current.didMove(toParent: self) // 4
    }
    
    func showLoginScreen() {
        
        let new = UINavigationController(rootViewController: LoginViewController())                               // 1
        addChild(new)                    // 2
        new.view.frame = view.bounds                   // 3
        view.addSubview(new.view)                      // 4
        new.didMove(toParent: self)      // 5
        current.willMove(toParent: nil)  // 6
        current.view.removeFromSuperview()          // 7
        current.removeFromParent()       // 8
        current = new                                  // 9
    }
    
    func switchToMainScreen(id: Int, businessName: String) {
        let mainViewController = DashboardViewController()
        DashboardViewController.businessId = id
        DashboardViewController.businessName = businessName
        let new = UINavigationController(rootViewController: mainViewController)
        
        animateFadeTransition(to: new)
    }
    
    private func animateFadeTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
        current.willMove(toParent: nil)
        addChild(new)
        
        transition(from: current, to: new, duration: 0.3, options: [.transitionCrossDissolve, .curveEaseOut], animations: {
        }) { completed in
            self.current.removeFromParent()
            new.didMove(toParent: self)
            self.current = new
            completion?()  //1
        }
    }
    
    func switchToLogout() {
        let loginViewController = LoginViewController()
        let logoutScreen = UINavigationController(rootViewController: loginViewController)
        animateDismissTransition(to: logoutScreen)
    }
    
    private func animateDismissTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
//        let initialFrame = CGRect(x: -view.bounds.width, y: 0, width: view.bounds.width, height: view.bounds.height)
        current.willMove(toParent: nil)
        addChild(new)
        transition(from: current, to: new, duration: 0.3, options: [], animations: {
            new.view.frame = self.view.bounds
        }) { completed in
            self.current.removeFromParent()
            new.didMove(toParent: self)
            self.current = new
            completion?()
        }
    }

}

