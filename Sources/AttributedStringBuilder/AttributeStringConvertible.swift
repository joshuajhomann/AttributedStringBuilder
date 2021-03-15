//
//  AttributedStringConvertible.swift
//  
//
//  Created by Joshua Homann on 3/14/21.
//

import UIKit

public protocol AttributedStringConvertible {
  func makeAttributedString() -> NSAttributedString
}

extension String: AttributedStringConvertible {
  public func makeAttributedString() -> NSAttributedString {
    NSAttributedString(string: self)
  }
}

extension UIImage: AttributedStringConvertible {
  public func makeAttributedString() -> NSAttributedString {
    let attachment = NSTextAttachment()
    attachment.image = self
    return NSAttributedString(attachment: attachment)
  }
}

extension Optional: AttributedStringConvertible where Wrapped == UIImage {
  public func makeAttributedString() -> NSAttributedString {
    self.map { image in
      let attachment = NSTextAttachment()
      attachment.image = image
      return NSAttributedString(attachment: attachment)
    } ?? NSAttributedString(string: "")
  }
}

public struct LineBreak: AttributedStringConvertible {
  public init() { }
  public func makeAttributedString() -> NSAttributedString {
    .init(string: "\n")
  }
}

public struct Space: AttributedStringConvertible {
  public init() { }
  public func makeAttributedString() -> NSAttributedString {
    .init(string: " ")
  }
}
