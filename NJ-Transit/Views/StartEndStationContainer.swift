//
//  StartEndStationContainer.swift
//  NJ-Transit
//
//  Created by Raymond Torres on 5/13/18.
//  Copyright © 2018 Raymond Torres. All rights reserved.
//

import UIKit

class StartEndStationContainer: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createSubViews()
    }
    private func createSubViews() -> Void {
        formatContainer()
        setupTextFields()
    }
    
    private func formatContainer() -> Void {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.red
        guard let superview = superview else { return }
        self.widthAnchor.constraint(equalTo: superview.widthAnchor).isActive = true
        self.heightAnchor.constraint(equalTo: superview.heightAnchor, multiplier: 0.4).isActive = true
        self.topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
    }
    private func setupTextFields() -> Void {
        let startTextField = StationTextField()
//        container.addSubview(startionStationTextField)
//        container.addSubview(endStationTextField)
        //        startionStationTextField.addTarget(self, action: #selector(onStartStationTextFieldTap(_ :)), for: .touchUpInside)
//        endStationTextField.translatesAutoresizingMaskIntoConstraints = false
//        endStationTextField.inputView = endPicker
//        endStationTextField.backgroundColor = UIColor.purple
//        endStationTextField.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
//        endStationTextField.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.75).isActive = true
//        endStationTextField.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: 40).isActive = true
//        endStationTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
