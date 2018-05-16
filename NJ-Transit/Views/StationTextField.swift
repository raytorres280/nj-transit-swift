//
//  StartStationTextField.swift
//  NJ-Transit
//
//  Created by Raymond Torres on 5/13/18.
//  Copyright © 2018 Raymond Torres. All rights reserved.
//

import UIKit

class StationTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        formatTextField()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        formatTextField()
    }
    
    private func formatTextField() -> Void {
        self.backgroundColor = .white
        guard let superview = superview else { return }
//        self.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
//        self.widthAnchor.constraint(equalTo: superview.widthAnchor, multiplier: 0.75).isActive = true
//        self.centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: -40).isActive = true
//        self.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func createSubViews() -> Void {
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
