//
//  Calendar.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 21/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import Foundation
import UIKit
import Charts

protocol DataUpdateDelegate {
    func updateChartBar()
}


class Calendar: NSObject {
    
    var dataUpdateDelegate : DataUpdateDelegate!
   
    
    let dates = Dates().dates
    let datesbis = DatesBis().dates
    let calendarHeight : CGFloat = 50
    let cellWidth : CGFloat = 150
    
    let calendarCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.decelerationRate = .fast
        cv.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0)
        return cv
    }()
    
    
    
    func showCalendar() {
        if let view = UIApplication.shared.keyWindow {
            view.addSubview(calendarCollectionView)
            calendarCollectionView.frame = CGRect(x: 100, y: 71, width: view.frame.width-100, height: calendarHeight)

            print(view.frame.width)

        }
    }
    
    override init() {
        super.init()
        
        calendarCollectionView.delegate = self
        calendarCollectionView.dataSource = self
        
        calendarCollectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: "CalendarCell")
       
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func circleAroundDigit(_ num:Int, circleColor:UIColor,
                           digitColor:UIColor, diameter:CGFloat,
                           font:UIFont) -> UIImage {
        precondition((0...31).contains(num), "digit is not a digit")
        let p = NSMutableParagraphStyle()
        p.alignment = .center
        let s = NSAttributedString(string: String(num), attributes:
            [.font:font, .foregroundColor:digitColor, .paragraphStyle:p])
        let r = UIGraphicsImageRenderer(size: CGSize(width:diameter, height:diameter))
        return r.image {con in
            circleColor.setFill()
            con.cgContext.fillEllipse(in:
                CGRect(x: 0, y: 0, width: diameter, height: diameter))
            s.draw(in: CGRect(x: 0, y: diameter / 2 - font.lineHeight / 2,
                              width: diameter, height: diameter))
        }
    }
    
    
}

extension Calendar: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

//        return dates.count
        return datesbis.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = calendarCollectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCollectionViewCell
//        cell.dateLabel.text = dates[indexPath.item]
//        cell.dateLabel.text = datesbis[indexPath.item].day + " " + String(datesbis[indexPath.item].number)
        let stringForCell = NSAttributedString(string: datesbis[indexPath.item].day + " " + String(datesbis[indexPath.item].number))
        cell.dateLabel.attributedText = stringForCell

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = calendarCollectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCollectionViewCell
        let selectionImage = circleAroundDigit(datesbis[indexPath.item].number, circleColor: .blue,
                                   digitColor: .white, diameter: 30, font:UIFont(name: "GillSans", size: 20)!)
        let selectedString = NSMutableAttributedString(string: datesbis[indexPath.item].day)
        let selectedStringAttachment = NSTextAttachment()
        selectedStringAttachment.image = selectionImage
        let selectedImageString = NSAttributedString(attachment: selectedStringAttachment)
        selectedString.append(selectedImageString)
        cell.dateLabel.attributedText = selectedString
        cell.dateLabel.backgroundColor = .red
        cell.backgroundColor = .blue

       
        dataUpdateDelegate.updateChartBar()
 
    }
    

    
    
}

extension Calendar : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: calendarHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }
}
