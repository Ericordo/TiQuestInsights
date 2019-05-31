//
//  TodaySalesView.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 20/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit
import Macaw

struct Sales {
    var hour: String
    var sales: Double
}

struct dailySales {
    var day: String
    var totalSales: [Sales]
}



class TodaySales: MacawView {
    
    
    
    static let salesOfOneDay = [Sales(hour: "11 AM", sales: 453),
                                Sales(hour: "12 AM", sales: 792),
                                Sales(hour: "1 PM", sales: 928),
                                Sales(hour: "2 PM", sales: 832),
                                Sales(hour: "3 PM", sales: 537),
                                Sales(hour: "4 PM", sales: 356),
                                Sales(hour: "5 PM", sales: 328),
                                Sales(hour: "6 PM", sales: 423),
                                Sales(hour: "7 PM", sales: 892),
                                Sales(hour: "8 PM", sales: 958),
                                Sales(hour: "9 PM", sales: 728)]
    
   
    
//    Make a dictionary, the key being a String with the day and the value being an array of Sales
    
    //    MARK: Max Value for the Y axis, make it dynamic with calculations
    static let maxValue = 1000
    static let maxValueLineHeight = 400
    //   MARK: Width of the graph:
    static let lineWidth : Double = 2700
    
    static let dataDivisor = Double(maxValue/maxValueLineHeight)
    static let adjustedData: [Double] = salesOfOneDay.map({
        $0.sales / dataDivisor
    })
    static var animations: [Animation] = []
    
    static var bars = Group()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.node = TodaySales.createChart()
        self.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(node: TodaySales.createChart(), coder: aDecoder)
        
    }
    
    private static func createChart() -> Group {
        var items: [Node] = addYAxisItem() + addXAxisItem()
        items.append(createBars())
        return Group(contents: items, place: .identity)
    }
    
    
    
    private static func addYAxisItem() -> [Node] {
        let maxLines = 10
        let lineInterval = Int(maxValue/maxLines)
        let yAxisHeight: Double = 400
        let lineSpacing: Double = 60
        
        var newNodes: [Node] = []
        
        for i in 1...maxLines {
            let y = yAxisHeight - (Double(i) * lineSpacing)
            
            let valueLine = Line(x1: -5, y1: y, x2: lineWidth, y2: y).stroke(fill: Color.black.with(a: 0.1))
            let valueText = Text(text: "\(i * lineInterval)", font: .init(name: "Helvetica", size: 30), align: .max, baseline: .mid, place: .move(dx: -20, dy: y))
            valueText.fill = Color.black
            newNodes.append(valueLine)
            newNodes.append(valueText)
        }
        
        let yAxis = Line(x1: 0, y1: 0, x2: 0, y2: yAxisHeight).stroke(fill: Color.black.with(a: 0.25))
        newNodes.append(yAxis)
        return newNodes
    }
    
    private static func addXAxisItem() -> [Node] {
        let chartBaseY : Double = 400
        var newNodes : [Node] = []
        
        for i in 1...adjustedData.count {
//            With start with 1 and not 0 cause we do not want the first bar to touch the Y Axis
//            The value multiplied by Double(i) is the spacing between x values
            let x = (Double(i) * 200)
            let valueText = Text(text: salesOfOneDay[i-1].hour, font: .init(name: "Helvetica", size: 30), align: .max, baseline: .mid, place: .move(dx: x + 20, dy: chartBaseY + 30))

            valueText.fill = Color.black
            newNodes.append(valueText)
        }
        
        let xAxis = Line(x1: 0, y1: chartBaseY, x2: lineWidth, y2: chartBaseY).stroke(fill: Color.black.with(a: 0.25))
        newNodes.append(xAxis)
        return newNodes
    }
    
    private static func createBars() -> Group {
        
        let fill = LinearGradient(degree: 90, from: Color(val: 0x5Aa33e1), to: Color(val: 0x5Aa33e1).with(a: 0.33))
        let items = adjustedData.map { _ in Group() }
        
        animations = items.enumerated().map { (i: Int, item: Group) in
            
            item.contentsVar.animation(delay: Double(i) * 0.1) { t in
                let height = adjustedData[i] * t
                let rect = Rect(x: Double(i) * 200 + 135, y: 400 - height, w: 100, h: height)
                return [rect.fill(with: fill)]
            }
            
        }
       
        bars = items.group()
        
        return items.group()
    }
    
    
    
    
    
     static func playAnimations() {
        animations.combine().play()
        bars.contents.forEach( { node in
            node.onTap(f: { action in TodaySales.didTapBar() })
        })
        
    }
    
    
    
    static func didTapBar() {
        print("hello")
        bars.contents[0].opacity = 0.0
    }
    

    

    
    
}
