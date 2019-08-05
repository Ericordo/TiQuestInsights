//
//  DetailedHourCollectionView.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 27/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import Foundation
import UIKit

struct DetailedData {
    var time : Int?
    var formattedTime : String
    var sales : String
    var topSeller : String
    var worstSeller : String
    var totalReceipts : String
    var averageTicket : String
}

protocol TopSellersUpdateDelegate {
    func updateTopSellers(products: [BusinessProductInfo])
}

let dataTuesday11 = DetailedData(time: 11, formattedTime: "11:00", sales: "599,23€", topSeller: "Caesar Salad", worstSeller: "Fondue", totalReceipts: "49", averageTicket: "45,23€")
let dataTuesday12 = DetailedData(time: 12, formattedTime: "12:00", sales: "428,23€", topSeller: "Brocoli", worstSeller: "Burger", totalReceipts: "19", averageTicket: "32,23€")
let dataTuesdayAll = DetailedData(time: nil, formattedTime: "All Day", sales: "4234,56€", topSeller: "Banana Split", worstSeller: "Cordon bleu", totalReceipts: "234", averageTicket: "32,45€")

let detailedData : [ Int : DetailedData] = [ 11 : dataTuesday11, 12 : dataTuesday12, 24 : dataTuesdayAll]

class DetailedHourView: NSObject {
    override init() {
        super.init()
        detailedHourCollectionView.delegate = self
        detailedHourCollectionView.dataSource = self
        detailedHourCollectionView.register(DetailedHourCollectionViewCell.self, forCellWithReuseIdentifier: "DetailCell")
    }
    
    var topSellersUpdateDelegate : TopSellersUpdateDelegate!
    
    let detailedViewHeight : CGFloat = 60
    var cellWidth : CGFloat = 100
    
    let formattedTimes = ["00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00"]
    
//    var formattedTime = detailedData[24]?.formattedTime
//    var sales = detailedData[24]?.sales
//    var topSeller = detailedData[24]?.topSeller
//    var worstSeller = detailedData[24]?.worstSeller
//    var totalReceipts = detailedData[24]?.totalReceipts
//    var averageTicket = detailedData[24]?.averageTicket
    
    var formattedTime = ""
    var sales = ""
    var topSeller = ""
    var worstSeller = ""
    var totalReceipts = ""
    var averageTicket = ""
    
    var selectedDayData : [BusinessDataModel] = []

    

    
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
//        layout.estimatedItemSize = CGSize(width: 100, height: 60)
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0)
        if let view = UIApplication.shared.keyWindow {
            if view.frame.width > 500 {
                cv.isScrollEnabled = false
            }
        }
        
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
        cell.sizeThatFits(UICollectionViewFlowLayout.automaticSize)
//        cell.sizeThatFits(CGSize(width: cellWidth, height: detailedViewHeight))
   

        switch indexPath.item {
        case 0:
//            guard let formattedTime = formattedTime else {
//                cell.infoLabel.attributedText = makeDoubleLabelText(upString: "Time\n", downString: "")
//                return cell
//            }
            cell.infoLabel.attributedText = makeDoubleLabelText(upString: "Time\n", downString: formattedTime)
        case 1:
//            guard let sales = sales else {
//                cell.infoLabel.attributedText = makeDoubleLabelText(upString: "Sales\n", downString: "")
//                return cell
//            }
            cell.infoLabel.attributedText = makeDoubleLabelText(upString: "Sales\n", downString: sales)
        case 2:
//            guard let topSeller = topSeller else {
//                cell.infoLabel.attributedText = makeDoubleLabelText(upString: "Top Seller\n", downString: "")
//                return cell
//            }
            cell.infoLabel.attributedText = makeDoubleLabelText(upString: "Top Seller\n", downString: topSeller)
        case 3:
//            guard let worstSeller = worstSeller else {
//                cell.infoLabel.attributedText = makeDoubleLabelText(upString: "Worst Seller\n", downString: "")
//                return cell
//            }
            cell.infoLabel.attributedText = makeDoubleLabelText(upString: "Worst Seller\n", downString: worstSeller)
        case 4:
//            guard let totalReceipts = totalReceipts else {
//                cell.infoLabel.attributedText = makeDoubleLabelText(upString: "Total receipts\n", downString: "")
//                return cell
//            }
            cell.infoLabel.attributedText = makeDoubleLabelText(upString: "Total receipts\n", downString: totalReceipts)
        case 5:
//            guard let averageTicket = averageTicket else {
//                cell.infoLabel.attributedText = makeDoubleLabelText(upString: "Average ticket\n", downString: "")
//                return cell
//            }
            cell.infoLabel.attributedText = makeDoubleLabelText(upString: "Average ticket\n", downString: averageTicket)
        default:
            break
        }
        return cell
        
    }
    
    
}

