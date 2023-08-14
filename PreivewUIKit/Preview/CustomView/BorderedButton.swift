//
//  BorderedButton.swift
//  PreviewTest
//
//  Created by linuxul on 2023/08/14.
//

import UIKit

final class BorderedButton: UIButton {

    var cornerRadius1: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius1
        }
    }

    var borderWidth1: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth1
        }
    }

    var borderColor1: UIColor? {
        didSet {
            self.layer.borderColor = borderColor1?.cgColor
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
        
        backgroundColor = .red
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

@available(iOS 13.0, *)
struct BorderButton_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            UIViewPreview {
                let button = BorderedButton(frame: .zero)
                button.setTitle("Touch me!!", for: .normal)
                button.setTitleColor(.white, for: .normal)
                return button
            }
            UIViewPreview {
                let button = BorderedButton(frame: .zero)
                button.setTitle("Touch me!!", for: .normal)
                button.setTitleColor(.yellow, for: .normal)
                return button
            }
        }
        .previewLayout(.sizeThatFits)
        .padding(10)
    }
}
#endif
