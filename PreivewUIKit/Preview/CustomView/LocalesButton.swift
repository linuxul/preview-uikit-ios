//
//  LocalesButton.swift
//  PreivewUIKit
//
//  Created by linuxul on 2023/08/14.
//

import UIKit

final class LocalesButton: UIButton {

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
struct LocalesButton_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let button = LocalesButton(frame: .zero)
            button.setTitle("LocalesButton Touch me!!", for: .normal)
            button.setTitleColor(.white, for: .normal)
            return button
        }
        .previewLayout(.sizeThatFits)
        .padding(10)
    }
}
#endif
