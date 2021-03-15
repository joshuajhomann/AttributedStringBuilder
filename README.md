# AttributedStringBuilder

This package provides a DSL for building attributed strings.

## Usage

### Creating a builder

`NSAttributedString` has been extended with an initializer that takes an `@AttributedStringBuilder`:
```Swift
label.attributedText = .init {
  "hello"
}
```
The builder can understand `NSAttributedString` and any expression which conforms to the `AttributedStringConvertible` protocol.  Conformances are provided for the following:
  * String
  * UIImage and UImage?
  * Paragraph
  * AttributedText
  * Space
  * LineBreak

### Paragraph
A paragraph represents a block of text with an optional linebreak to which a `ParagraphStyle` can be applied.  It accepts an `@AttributedStringBuilder` in its initializer.

For example:
```Swift
label.attributedText = .init {
    Paragraph {
        "I am a paragraph with some indentation."
    }
    .firstLineHeadIndent(50)
    .headIndent(25)
    .tailIndent(250)
}
```
### AttributedText
AttributedText represents a block of text with an `AttributedTextStyle` applied to it.  It accepts either a `String` or an `@AttributedStringBuilder` in its initializer.

For example:
```Swift
label.attributedText = .init {
    AttributedText {
        "Here is some text"
        Space()
        AttributedText("with some other text in red")
            .foregroundColor(.red)
        Space()
        "followed by more plain text"
    }
    .foregroundColor(.darkGray)
}
```


## Example

See the included example project for various use cases:
![image](https://github.com/joshuajhomann/AttributedStringBuilder/blob/master/preview.png?raw=true "Preview")

## Adding *AttributedStringBuilder* as a Dependency

To use the AttributedStringBuilder package in a SwiftPM project, add the following line to the dependencies in your Package.swift file:

.package(url: "https://github.com/joshuajhomann/AttributedStringBuilder", from: "1.0.0"),
