//
//  ViewController.swift
//  AttributedStringBuilderExample
//
//  Created by Joshua Homann on 3/6/21.
//

import AttributedStringBuilder
import UIKit

final class ViewController: UIViewController {
  @IBOutlet private var label: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.attributedText = .init {
      Paragraph {
        AttributedText("This is a header")
          .font(UIFont.boldSystemFont(ofSize: 32))
          .underlineStyle(.double)
          .underlineColor(.black)
          .foregroundColor(.darkGray)
      }
        .alignment(.center)
      LineBreak()
      Paragraph {
        AttributedText("Here is some plain text that has been right justified")
      }
        .alignment(.right)
      Paragraph {
        AttributedText("Here is some text with kerning applied and extra linespacing")
          .kern(2)
          .foregroundColor(.darkGray)
      }
        .lineSpacing(4)
      Paragraph {
        AttributedText("Here is some text that has been italicized")
          .obliqueness(0.25)
          .foregroundColor(.blue)
      }
      Paragraph {
        AttributedText("Here is some text that has a strikethrough applied to it has been indented to be 225 points wide")
          .strikethroughColor(.red)
          .strikethroughStyle(.thick)
      }
      .firstLineHeadIndent(50)
      .headIndent(25)
      .tailIndent(250)
      "Here is some plain text"
      LineBreak()
      "And more plain text"
      LineBreak()
      LineBreak()
      Paragraph {
        AttributedText {
          "Nested text"
          Space()
          AttributedText {
            "with nested attributed text and an image"
            UIImage(systemName: "star.fill")
          }
          .foregroundColor(.red)
          Space()
          "followed by more plain text"
        }
      }
    }
  }
}

