//
//  Paragraph.swift
//  
//
//  Created by Joshua Homann on 3/14/21.
//

import UIKit

public struct Paragraph: AttributedStringConvertible {
  @Reference private var paragraphStyle = ParagraphStyle()
  private let content: () -> NSAttributedString
  private let appendLineBreak: Bool
  public init(appendLineBreak: Bool = true, @AttributedStringBuilder content: @escaping () -> NSAttributedString) {
    self.content = content
    self.appendLineBreak = appendLineBreak
  }
  public func makeAttributedString() -> NSAttributedString {
    let content = NSMutableAttributedString(attributedString: content())
    if appendLineBreak {
      content.append(.init(string: "\n"))
    }
    content.addAttributes([.paragraphStyle: paragraphStyle.makeNSParagraphStyle()], range: NSMakeRange(0, content.length))
    return content
  }
  public func alignment(_ value: NSTextAlignment) -> Self {
    paragraphStyle.alignment = value
    return self
  }
  public func firstLineHeadIndent(_ value: CGFloat) -> Self {
    paragraphStyle.firstLineHeadIndent = value
    return self
  }
  public func headIndent(_ value: CGFloat) -> Self {
    paragraphStyle.headIndent = value
    return self
  }
  public func tailIndent(_ value: CGFloat) -> Self {
    paragraphStyle.tailIndent = value
    return self
  }
  public func lineHeightMultiple(_ value: CGFloat) -> Self {
    paragraphStyle.lineHeightMultiple = value
    return self
  }
  public func maximumLineHeight(_ value: CGFloat) -> Self {
    paragraphStyle.maximumLineHeight = value
    return self
  }
  public func minimumLineHeight(_ value: CGFloat) -> Self {
    paragraphStyle.minimumLineHeight = value
    return self
  }
  public func lineSpacing(_ value: CGFloat) -> Self {
    paragraphStyle.lineSpacing = value
    return self
  }
  public func paragraphSpacing(_ value: CGFloat) -> Self {
    paragraphStyle.paragraphSpacing = value
    return self
  }
  public func paragraphSpacingBefore(_ value: CGFloat) -> Self {
    paragraphStyle.paragraphSpacingBefore = value
    return self
  }
}
