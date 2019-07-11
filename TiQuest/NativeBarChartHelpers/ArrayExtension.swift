//
//  ArrayExtension.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 10/07/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import Foundation

extension Array {
    func safeValue(at index: Int) -> Element? {
        if index < self.count {
            return self[index]
        } else {
            return nil
        }
    }
}
