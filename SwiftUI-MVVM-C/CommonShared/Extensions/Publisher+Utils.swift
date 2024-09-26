//
//  Publisher+Utils.swift
//  SwiftUI-MVVM-C
//
//  Created by Giovani Bettoni on 25/09/24.
//

import Combine

extension Publisher {
    func optionalize() -> Publishers.Map<Self, Self.Output?> {
        map({ Optional.some($0) })
    }
}
