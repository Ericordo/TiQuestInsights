//
//  CalendarCollectionView.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 20/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

//import UIKit
//
//class CalendarCollectionView: UICollectionView {
//    
//    let dates = Dates()
//
//    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
//        super.init(frame: frame, collectionViewLayout: layout)
//        self.dataSource = self
//        self.delegate = self
//        self.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: "CalendarCell")
//        setUpCollectionView()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setUpCollectionView()
//    }
//    
//    func setUpCollectionView() {
//        self.backgroundColor = .white
//        self.showsHorizontalScrollIndicator = false
//        
//        self.decelerationRate = .fast
//        
//        
//        //        TODO: Delete line: 
//        self.backgroundColor = .red
//    }
//    
//    func showCalendarCollectionView() {
//        if let view = UIApplication.shared.keyWindow {
//            let layout = CalendarCollectionViewFlowLayout()
//            let calendarCollectionView = CalendarCollectionView(frame: CGRect(x: 0, y: 20, width: 100, height: 100), collectionViewLayout: layout)
//            view.addSubview(calendarCollectionView)
//        }
//    }
//    
//    
//    
//    
//    
//    /*
//    // Only override draw() if you perform custom drawing.
//    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//        // Drawing code
//    }
//    */
//
//}
//
//extension CalendarCollectionView : UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return dates.dates.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = self.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCollectionViewCell
//        cell.dateLabel.text = dates.dates[indexPath.item]
//        print("hi")
//        return cell
//    }
//    
//    
//}
//
//extension CalendarCollectionView : UICollectionViewDelegateFlowLayout {
//    
//}
