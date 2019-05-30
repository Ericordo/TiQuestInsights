//
//  LoginViewController.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 20/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(confirmButton)
        confirmButton.addTarget(self, action: #selector(didTapConfirm), for: .touchUpInside)
        
        
        // Do any additional setup after loading the view.
    }
    
    let userNameField : UITextField = {
        let textField = UITextField()
        
    
        return textField
    }()
    
    let passwordField : UITextField = {
        let textField = UITextField()
        
        
        
        return textField
    }()
    
    let confirmButton : UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.backgroundColor = UIColor.black
        
        
        
        return button
    }()
    
    
    
    
    @objc func didTapConfirm() {
        let destinationVC = DashboardViewController()
        destinationVC.modalPresentationStyle = .overFullScreen
        destinationVC.modalTransitionStyle = .crossDissolve
        self.present(destinationVC, animated: true, completion: nil)
        
        
    }



}
