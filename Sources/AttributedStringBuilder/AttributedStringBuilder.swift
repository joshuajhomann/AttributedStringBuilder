import UIKit

@resultBuilder
public struct AttributedStringBuilder {
  public typealias Expression = AttributedStringConvertible
  public typealias Component = NSAttributedString
  public static func buildBlock(_ components: Component...) -> Component {
    buildArray(components)
  }
  public static func buildExpression(_ expression: Expression) -> Component {
    expression.makeAttributedString()
  }
  public static func buildOptional(_ component: Component?) -> Component {
    component ?? NSAttributedString(string: "")
  }
  public static func buildEither(first component: Component) -> Component {
    component
  }
  public static func buildEither(second component: Component) -> Component {
    component
  }
  public static func buildArray(_ components: [Component]) -> Component {
    components.reduce(into: NSMutableAttributedString()) { concatenated, element in
      concatenated.append(element)
    }
  }
  public static func buildLimitedAvailability(_ component: Component) -> Component {
    component
  }
}

extension NSAttributedString {
  public convenience init(@AttributedStringBuilder content: () -> NSAttributedString) {
    self.init(attributedString: content())
  }
}
