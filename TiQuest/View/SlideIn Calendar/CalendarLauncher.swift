//
//  CalendarLauncher.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 17/06/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import Foundation
import UIKit

protocol CalendarUpdateDelegate {
    func updateSelectedWeek(day: Int, month: Int, year: Int)
}

protocol MonthLabelUpdateDelegate {
    func updateSelectedMonth(month: String)
}

protocol WeekNumberUpdateDelegate {
    func updateWeekNumber(day: Int, month: Int, year: Int)
}

class CalendarLauncher: NSObject {
    
    var calendarUpdateDelegate : CalendarUpdateDelegate!
    var monthLabelUpdateDelegate : MonthLabelUpdateDelegate!
    var weekNumberUpdateDelegate : WeekNumberUpdateDelegate!
    
    
    let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    let daysOfMonth = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    var daysInMonths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    var currentMonth = String()
    
    var numberOfEmptyBox = Int()
    var nextNumberOfEmptyBoxes = Int()
    var previousNumberOfEmptyBoxes = 0
    var direction = 0
    var positionIndex = 0
    
    var leapYearCounter = 1
    
    var dayCounter = 0
    
    

    
    let darkView = UIView()
    
    let calendarCollectionViewHeight : CGFloat = 320
    let monthLabelHeight : CGFloat = 50
    let weekdayStackViewHeight : CGFloat = 50
    let backgroundViewHeight : CGFloat = 420
    
    var stackViewBottomConstant : CGFloat = 50
    
    let backgroundView : UIView = {
        let bView = UIView(frame: .zero)
        bView.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0)
        return bView
    }()

    
    let monthLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0)
        return label
    }()
    
    let previousButton : UIButton = {
        let button = UIButton()
        button.setTitle("Previous", for: .normal)
        button.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0)
        button.setTitleColor(.black, for: .normal)
       
        
        return button
    }()
    
    let nextButton : UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0)
        button.setTitleColor(.black, for: .normal)
        
        
        return button
    }()
    
    let weekdayStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    
    let calendarCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0)
        return cv
    }()
    
    func showCalendar() {
        if let view = UIApplication.shared.keyWindow {
            darkView.backgroundColor = UIColor(white: 0, alpha: 0.5)
  
            view.addSubview(darkView)
            view.addSubview(backgroundView)
            backgroundView.addSubview(calendarCollectionView)
            backgroundView.addSubview(weekdayStackView)
            backgroundView.addSubview(monthLabel)
            backgroundView.addSubview(previousButton)
            backgroundView.addSubview(nextButton)
           
            previousButton.addTarget(self, action: #selector(didTapPrevious), for: .touchUpInside)
            nextButton.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
            
            monthLabel.translatesAutoresizingMaskIntoConstraints = false
            monthLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 100).isActive = true
            monthLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -100).isActive = true
            monthLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 0).isActive = true
            monthLabel.heightAnchor.constraint(equalToConstant: monthLabelHeight).isActive = true
            
            previousButton.translatesAutoresizingMaskIntoConstraints = false
            previousButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 0).isActive = true
            previousButton.trailingAnchor.constraint(equalTo: monthLabel.leadingAnchor, constant: 0).isActive = true
            previousButton.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 0).isActive = true
            previousButton.heightAnchor.constraint(equalToConstant: monthLabelHeight).isActive = true
            
            nextButton.translatesAutoresizingMaskIntoConstraints = false
            nextButton.leadingAnchor.constraint(equalTo: monthLabel.trailingAnchor, constant: 0).isActive = true
            nextButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: 0).isActive = true
            nextButton.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 0).isActive = true
            nextButton.heightAnchor.constraint(equalToConstant: monthLabelHeight).isActive = true
            
            weekdayStackView.translatesAutoresizingMaskIntoConstraints = false
            weekdayStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
            weekdayStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
            weekdayStackView.topAnchor.constraint(equalTo: monthLabel.bottomAnchor, constant: 0).isActive = true
            weekdayStackView.heightAnchor.constraint(equalToConstant: weekdayStackViewHeight).isActive = true
            
            
            calendarCollectionView.translatesAutoresizingMaskIntoConstraints = false
            calendarCollectionView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 0).isActive = true
            calendarCollectionView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: 0).isActive = true
            calendarCollectionView.topAnchor.constraint(equalTo: weekdayStackView.bottomAnchor, constant: 0).isActive = true
            calendarCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
            
            let ybackgroundView = view.frame.height - backgroundViewHeight
            backgroundView.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: backgroundViewHeight)
            
            darkView.frame = view.frame
            darkView.alpha = 0
            darkView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.darkView.alpha = 1
                self.backgroundView.frame = CGRect(x: 0, y: ybackgroundView , width: view.frame.width, height: self.backgroundViewHeight)
            }, completion: nil)
        }
            

        
    }
    
    @objc func handleDismiss() {
        UIView.animate(withDuration: 0.5, animations:  {
            self.darkView.alpha = 0
            if let view = UIApplication.shared.keyWindow {
                self.backgroundView.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: self.backgroundViewHeight)
            }
        })
    }
    
    @objc func didTapPrevious() {
        switch currentMonth {
        case "January":
            month = 11
            year -= 1
            direction = -1
//            if leapYearCounter > 0 {
//                leapYearCounter -= 1
//            }
//            if leapYearCounter == 0 {
//                daysInMonths[1] = 29
//                leapYearCounter = 4
//            } else {
//                daysInMonths[1] = 28
//            }
            if year%4 == 0 {
                daysInMonths[1] = 29
            } else {
                daysInMonths[1] = 28
            }
            getStartDateDayPosition()
            currentMonth = months[month]
            monthLabel.text = "\(currentMonth) " + "\(year)"
            calendarCollectionView.reloadData()
        default:
            direction = -1
            month -= 1
            getStartDateDayPosition()
            
            currentMonth = months[month]
            monthLabel.text = "\(currentMonth) " + "\(year)"
            calendarCollectionView.reloadData()
            
        }
        
    }
    
    @objc func didTapNext() {
        switch currentMonth {
        case "December":
            month = 0
            year += 1
            direction = 1
            
            if year%4 == 0 {
                daysInMonths[1] = 29
            } else {
                daysInMonths[1] = 28
            }
            
//            if leapYearCounter < 5 {
//                leapYearCounter += 1
//            }
//            if leapYearCounter == 4 {
//                daysInMonths[1] = 29
//            }
//            if leapYearCounter == 5 {
//                leapYearCounter = 1
//                daysInMonths[1] = 28
//            }
            getStartDateDayPosition()
            currentMonth = months[month]
            monthLabel.text = "\(currentMonth) " + "\(year)"
            calendarCollectionView.reloadData()
        default:
            direction = 1
            getStartDateDayPosition()
            month += 1
            currentMonth = months[month]
            monthLabel.text = "\(currentMonth) " + "\(year)"
            calendarCollectionView.reloadData()
        }
        
    }
    
    func getStartDateDayPosition() {
        switch direction {
        case 0:
            numberOfEmptyBox = weekday
            dayCounter = day
            while dayCounter > 0 {
                numberOfEmptyBox = numberOfEmptyBox - 1
                dayCounter = dayCounter - 1
                if numberOfEmptyBox == 0 {
                    numberOfEmptyBox = 7
                }
            }
            if numberOfEmptyBox == 7 {
                numberOfEmptyBox = 0
            }
            
            positionIndex = numberOfEmptyBox
        case 1...:
            nextNumberOfEmptyBoxes = (positionIndex + daysInMonths[month])%7
            positionIndex = nextNumberOfEmptyBoxes
        case -1:
            previousNumberOfEmptyBoxes = (7 - (daysInMonths[month] - positionIndex)%7)
            if previousNumberOfEmptyBoxes == 7 {
                  previousNumberOfEmptyBoxes = 0
            }
            positionIndex = previousNumberOfEmptyBoxes
        default:
            fatalError()
        }
    }
    
    func updateWeekView() {
        
    }
    
    func updateData() {
        
    }

    
    override init() {
        super.init()
        calendarCollectionView.delegate = self
        calendarCollectionView.dataSource = self
        calendarCollectionView.register(SlideCalendarCollectionViewCell.self, forCellWithReuseIdentifier: "SlideCalendarCell")
        currentMonth = months[month]
        monthLabel.text = "\(currentMonth) " + "\(year)"
        if year%4 == 0 {
            daysInMonths[1] = 29
        } else {
            daysInMonths[1] = 28
        }
        if weekday == 0 {
            weekday = 7
        }
        getStartDateDayPosition()
        
        for i in 0..<7 {
            let dayLabel = UILabel()
            dayLabel.text = daysOfMonth[i]
            dayLabel.textAlignment = .center
            dayLabel.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0)
            weekdayStackView.addArrangedSubview(dayLabel)
        }
 
    }

    
    
    
    
    
    
}

