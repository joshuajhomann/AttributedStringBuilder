//
//  ParagraphStyle.swift
//  
//
//  Created by Joshua Homann on 3/14/21.
//

import UIKit

public struct ParagraphStyle {
  public var alignment: NSTextAlignment?
  public var firstLineHeadIndent: CGFloat?
  public var headIndent: CGFloat?
  public var tailIndent: CGFloat?
  public var lineHeightMultiple: CGFloat?
  public var maximumLineHeight: CGFloat?
  public var minimumLineHeight: CGFloat?
  public var lineSpacing: CGFloat?
  public var paragraphSpacing: CGFloat?
  public var paragraphSpacingBefore: CGFloat?
  public init(
    alignment: NSTextAlignment? = nil,
    firstLineHeadIndent: CGFloat? = nil,
    headIndent: CGFloat? = nil,
    tailIndent: CGFloat? = nil,
    lineHeightMultiple: CGFloat? = nil,
    maximumLineHeight: CGFloat? = nil,
    minimumLineHeight: CGFloat? = nil,
    lineSpacing: CGFloat? = nil,
    paragraphSpacing: CGFloat? = nil,
    paragraphSpacingBefore: CGFloat? = nil
  ) {
    self.alignment = alignment
    self.firstLineHeadIndent = firstLineHeadIndent
    self.headIndent = headIndent
    self.tailIndent = tailIndent
    self.lineHeightMultiple = lineHeightMultiple
    self.maximumLineHeight = maximumLineHeight
    self.minimumLineHeight = minimumLineHeight
    self.lineSpacing = lineSpacing
    self.paragraphSpacing = paragraphSpacingBefore
    self.paragraphSpacingBefore = paragraphSpacingBefore
  }
  public func makeNSParagraphStyle() -> NSParagraphStyle {
    let style = NSMutableParagraphStyle()
    alignment.map { style.alignment = $0 }
    firstLineHeadIndent.map { style.firstLineHeadIndent = $0 }
    headIndent.map { style.headIndent = $0 }
    tailIndent.map { style.tailIndent = $0 }
    lineHeightMultiple.map { style.lineHeightMultiple = $0 }
    maximumLineHeight.map { style.maximumLineHeight = $0 }
    minimumLineHeight.map { style.minimumLineHeight = $0 }
    lineSpacing.map { style.lineSpacing = $0 }
    paragraphSpacing.map { style.paragraphSpacing = $0 }
    paragraphSpacingBefore.map { style.paragraphSpacingBefore = $0 }
    return style
  }
}
