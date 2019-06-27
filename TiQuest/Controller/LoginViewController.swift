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
        view.backgroundColor = UIColor.white
        title = "Login Screen"
        let loginButton = UIBarButtonItem(title: "Log In", style: .plain, target: self, action: #selector(login))
        navigationItem.setLeftBarButton(loginButton, animated: true)

        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        setUpUI()
        
        signInButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        
    }
    
    
    let backgroundImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "loginbackground")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let signInButton : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Sign In", for: .normal)
        
        
        return button
    }()
    
    let usernameField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .clear
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor

        return textField
    }()
    
    let passwordField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .lightGray
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    let confirmButton : UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    let requestAccountButton : UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    
    func setUpUI() {
        view.addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        
        view.addSubview(signInButton)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        signInButton.widthAnchor.constraint(equalToConstant: 240).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        signInButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 500).isActive = true
        
        view.addSubview(usernameField)
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        usernameField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        usernameField.widthAnchor.constraint(equalToConstant: 240).isActive = true
        usernameField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        usernameField.topAnchor.constraint(equalTo: self.signInButton.bottomAnchor, constant: 20).isActive = true
        
        view.addSubview(passwordField)
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        passwordField.widthAnchor.constraint(equalToConstant: 240).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        passwordField.topAnchor.constraint(equalTo: self.usernameField.bottomAnchor, constant: 20).isActive = true
        
        
    }
    
    
    @objc private func login() {
        // store the user session (example only, not for the production)
        defaults.set(true, forKey: "LOGGED_IN")
        // navigate to the Main Screen
        AppDelegate.shared.rootViewController.switchToMainScreen()
    }
}