extension CalendarLauncher: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch direction {
        case 0:
            return daysInMonths[month] + numberOfEmptyBox
        case 1...:
            return daysInMonths[month] + nextNumberOfEmptyBoxes
        case -1:
            return daysInMonths[month] + previousNumberOfEmptyBoxes
        default:
            fatalError()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = calendarCollectionView.dequeueReusableCell(withReuseIdentifier: "SlideCalendarCell", for: indexPath) as! SlideCalendarCollectionViewCell
        
        if cell.isHidden {
            cell.isHidden = false
        }
        
        switch direction {
        case 0:
            cell.dayNumberLabel.text = "\(indexPath.row + 1 - numberOfEmptyBox)"
        case 1:
            cell.dayNumberLabel.text = "\(indexPath.row + 1 - nextNumberOfEmptyBoxes)"
        case -1:
            cell.dayNumberLabel.text = "\(indexPath.row + 1 - previousNumberOfEmptyBoxes)"
        default:
            fatalError()
        }
       
        if Int(cell.dayNumberLabel.text!)! < 1 {
            cell.isHidden = true
            
        }
        
//        Current date in red
        if currentMonth == months[calendar.component(.month, from: date) - 1] && year == calendar.component(.year, from: date) && indexPath.row + 1 - numberOfEmptyBox == day {
            cell.backgroundColor = .red
            
        }
        
      
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var selectedDay = Int()
        switch direction {
        case 0:
            selectedDay = indexPath.row + 1 - numberOfEmptyBox - 1
        case 1:
            selectedDay = indexPath.row + 1 - nextNumberOfEmptyBoxes - 1
        case -1:
            selectedDay = indexPath.row + 1 - previousNumberOfEmptyBoxes - 1
        default:
            fatalError()
        }
        calendarUpdateDelegate.updateSelectedWeek(day: selectedDay, month: month+1, year: year)
        weekNumberUpdateDelegate.updateWeekNumber(day: selectedDay, month: month+1, year: year)
        monthLabelUpdateDelegate.updateSelectedMonth(month: monthLabel.text!)
        print("potential day \(selectedDay)")
        print("potential month \(month+1)")
        print("potential year \(year)")
        
        
        updateWeekView()
        updateData()
        
    }
    
    

}

extension CalendarLauncher: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: calendarCollectionView.frame.width/7, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
