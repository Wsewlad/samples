//
//  Array+GlobalRouting.swift
//  Samples
//
//  Created by  Vladyslav Fil on 18.02.2023.
//

import Foundation

extension Array where Element == GlobalRouting {
    mutating func forward(to element: Element) {
        self.append(element)
    }
    
    mutating func forward(to elements: Element...) {
        self.append(contentsOf: elements)
    }
    
    @discardableResult
    mutating func back(toFirst element: Element) -> Bool {
        if let elementIndex = self.firstIndex(of: element) {
            self.removeLast(count - (elementIndex + 1))
            return true
        } else {
            return false
        }
    }
    
    @discardableResult
    mutating func back(toLast element: Element) -> Bool {
        if let elementIndex = self.lastIndex(of: element) {
            self.removeLast(count - (elementIndex + 1))
            return true
        } else {
            return false
        }
    }
    
    mutating func backToRoot() {
        self.removeLast(count)
    }
    
    mutating func back() {
        self.removeLast()
    }
}
