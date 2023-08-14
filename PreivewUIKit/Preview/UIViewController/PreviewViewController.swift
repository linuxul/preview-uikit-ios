//
//  PreviewViewController.swift
//  PreivewUIKit
//
//  Created by linuxul on 2023/08/14.
//

import UIKit

class PreviewViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

let deviceNames: [String] = [
    DeviceType.iPhone14.name(),
    DeviceType.iPhone14Pro.name()
]

@available(iOS 13.0, *)
struct PreviewViewController_Preview: PreviewProvider {
    static var previews: some View {
        ForEach(deviceNames, id: \.self) { deviceName in
            UIViewControllerPreview {
                let storyboard = UIStoryboard(name: "Preview", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "PreviewViewController") as! PreviewViewController
                vc.view.backgroundColor = .green
                return vc
            }
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}
#endif
