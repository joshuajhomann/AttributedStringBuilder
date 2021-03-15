//
//  AttributedTextStyle.swift
//  
//
//  Created by Joshua Homann on 3/14/21.
//

import UIKit

public struct AttributedTextStyle {
  public var backgroundColor: UIColor?
  public var baselineOffset: Double?
  public var expansion: Double?
  public var font: UIFont?
  public var foregroundColor: UIColor?
  public var kern: Double?
  public var ligature: Bool?
  public var link: URL?
  public var obliqueness: Double?
  public var paragraphStyle: ParagraphStyle?
  public var shadow: NSShadow?
  public var strikethroughColor: UIColor?
  public var strikethroughStyle: NSUnderlineStyle?
  public var strokeColor: UIColor?
  public var strokeWidth: Double?
  public var textEffect: NSAttributedString.TextEffectStyle?
  public var underlineColor: UIColor?
  public var underlineStyle: NSUnderlineStyle?
  public init(
    backgroundColor: UIColor? = nil,
    baselineOffset: Double? = nil,
    expansion: Double? = nil,
    font: UIFont? = nil,
    foregroundColor: UIColor? = nil,
    kern: Double? = nil,
    ligature: Bool? = nil,
    link: URL? = nil,
    obliqueness: Double? = nil,
    paragraphStye: ParagraphStyle? = nil,
    shadow: NSShadow? = nil,
    strikethroughColor: UIColor? = nil,
    strikethroughStyle: NSUnderlineStyle? = nil,
    strokeColor: UIColor? = nil,
    strokeWidth: Double? = nil,
    textEffect: NSAttributedString.TextEffectStyle? = nil,
    underlineColor: UIColor? = nil,
    underlineStyle: NSUnderlineStyle? = nil
  ) {
    self.backgroundColor = backgroundColor
    self.baselineOffset = baselineOffset
    self.expansion = expansion
    self.font = font
    self.foregroundColor = foregroundColor
    self.kern = kern
    self.ligature = ligature
    self.link = link
    self.obliqueness = obliqueness
    self.paragraphStyle = paragraphStye
    self.shadow = shadow
    self.strikethroughColor = strikethroughColor
    self.strikethroughStyle = strikethroughStyle
    self.strokeColor = strokeColor
    self.strokeWidth = strokeWidth
    self.textEffect = textEffect
    self.underlineColor = underlineColor
    self.underlineStyle = underlineStyle
  }
  public mutating func apply(_ style: Self) {
    style.backgroundColor.map { self.backgroundColor = $0 }
    style.baselineOffset.map { self.baselineOffset = $0 }
    style.expansion.map { self.expansion = $0 }
    style.font.map { self.font = $0 }
    style.foregroundColor.map { self.foregroundColor = $0 }
    style.kern.map { self.kern = $0 }
    style.ligature.map { self.ligature = $0 }
    style.link.map { self.link = $0 }
    style.obliqueness.map { self.obliqueness = $0 }
    style.paragraphStyle.map { self.paragraphStyle = $0 }
    style.shadow.map { self.shadow = $0 }
    style.strikethroughColor.map { self.strikethroughColor = $0 }
    style.strikethroughStyle.map { self.strikethroughStyle = $0 }
    style.strokeColor.map { self.strokeColor = $0 }
    style.strokeWidth.map { self.strokeWidth = $0 }
    style.textEffect.map { self.textEffect = $0 }
    style.underlineColor.map { self.underlineColor = $0 }
    style.underlineStyle.map { self.underlineStyle = $0 }
  }
  public func makeAttributes() -> [NSAttributedString.Key: Any] {
    var attributes: [NSAttributedString.Key: Any] = [:]
    backgroundColor.map { attributes[.backgroundColor] = $0 }
    baselineOffset.map { attributes[.baselineOffset] = $0 }
    expansion.map { attributes[.expansion] = $0 }
    font.map { attributes[.font] = $0 }
    foregroundColor.map { attributes[.foregroundColor] = $0 }
    kern.map { attributes[.kern] = $0 }
    ligature.map { attributes[.ligature] = NSNumber(value: $0 ? 1 : 0) }
    link.map { attributes[.link] = $0 }
    obliqueness.map { attributes[.obliqueness] = $0 }
    paragraphStyle.map { attributes[.paragraphStyle] = $0.makeNSParagraphStyle }
    shadow.map { attributes[.shadow] = $0 }
    strikethroughColor.map { attributes[.strikethroughColor] = $0 }
    strikethroughStyle.map { attributes[.strikethroughStyle] = NSNumber(value: $0.rawValue) }
    strokeColor.map { attributes[.strokeColor] = $0 }
    strokeWidth.map { attributes[.strokeWidth] = $0 }
    textEffect.map { attributes[.textEffect] = $0.rawValue }
    underlineColor.map { attributes[.underlineColor] = $0 }
    underlineStyle.map { attributes[.underlineStyle] = NSNumber(value: $0.rawValue) }
    return attributes
  }
}
