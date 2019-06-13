//
//  DetailedHourCollectionView.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 27/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import Foundation
import UIKit

class DetailedHourView: NSObject {
    override init() {
        super.init()
        detailedHourCollectionView.delegate = self
        detailedHourCollectionView.dataSource = self
        detailedHourCollectionView.register(DetailedHourCollectionViewCell.self, forCellWithReuseIdentifier: "DetailCell")
    }
    
    let detailedViewHeight : CGFloat = 60
    var cellWidth : CGFloat = 100
    

    

    
    func showDetailedHourView() {
            if let view = UIApplication.shared.keyWindow {
                cellWidth = view.frame.width/6
                view.addSubview(detailedHourCollectionView)
                detailedHourCollectionView.frame = CGRect(x: 0, y: 371 + detailedViewHeight, width: view.frame.width, height: detailedViewHeight)
                
                
        }
    }
    
    let detailedHourCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.estimatedItemSize = CGSize(width: 100, height: 60)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0)
        cv.isScrollEnabled = false
        cv.sizeThatFits(layout.estimatedItemSize)
        
        

        
        return cv
    }()
    
    func makeDoubleLabelText(upString: String, downString: String) -> NSMutableAttributedString {
        let attr = NSMutableAttributedString(string: "")
        attr.append(NSAttributedString(string: upString, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.lightGray.cgColor]))
        attr.append(NSAttributedString(string: downString, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.black.cgColor]))
        return attr
    }

    
    
    
}

extension DetailedHourView : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = detailedHourCollectionView.dequeueReusableCell(withReuseIdentifier: "DetailCell", for: indexPath) as! DetailedHourCollectionViewCell
        cell.clipsToBounds = true
        cell.infoLabel.adjustsFontSizeToFitWidth = true

        cell.infoLabel.sizeToFit()
        cell.autoresizesSubviews = true
//        cell.sizeThatFits(CGSize(width: cellWidth, height: detailedViewHeight))
   

        switch indexPath.item {
        case 0:
            cell.infoLabel.attributedText = makeDoubleLabelText(upString: "Time\n", downString: "20:00")
            print(cell.infoLabel.frame.width)
        case 1:
            cell.infoLabel.attributedText = makeDoubleLabelText(upString: "Sales\n", downString: "432,55€")
        case 2:
            cell.infoLabel.attributedText = makeDoubleLabelText(upString: "Top Seller\n", downString: "Pineapple pizza bLABLA")
        case 3:
            cell.infoLabel.attributedText = makeDoubleLabelText(upString: "Worst Seller\n", downString: "Snails")
        case 4:
            cell.infoLabel.attributedText = makeDoubleLabelText(upString: "Total receipts\n", downString: "87")
        case 5:
            cell.infoLabel.attributedText = makeDoubleLabelText(upString: "Average ticket\n", downString: "32,20€")
        default:
            break
        }
        return cell
        
    }
    
    
}

extension DetailedHourView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: cellWidth, height: detailedViewHeight)
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
