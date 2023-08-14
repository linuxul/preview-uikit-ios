//
//  DynamicButton.swift
//  PreivewUIKit
//
//  Created by linuxul on 2023/08/14.
//

import UIKit

final class DynamicButton: UIButton {

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
        backgroundColor = .red
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

@available(iOS 13.0, *)
struct DynamicButton_Preview: PreviewProvider {
    static var previews: some View {
        ForEach(ContentSizeCategory.allCases, id: \.self) { sizeCategory in
            Group {
                UIViewPreview {
                    let button = DynamicButton(frame: .zero)
                    button.setTitle("DynamicButton Touch me!!", for: .normal)
                    button.setTitleColor(.white, for: .normal)
                    return button
                }
                UIViewPreview {
                    let button = DynamicButton(frame: .zero)
                    button.setTitle("DynamicButton Touch me!!", for: .normal)
                    button.setTitleColor(.yellow, for: .normal)
                    return button
                }
            }.environment(\.sizeCategory, sizeCategory)
             .previewDisplayName("\(sizeCategory)")
        }
        .previewLayout(.sizeThatFits)
        .padding(10)
    }
}
#endif
