//
//  Binding+Utils.swift
//  SwiftUI-MVVM-C
//
//  Created by Giovani Bettoni on 25/09/24.
//

import SwiftUI

extension Binding {
    func map<MappedValue>(
        valueToMappedValue: @escaping (Value) -> MappedValue,
        mappedValueToValue: @escaping (MappedValue) -> Value
    ) -> Binding<MappedValue> {
        Binding<MappedValue>.init { () -> MappedValue in
            return valueToMappedValue(wrappedValue)
        } set: { mappedValue in
            wrappedValue = mappedValueToValue(mappedValue)
        }
    }
    
    func onSet(_ action: @escaping (Value) -> Void) -> Binding<Value> {
        return Binding { () -> Value in
            return wrappedValue
        } set: { value in
            action(value)
            wrappedValue = value
        }
    }
}

func ??<T>(binding: Binding<T?>, fallback: T) -> Binding<T> {
    return Binding(get: {
        binding.wrappedValue ?? fallback
    }, set: {
        binding.wrappedValue = $0
    })
}
