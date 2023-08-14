//
//  UIViewController+Extension.swift
//  PreivewUIKit
//
//  Created by linuxul on 2023/08/14.
//

import UIKit

#if canImport(SwiftUI) && DEBUG
import SwiftUI

@available(iOS 13, *)
extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController
        
        /// SwiftUI에서 UIViewController를 생성합니다.
        /// - Parameter context: 현재 컨텍스트
        /// - Returns: 생성된 UIViewController
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        /// UIViewController를 업데이트합니다. (이 경우 구현이 필요 없습니다.)
        /// - Parameters:
        ///   - uiViewController: 업데이트할 UIViewController
        ///   - context: 현재 컨텍스트
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    }
    
    /// 현재 UIViewController 인스턴스를 SwiftUI 뷰로 변환합니다.
    /// - Returns: UIViewController를 나타내는 SwiftUI 뷰
    func toPreview() -> some View {
        Preview(viewController: self)
    }
}

@available(iOS 13, *)
public struct UIViewPreview<View: UIView>: UIViewRepresentable {
    public let view: View
    
    /// UIView를 생성하는 초기화 메서드
    /// - Parameter builder: UIView를 생성하는 클로저
    public init(_ builder: @escaping () -> View) {
        view = builder()
    }
    
    /// SwiftUI에서 UIView를 생성합니다.
    /// - Parameter context: 현재 컨텍스트
    /// - Returns: 생성된 UIView
    public func makeUIView(context: Context) -> UIView {
        return view
    }
    
    /// UIView를 업데이트합니다. 여기서는 hug priority를 설정합니다.
    /// - Parameters:
    ///   - view: 업데이트할 UIView
    ///   - context: 현재 컨텍스트
    public func updateUIView(_ view: UIView, context: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}

@available(iOS 13, *)
public struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    public let viewController: ViewController
    
    /// UIViewController를 생성하는 초기화 메서드
    /// - Parameter builder: UIViewController를 생성하는 클로저
    public init(_ builder: @escaping () -> ViewController) {
        viewController = builder()
    }
    
    /// SwiftUI에서 UIViewController를 생성합니다.
    /// - Parameter context: 현재 컨텍스트
    /// - Returns: 생성된 UIViewController
    public func makeUIViewController(context: Context) -> ViewController {
        return viewController
    }
    
    /// UIViewController를 업데이트합니다. (이 경우 구현이 필요 없습니다.)
    /// - Parameters:
    ///   - uiViewController: 업데이트할 UIViewController
    ///   - context: 현재 컨텍스트
    public func updateUIViewController(_ uiViewController: ViewController, context: UIViewControllerRepresentableContext<UIViewControllerPreview<ViewController>>) {}
}
#endif
