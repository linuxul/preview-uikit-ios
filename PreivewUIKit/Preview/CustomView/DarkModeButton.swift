//
//  DarkModeButton.swift
//  PreivewUIKit
//
//  Created by linuxul on 2023/08/14.
//

import UIKit

final class DarkModeButton: UIButton {

    var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }

    var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }

    var borderColor: UIColor? {
        didSet {
            self.layer.borderColor = borderColor?.cgColor
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .gray
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

@available(iOS 13.0, *)
struct DarkModeButton_Preview: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
            Group {
                UIViewPreview {
                    let button = DarkModeButton(frame: .zero)
                    button.setTitle("Touch me!!", for: .normal)
                    button.setTitleColor(.orange, for: .normal)
                    button.cornerRadius = 8
                    button.borderWidth = 1
                    button.borderColor = .red
                    return button
                }.environment(\.colorScheme, colorScheme)
                 .previewDisplayName("\(colorScheme)")
                UIViewPreview {
                    let button = DarkModeButton(frame: .zero)
                    button.setTitle("Touch me!!", for: .normal)
                    button.setTitleColor(.green, for: .normal)
                    button.cornerRadius = 8
                    button.borderWidth = 1
                    button.borderColor = .blue
                    return button
                }.environment(\.colorScheme, colorScheme)
                 .previewDisplayName("\(colorScheme)")
            }
            .previewLayout(.sizeThatFits)
            .background(Color(.systemBackground))
            .padding(10)
        }
    }
}
#endif
