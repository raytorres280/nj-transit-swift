//
//  SearchBtn.swift
//  NJ-Transit
//
//  Created by Raymond Torres on 5/13/18.
//  Copyright © 2018 Raymond Torres. All rights reserved.
//

import UIKit

class SearchBtn: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        formatButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        formatButton()
    }
    
    private func formatButton() -> Void {
        self.backgroundColor = .red
        self.setTitle("search", for: UIControlState.normal)
        self.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        self.translatesAutoresizingMaskIntoConstraints = false
//        self.heightAnchor.constraint(equalToConstant: 20).isActive = true
//        guard let superview = superview else { return }
//        self.widthAnchor.constraint(equalTo: superview.widthAnchor, multiplier: 0.75).isActive = true
    }

}
