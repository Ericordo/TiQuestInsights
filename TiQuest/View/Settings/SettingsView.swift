//
//  SettingsView.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 14/06/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import Foundation
import UIKit

class OpeningHours {
    var openingTime = 1
    var closingTime = 11
}

class SettingsView : NSObject {
    
   
    
    let settingsTableView : UITableView = {
        let tv = UITableView()
        tv.isScrollEnabled = true
        tv.showsVerticalScrollIndicator = false
        tv.allowsSelection = true
        tv.tableFooterView = UITableViewHeaderFooterView(frame: .zero)
        tv.frame.size.height = tv.contentSize.height
        tv.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0)
        return tv
    }()

    override init() {
        super.init()
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        settingsTableView.register(LogOutTableViewCell.self, forCellReuseIdentifier: "LogOutCell")
        settingsTableView.register(OpeningSelectionTableViewCell.self, forCellReuseIdentifier: "OpeningCell")
        settingsTableView.register(ClosingSelectionTableViewCell.self, forCellReuseIdentifier: "ClosingCell")
        settingsTableView.register(ToItemListTableViewCell.self, forCellReuseIdentifier: "toItemListCell")
        settingsTableView.frame.size.height = settingsTableView.contentSize.height
        
    }
    
    func showLogOutAlert() {
        let logOutAlert = UIAlertController(title: "Log Out", message: "Are you sure?", preferredStyle: .alert)
        let logOut = UIAlertAction(title: "Log Out", style: .destructive, handler: {action in self.didTapLogOut()})
        let dismiss = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        logOutAlert.addAction(logOut)
        logOutAlert.addAction(dismiss)
        UIApplication.shared.keyWindow?.rootViewController?.present(logOutAlert, animated: true, completion: nil)
      
    }
    
    @objc func didTapLogOut() {
        print("Log out")
        defaults.set(false, forKey: "LOGGED_IN")
        AppDelegate.shared.rootViewController.switchToLogout()
    }



}

extension SettingsView: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
            } else {
                return 1
            }
        }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let logOutCell = tableView.dequeueReusableCell(withIdentifier: "LogOutCell") as! LogOutTableViewCell
        let openingSelectionCell = tableView.dequeueReusableCell(withIdentifier: "OpeningCell") as! OpeningSelectionTableViewCell
        let closingSelectionCell = tableView.dequeueReusableCell(withIdentifier: "ClosingCell") as! ClosingSelectionTableViewCell
        let toItemListCell = tableView.dequeueReusableCell(withIdentifier: "toItemListCell") as! ToItemListTableViewCell
       
      
        
        switch indexPath {
        case [0,0]:
            return openingSelectionCell
        case [0,1]:
            return closingSelectionCell
        case [1,0]:
            return toItemListCell
        case [2,0]:
            return logOutCell
        default:
            return logOutCell
        }
        
    
  
    
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "Opening Hours (Select a day in the Dashboard to refresh)"
        case 1:
            return "Item Management"
        case 2:
            return "Account"
        default:
            return "Error"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    
    
    

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return ""
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionFooterView = UITableViewHeaderFooterView(frame: .zero)
        return sectionFooterView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        switch indexPath {
        case [1,0]:
            let itemList = ItemListViewController()
            
        case [2,0]:
            showLogOutAlert()
        default:
            break
        }
    }
    
    


}
