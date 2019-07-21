//
//  LoginViewController.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 20/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var credential : Credentials?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Login Screen"
        let loginButton = UIBarButtonItem(title: "Log In", style: .plain, target: self, action: #selector(login))
        navigationItem.setLeftBarButton(loginButton, animated: true)

        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        setUpUI()
        
        signInButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        usernameField.delegate = self
        passwordField.delegate = self
        
    }
    
    
    let backgroundImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "loginbackground")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let stackView : UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fillProportionally
        sv.spacing = 0
        return sv
    }()
    
    let tiquestLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.text = "TiQuest"
        label.font = UIFont(name: "Helvetica", size: 200.0)
        
        label.numberOfLines = 1
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.sizeToFit()
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    let tiquestSubtitleLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.text = "Insights"
        label.font = UIFont(name: "Helvetica", size: 60.0)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.sizeToFit()
        label.minimumScaleFactor = 0.5
        
        return label
    }()
    
    let loginStackView : UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 10
        return sv
    }()
    
    
    
    
    
    let usernameField : UITextField = {
        let textField = UITextField()
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.height))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.placeholder = "Username"
        textField.layer.cornerRadius = 15
        textField.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 0.3)
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.black.cgColor
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        return textField
    }()
    
    let passwordField : UITextField = {
        let textField = UITextField()
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.height))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.placeholder = "Password"
        textField.layer.cornerRadius = 15
        textField.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 0.3)
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.black.cgColor
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        
        return textField
    }()
    
    let signInButton : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Log In", for: .normal)
        
        
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
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(tiquestLabel)
        stackView.addArrangedSubview(tiquestSubtitleLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
//        stackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -800).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 200).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -200).isActive = true
        
        view.addSubview(loginStackView)
        loginStackView.addArrangedSubview(usernameField)
        loginStackView.addArrangedSubview(passwordField)
        loginStackView.addArrangedSubview(signInButton)
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        usernameField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        loginStackView.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 100).isActive = true
//        loginStackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -200).isActive = true
        loginStackView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        loginStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        loginStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 550).isActive = true
//        loginStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -550).isActive = true
        
//        view.addSubview(signInButton)
//        signInButton.translatesAutoresizingMaskIntoConstraints = false
//        signInButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
////        signInButton.widthAnchor.constraint(equalToConstant: 240).isActive = true
//        signInButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
//        signInButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 500).isActive = true
////
//        view.addSubview(usernameField)
//        usernameField.translatesAutoresizingMaskIntoConstraints = false
//        usernameField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        usernameField.widthAnchor.constraint(equalToConstant: 240).isActive = true
//        usernameField.heightAnchor.constraint(equalToConstant: 60).isActive = true
//        usernameField.topAnchor.constraint(equalTo: self.signInButton.bottomAnchor, constant: 20).isActive = true
//
//        view.addSubview(passwordField)
//        passwordField.translatesAutoresizingMaskIntoConstraints = false
//        passwordField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        passwordField.widthAnchor.constraint(equalToConstant: 240).isActive = true
//        passwordField.heightAnchor.constraint(equalToConstant: 60).isActive = true
//        passwordField.topAnchor.constraint(equalTo: self.usernameField.bottomAnchor, constant: 20).isActive = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOutside))
        
        self.view.addGestureRecognizer(tapGesture)
        
        passwordField.isSecureTextEntry = true
    }
    
    
    @objc private func login() {
        self.view.endEditing(true)
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""
        print(username)
    
        
        if checkCredentials(username: username, password: password) {
            // store the user session (example only, not for the production)
            defaults.set(true, forKey: "LOGGED_IN")
            defaults.set(credential!.id, forKey: "BUSINESSID")
            defaults.set(credential!.businessName, forKey: "BUSINESSNAME")
            // navigate to the Main Screen
            AppDelegate.shared.rootViewController.switchToMainScreen(id: credential!.id, businessName: credential!.businessName)
        }
    
        
    }
    
    @objc func didTapOutside() {
        view.self.endEditing(true)
        
    }
    
    
    func checkCredentials(username: String, password: String) -> Bool {
        if credentials.contains(where: {$0.username == username}) {
            usernameField.layer.borderColor = UIColor.green.cgColor
            credential = credentials.filter({$0.username == username}).first
                } else {
            usernameField.layer.borderColor = UIColor.red.cgColor
            usernameField.shake()
            return false
        }
        if credential?.password == password {
            passwordField.layer.borderColor = UIColor.green.cgColor
            return true
        } else {
            passwordField.layer.borderColor = UIColor.red.cgColor
            passwordField.shake()
            return false
        }
    }

}



extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
        textField.layer.borderColor = UIColor.black.cgColor
    }
}

extension UITextField {

func shake() {
    let animation = CABasicAnimation(keyPath: "position")
    animation.duration = 0.1
    animation.repeatCount = 4
    animation.autoreverses = true
    animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 4, y: self.center.y))
    animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 4, y: self.center.y))
    self.layer.add(animation, forKey: "position")
}

}
