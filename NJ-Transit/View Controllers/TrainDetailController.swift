//
//  TrainDetailController.swift
//  NJ-Transit
//
//  Created by Raymond Torres on 5/19/18.
//  Copyright © 2018 Raymond Torres. All rights reserved.
//

import UIKit

class TrainDetailController: UIViewController {

    var train: TrainWithSelectedStops
    var stopLabelsStack: UIStackView
    
    init(train: TrainWithSelectedStops) {
        self.train = train
        var array = train.train.Stops.map { (item) -> UILabel in
            let label = UILabel()
            label.text = item.Station.name
            if(item.Station.name == train.start.Station.name || item.Station.name == train.end.Station.name) {
                label.textColor = UIColor.blue
            }
            return label
        }
        let trainLabel = UILabel()
        trainLabel.text = train.train.name
        array.insert(trainLabel, at: 0)
        stopLabelsStack = UIStackView.init(arrangedSubviews: array)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func formatView() -> Void {
        view.addSubview(stopLabelsStack)
        view.backgroundColor = .purple
        stopLabelsStack.axis = .vertical
        stopLabelsStack.distribution = .fillEqually
        stopLabelsStack.backgroundColor = .white
        stopLabelsStack.translatesAutoresizingMaskIntoConstraints = false
        stopLabelsStack.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        stopLabelsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stopLabelsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stopLabelsStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

}

let colors = [UIColor.init(hexString: "#F44336"), UIColor.init(hexString: "#F44336"), UIColor.init(hexString: "#F44336"),
              UIColor.init(hexString: "#F44336"), UIColor.init(hexString: "#F44336"), UIColor.init(hexString: "#F44336"),
              UIColor.init(hexString: "#F44336"), UIColor.init(hexString: "#F44336"), UIColor.init(hexString: "#F44336"),
]
