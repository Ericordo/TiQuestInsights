//
//  WeatherCollectionView.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 24/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import Foundation
import UIKit

class WeatherCollectionView : NSObject {
    override init() {
        super.init()
        weatherCollectionView.delegate = self
        weatherCollectionView.dataSource = self
        weatherCollectionView.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: "WeatherCell")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let weatherHeight : CGFloat = 50
    let cellWidth : CGFloat = 72
    let weatherCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0)
        cv.backgroundColor = .cyan
        cv.isScrollEnabled = false
        return cv
    }()
    
    
    
    
    func showWeather() {
        if let view = UIApplication.shared.keyWindow {
            view.addSubview(weatherCollectionView)
            weatherCollectionView.frame = CGRect(x: 84, y: 371, width: view.frame.width, height: weatherHeight)
            
        }
    }
    
}

extension WeatherCollectionView : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = weatherCollectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath)
        cell.backgroundColor = .red
        
        return cell
    }


}

extension WeatherCollectionView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let graph = TodaySalesChart()
        let blockWidth = CGFloat(944.0 / 11.0)
        print("blockWidth: \(blockWidth)")
        let barWidthInPx = 0.60 * blockWidth
        print(barWidthInPx)
//        let spaceWidthInPx = 0.40 * blockWidth
        return CGSize(width: barWidthInPx, height: weatherHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         let blockWidth = CGFloat(944.0 / 11.0)
        
        let barWidthInPx = 0.60 * blockWidth
        print(barWidthInPx)
        let spaceWidthInPx = 0.40 * blockWidth
        return spaceWidthInPx
//        return 15
    }
}
