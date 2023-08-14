//
//  LogoView.swift
//  PreivewUIKit
//
//  Created by linuxul on 2023/08/14.
//

import UIKit

class LogoView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    func commonInit() {
        let view = Bundle.main.loadNibNamed(String(describing: self.classForCoder), owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        view.backgroundColor = .clear
        self.addSubview(view)
        initComponents()
    }
    
    func initComponents() {
        backgroundColor = .red
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

@available(iOS 13.0, *)
struct LogoView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            UIViewPreview {
                let logoView = LogoView(frame: .zero)
                logoView.titleLabel.text = "Click Touch me!!"
                logoView.titleLabel.textColor = .white
                return logoView
            }
        }
        .previewLayout(.sizeThatFits)
        .padding(10)
    }
}
#endif
