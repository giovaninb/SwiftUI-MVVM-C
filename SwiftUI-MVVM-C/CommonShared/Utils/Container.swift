//
//  Container.swift
//  SwiftUI-MVVM-C
//
//  Created by Giovani Bettoni on 25/09/24.
//

import Foundation

struct Container<T: Codable>: Codable {
    
    private var values: [T] = []
    
    var value: T {
        get {
            values.first!
        }
        
        set {
            values = [newValue]
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        value = try container.decode(T.self)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
