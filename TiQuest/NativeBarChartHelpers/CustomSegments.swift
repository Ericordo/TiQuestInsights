//
//  CustomSegments.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 10/07/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import Foundation
import CoreGraphics.CGGeometry

struct CurvedSegment {
    let startPoint: CGPoint
    let endPoint: CGPoint
    let toPoint: CGPoint
    let controlPoint1: CGPoint
    let controlPoint2: CGPoint
}

struct LineSegment {
    let startPoint: CGPoint
    let endPoint: CGPoint
}