extension DetailedHourView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if indexPath.row == 0 {
//            return CGSize(width: 100, height: detailedViewHeight)
//        } else {
//             return CGSize(width: cellWidth, height: detailedViewHeight)
//        }
        return CGSize(width: cellWidth, height: detailedViewHeight)


    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension DetailedHourView : DetailedViewUpdateDelegate {
    
    #warning("When several products are sold with the same quantity, what do we do? When one product is not sold at all, what do we do?")
   
    func updateDetailedView(key: Int, data: [BusinessDataModel]) {
        data.forEach { data in
            print(data.datetime)
            print(data.totalEarnings)
            
        }
    
        
        var detailedDataAllDay : DetailedData!
        var detailedData : [ Int : DetailedData] = [:]

        var topSellersDataAllDay : [BusinessProductInfo]!
        var topSellersData : [ Int : [BusinessProductInfo]] = [:]
        
        func prepareAllDayData() {
            var salesAllDay : Double = 0
            var receiptsAllDay : Double = 0
            var productsSold : [BusinessProductInfo] = []
            
            data.forEach { data in
                salesAllDay += data.totalEarnings
                receiptsAllDay += data.totalOrders
                productsSold += data.soldProducts
            }
            
            
//            We remove Coperto
            productsSold = productsSold.filter({$0.product?.title != "Coperto" })
            productsSold = productsSold.filter({$0.product?.title != "COPERTO" })
            
            productsSold.forEach { product in
                print(product.product?.title)
    
            }
//            We sort by product name
            productsSold = productsSold.sorted(by: { $0.product!.title! < $1.product!.title! })
//            We need to find out the duplicated to keep only one product but with the sum of the quantities
//            We create a new array, then for each product in the original array, if the product is not in the new array, we append it, if it is already in the new array, we find the index of the product in the new array to add the counter of the product in the original array to the product in the new array
            var productsSoldSorted : [BusinessProductInfo] = []
            productsSold.forEach { product in
                if !productsSoldSorted.contains(where: {$0.product?.title! == product.product?.title!}) {
                    productsSoldSorted.append(product)
                } else if productsSoldSorted.contains(where: {$0.product?.title! == product.product?.title!}) {
                    if let index = productsSoldSorted.firstIndex(where: {$0.product?.title! == product.product?.title!}) {
                    productsSoldSorted[index].counter! += product.counter!
                    }
                }
            }
            productsSoldSorted = productsSoldSorted.sorted(by: { $0.counter! < $1.counter! })
            topSellersDataAllDay = productsSoldSorted
            
            var averageTicketAllDay : Double = 0
            if receiptsAllDay != 0 {
                averageTicketAllDay = salesAllDay / receiptsAllDay
            }
            
            
            let time : Int? = nil
            let formattedTime = "All Day"
            let sales = "\(Int(salesAllDay)) €"
            let topSeller = productsSoldSorted.last?.product?.title
            let worstSeller = productsSoldSorted.first?.product?.title
            let receipts = String(Int(receiptsAllDay))
            let average = "\(Int(averageTicketAllDay)) €"
            
            detailedDataAllDay = DetailedData(time: time, formattedTime: formattedTime, sales: sales, topSeller: topSeller ?? "", worstSeller: worstSeller ?? "", totalReceipts: receipts, averageTicket: average)
        }
        
        func prepareSpecificHourData() {
            
                var key = 0
            
            data.forEach { data in
                
                let formattedTime = formattedTimes[key]
                let sales = "\(Int(data.totalEarnings)) €"
                var productsSold = data.soldProducts.filter({$0.product?.title != "Coperto" })
                productsSold = data.soldProducts.filter({$0.product?.title != "COPERTO" })
                let productsSoldSorted = productsSold.sorted(by: { $0.counter! < $1.counter! })
                topSellersData[key] = productsSoldSorted
                
                let topSeller = productsSoldSorted.last?.product?.title
                let worstSeller = productsSoldSorted.first?.product?.title
                let receipts = String(Int(data.totalOrders))
                let average = "\(Int(data.averageOrderValue)) €"
                
                
                
                let detailedDataSpecificHour = DetailedData(time: key, formattedTime: formattedTime, sales: sales, topSeller: topSeller ?? "", worstSeller: worstSeller ?? "", totalReceipts: receipts, averageTicket: average)
                
                detailedData[key] = detailedDataSpecificHour
                
                key += 1
                
            }
            
            
            
        }
        
        switch key {
        case 24:
            prepareAllDayData()
            formattedTime = detailedDataAllDay.formattedTime
            sales = detailedDataAllDay.sales
            topSeller = detailedDataAllDay.topSeller.lowercased()
            worstSeller = detailedDataAllDay.worstSeller.lowercased()
            totalReceipts = detailedDataAllDay.totalReceipts
            averageTicket = detailedDataAllDay.averageTicket
            detailedHourCollectionView.reloadData()
            topSellersUpdateDelegate.updateTopSellers(products: topSellersDataAllDay)
            
        default:
            prepareSpecificHourData()
//            formattedTime = detailedDataSpecificHour.formattedTime
//            sales = detailedDataSpecificHour.sales
//            topSeller = detailedDataSpecificHour.topSeller
//            worstSeller = detailedDataSpecificHour.worstSeller
//            totalReceipts = detailedDataSpecificHour.totalReceipts
//            averageTicket = detailedDataSpecificHour.averageTicket
            formattedTime = detailedData[key]!.formattedTime
            sales = detailedData[key]!.sales
            topSeller = detailedData[key]!.topSeller.lowercased()
            worstSeller = detailedData[key]!.worstSeller.lowercased()
            totalReceipts = detailedData[key]!.totalReceipts
            averageTicket = detailedData[key]!.averageTicket
            detailedHourCollectionView.reloadData()
            topSellersUpdateDelegate.updateTopSellers(products: topSellersData[key]!)
        }
        
     
        
        
        
//        formattedTime = detailedData[key]?.formattedTime
//        sales = detailedData[key]?.sales
//        topSeller = detailedData[key]?.topSeller
//        worstSeller = detailedData[key]?.worstSeller
//        totalReceipts = detailedData[key]?.totalReceipts
//        averageTicket = detailedData[key]?.averageTicket
//        detailedHourCollectionView.reloadData()
    }
    
    
}
