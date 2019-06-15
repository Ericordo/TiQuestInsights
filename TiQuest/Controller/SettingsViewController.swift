//
//  SettingsViewController.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 14/06/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var settingsView = SettingsView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0)
        self.navigationItem.title = "Settings"
        let margins = self.view.layoutMarginsGuide
        
        let settingsTableView = settingsView.settingsTableView
        let tableViewHeight = settingsTableView.contentSize.height
        print("table height \(tableViewHeight)")
        self.view.addSubview(settingsTableView)
        settingsTableView.translatesAutoresizingMaskIntoConstraints = false
        settingsTableView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 40).isActive = true
        settingsTableView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -200).isActive = true
        settingsTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40).isActive = true
        settingsTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40).isActive = true
//        settingsTableView.heightAnchor.constraint(equalToConstant: settingsTableView.frame.height)
        
       

        // Do any additional setup after loading the view.
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
