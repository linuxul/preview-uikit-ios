//
//  LoveMeViewCell.swift
//  PreivewUIKit
//
//  Created by linuxul on 2023/08/14.
//

import UIKit

class LoveMeViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .red
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(_ title: String) {
        titleLabel.text = title
    }
    
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct LoveMeViewCellRepresentable: UIViewRepresentable {
    typealias UIViewType = LoveMeViewCell

    func makeUIView(context: Context) -> LoveMeViewCell {
        return UINib(nibName: "LoveMeViewCell", bundle: nil)
                            .instantiate(withOwner: nil, options: nil).first as! LoveMeViewCell
    }

    func updateUIView(_ uiView: LoveMeViewCell, context: Context) {
        uiView.setData("Touch Me!!")
    }
}

@available(iOS 13.0, *)
struct LoveMeViewCellPreview: PreviewProvider {
    static var previews: some View {
        Group {
            LoveMeViewCellRepresentable()
                .frame(width: 375, height: 60)
        }
        .previewLayout(.sizeThatFits)
        .padding(10)
    }
}
#endif
