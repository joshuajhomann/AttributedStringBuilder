//
//  AttributedText.swift
//  
//
//  Created by Joshua Homann on 3/14/21.
//

import UIKit

public struct AttributedText: AttributedStringConvertible {
  @Reference private var style = AttributedTextStyle()
  private let make: (AttributedTextStyle) -> NSAttributedString
  public init(_ text: String) {
    make = { style in
      NSAttributedString(string: text, attributes: style.makeAttributes())
    }
  }
  public init(@AttributedStringBuilder content: @escaping () -> NSAttributedString ) {
    make = { style in
      let content = content()
      let attributeString = NSMutableAttributedString(attributedString: content)
      attributeString.addAttributes(style.makeAttributes(), range: .init(location: 0, length: content.length))
      return attributeString
    }
  }

  public func makeAttributedString() -> NSAttributedString {
    make(style)
  }
  public func apply(_ style: AttributedTextStyle) -> Self {
    self.style.apply(style)
    return self
  }
  public func backgroundColor(_ value: UIColor) -> Self {
    style.backgroundColor = value
    return self
  }
  public func baselineOffset(_ value: Double) -> Self {
    style.baselineOffset = value
    return self
  }
  public func expansion(_ value: Double) -> Self {
    style.expansion = value
    return self
  }
  public func font(_ value: UIFont) -> Self {
    style.font = value
    return self
  }
  public func foregroundColor(_ value: UIColor) -> Self {
    style.foregroundColor = value
    return self
  }
  public func kern(_ value: Double) -> Self {
    style.kern = value
    return self
  }
  public func ligature(_ value: Bool) -> Self {
    style.ligature = value
    return self
  }
  public func link(_ value: URL) -> Self {
    style.link = value
    return self
  }
  public func obliqueness(_ value: Double) -> Self {
    style.obliqueness = value
    return self
  }
  public func paragraphStye(_ value: ParagraphStyle) {
    style.paragraphStyle = value
  }
  public func shadow(_ value: NSShadow) -> Self {
    style.shadow = value
    return self
  }
  public func strikethroughColor(_ value: UIColor) -> Self {
    style.strikethroughColor = value
    return self
  }
  public func strikethroughStyle(_ value: NSUnderlineStyle) -> Self {
    style.strikethroughStyle = value
    return self
  }
  public func strokeColor(_ value: UIColor) -> Self {
    style.strokeColor = value
    return self
  }
  public func strokeWidth(_ value: Double) -> Self {
    style.strokeWidth = value
    return self
  }
  public func textEffect(_ value: NSAttributedString.TextEffectStyle) -> Self {
    style.textEffect = value
    return self
  }
  public func underlineColor(_ value: UIColor) -> Self {
    style.underlineColor = value
    return self
  }
  public func underlineStyle(_ value: NSUnderlineStyle) -> Self {
    style.underlineStyle = value
    return self
  }
}
