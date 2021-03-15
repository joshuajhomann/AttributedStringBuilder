//
//  Reference.swift
//  
//
//  Created by Joshua Homann on 3/14/21.
//

import Foundation

@propertyWrapper struct Reference<Wrapped> {
  final class Wrapper<Wrapped> {
    var value: Wrapped
    init(value: Wrapped) {
      self.value = value
    }
  }
  private var wrapped: Wrapper<Wrapped>
  var wrappedValue: Wrapped {
    get { wrapped.value }
    nonmutating set { wrapped.value = newValue}
  }
  init(wrappedValue: Wrapped) {
    self.wrapped = .init(value: wrappedValue)
  }
}
