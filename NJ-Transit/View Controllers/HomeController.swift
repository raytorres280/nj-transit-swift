//
//  HomeController.swift
//  NJ-Transit
//
//  Created by Raymond Torres on 5/3/18.
//  Copyright © 2018 Raymond Torres. All rights reserved.
//

import UIKit

class StationCell: UITableViewCell {
    var label: UITextField
//    init(text: String) {
//        super.init()
//        label = UITextView()
//        label.text = text
//    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class HomeController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    let cellId = "cellId"

    var startStation: Station?
    var endStation: Station?
    var stations = [Station]()
    var startStationTextView: UITextField = UITextField()
    var endStationTextView: UITextField = UITextField()
    var list: UITableView = UITableView()
    var picker: UIPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        setupStationPickerView()
        setupTableView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let station = Station(id: 1, name: "hello", createdAt: Date(), updatedAt: Date())
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        //        var cell = StationCell(text: station.name)
        cell.textLabel?.text = station.name
        return cell
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return APIService.stations.count
    }
    
    private func setupStationPickerView() -> Void {
        picker.dataSource = self
        picker.delegate = self
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = UIColor.red
        view.addSubview(container)
        container.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        container.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        container.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        container.addSubview(startStationTextView)
        container.addSubview(endStationTextView)
        startStationTextView.translatesAutoresizingMaskIntoConstraints = false
        startStationTextView.inputView = picker
        startStationTextView.backgroundColor = UIColor.orange
        endStationTextView.translatesAutoresizingMaskIntoConstraints = false
        endStationTextView.inputView = picker
        endStationTextView.backgroundColor = UIColor.purple
        startStationTextView.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        startStationTextView.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.75).isActive = true
        startStationTextView.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: -20).isActive = true
        startStationTextView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        endStationTextView.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        endStationTextView.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.75).isActive = true
        endStationTextView.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: 20).isActive = true
        endStationTextView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
//    private func setupStationPickers() -> UIPickerView {
//        let picker = UIPickerView()
//        picker.widthAnchor.constraint(equalTo: )
//    }
    
    private func setupTableView() -> Void {
        list.dataSource = self
        list.delegate = self
        list.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        list.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(list)
        list.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        list.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        list.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        list.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

