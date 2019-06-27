//
//  CalendarCollectionViewCell.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 20/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCell()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override var isSelected: Bool {
        didSet {
            self.backgroundColor = isSelected ? UIColor(red: 51/255, green: 153/255, blue: 255/255, alpha: 1.0) : UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0)
            self.dateLabel.textColor = isSelected ? .white : .black
        }
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
    
//        override var isSelected: Bool {
//            didSet {
//                
//                let selectionImage = circleAroundDigit(30, circleColor: .blue,
//                                                       digitColor: .white, diameter: 25, font:UIFont.boldSystemFont(ofSize: 17))
//
//                let selectedString = NSMutableAttributedString(string: "Monday  ")
//                let selectedStringAttachment = NSTextAttachment()
//                selectedStringAttachment.image = selectionImage
//                let selectedImageString = NSAttributedString(attachment: selectedStringAttachment)
//                selectedString.append(selectedImageString)
//                self.dateLabel.attributedText = selectedString
//            }
//        }
    
    
 let dateLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textAlignment = .center

    
    
        return label
        }()
    
    
    func setUpCell() {
        
//        let lineSeparator = CALayer()
//        lineSeparator.frame = CGRect(x: self.frame.width, y: 0, width: 0.5, height: self.frame.height)
//        lineSeparator.backgroundColor = UIColor.lightGray.cgColor
//        layer.addSublayer(lineSeparator)
        self.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0)
        self.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        dateLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        
        let bottomLineSeparator = CALayer()
        bottomLineSeparator.frame = CGRect(x: 0, y: self.frame.height-0.5, width: self.frame.width, height: 0.5)
        bottomLineSeparator.backgroundColor = UIColor.lightGray.cgColor
        layer.addSublayer(bottomLineSeparator)
        
    }
    

}
