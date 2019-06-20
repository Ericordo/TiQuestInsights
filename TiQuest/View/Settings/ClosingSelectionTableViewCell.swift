//
//  ClosingSelectionTableViewCell.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 15/06/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit

protocol ClosingTimeUpdateDelegate {
    func updateClosingTime()
}


class ClosingSelectionTableViewCell: UITableViewCell {
    
    var closingTimeUpdateDelegate : ClosingTimeUpdateDelegate!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        hourPicker.delegate = self
        hourPicker.dataSource = self
        self.addSubview(hourLabel)
        hourLabel.translatesAutoresizingMaskIntoConstraints = false
        //        self.hourLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        self.hourLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        self.hourLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        self.hourLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        self.hourLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        self.addSubview(hourPicker)
        hourPicker.translatesAutoresizingMaskIntoConstraints = false
        //        self.hourPicker.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        self.hourPicker.leadingAnchor.constraint(equalTo: self.hourLabel.trailingAnchor, constant: 10).isActive = true
        self.hourPicker.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        self.hourPicker.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        self.hourPicker.widthAnchor.constraint(equalToConstant: 100).isActive = true
        let row = defaults.integer(forKey: "closingTimeBusiness") - 1
//        self.hourPicker.selectRow(row, inComponent: 0, animated: true)
        let todaySalesChart = TodaySalesChart()
        self.closingTimeUpdateDelegate = todaySalesChart
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let openingHours : [OpeningHour] = [OpeningHour(time: "01:00", value: 1),
                                        OpeningHour(time: "02:00", value: 2),
                                        OpeningHour(time: "03:00", value: 3),
                                        OpeningHour(time: "04:00", value: 4),
                                        OpeningHour(time: "05:00", value: 5),
                                        OpeningHour(time: "06:00", value: 6),
                                        OpeningHour(time: "07:00", value: 7),
                                        OpeningHour(time: "08:00", value: 8),
                                        OpeningHour(time: "09:00", value: 9),
                                        OpeningHour(time: "10:00", value: 10),
                                        OpeningHour(time: "11:00", value: 11),
                                        OpeningHour(time: "12:00", value: 12),
                                        OpeningHour(time: "13:00", value: 13),
                                        OpeningHour(time: "14:00", value: 14),
                                        OpeningHour(time: "15:00", value: 15),
                                        OpeningHour(time: "16:00", value: 16),
                                        OpeningHour(time: "17:00", value: 17),
                                        OpeningHour(time: "18:00", value: 18),
                                        OpeningHour(time: "19:00", value: 19),
                                        OpeningHour(time: "20:00", value: 20),
                                        OpeningHour(time: "21:00", value: 21),
                                        OpeningHour(time: "22:00", value: 22),
                                        OpeningHour(time: "23:00", value: 23),
                                        OpeningHour(time: "00:00", value: 24)]
    
    let hourPicker : UIPickerView = {
        let picker = UIPickerView()
        
        
        return picker
    }()
    
    let hourLabel : UILabel = {
        let label = UILabel()
        label.text = "Closing Time: "
        
        return label
    }()
    
    
    var closingTime = 23
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension ClosingSelectionTableViewCell: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return openingHours.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return openingHours[row].time
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let index = pickerView.selectedRow(inComponent: 0)
        closingTime = openingHours[index].value
        defaults.set(closingTime, forKey: "closingTimeBusiness")
        closingTimeUpdateDelegate.updateClosingTime()
    }
    
}

