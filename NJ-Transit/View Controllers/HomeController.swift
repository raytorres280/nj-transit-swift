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
    
    var container: UIView = UIView()
    var startionStationTextField: UITextField = UITextField()
    var endStationTextField: UITextField = UITextField()
    var list: UITableView = UITableView()
    var picker: UIPickerView = UIPickerView()
    var searchBtn: UIButton = UIButton.init(type: UIButtonType.system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIService.fetchAllStations()
        .subscribe(
            onNext: { stations in
                print(stations.count)
                self.stations = stations
        }, onError: { err in
            print("found err")
        })
        setupStationPickerView()
        setupTableView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let station = Station.init(id: 1, name: "hello", createdAt: Date(), updatedAt: Date())
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        //        var cell = StationCell(text: station.name)
        cell.textLabel?.text = station.name
        return cell
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.stations.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.stations[row].name
    }
    private func setupStationPickerView() -> Void {
        picker.dataSource = self
        picker.delegate = self
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = UIColor.red
        view.addSubview(container)
        container.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        container.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        container.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        setupTextFields()
        setupSearchBtn()
        
    }
    
    private func setupTextFields() -> Void {
        container.addSubview(startionStationTextField)
        container.addSubview(endStationTextField)
        startionStationTextField.translatesAutoresizingMaskIntoConstraints = false
        startionStationTextField.inputView = picker
        startionStationTextField.backgroundColor = UIColor.orange
        startionStationTextField.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        startionStationTextField.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.75).isActive = true
        startionStationTextField.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: -40).isActive = true
        startionStationTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        endStationTextField.translatesAutoresizingMaskIntoConstraints = false
        endStationTextField.inputView = picker
        endStationTextField.backgroundColor = UIColor.purple
        endStationTextField.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        endStationTextField.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.75).isActive = true
        endStationTextField.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: 40).isActive = true
        endStationTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func setupSearchBtn() -> Void {
        container.addSubview(searchBtn)
//        searchBtn.backgroundColor = UIColor.cyan
//        searchBtn.showsTouchWhenHighlighted = true
        searchBtn.setTitle("search", for: UIControlState.normal)
        searchBtn.addTarget(self, action: #selector(onSearchBtnTap(_ :)), for: .touchUpInside)
        searchBtn.translatesAutoresizingMaskIntoConstraints = false
        searchBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        searchBtn.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.75).isActive = true
        searchBtn.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        searchBtn.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: 120).isActive = true
    }
    
    @objc func onSearchBtnTap(_ : UIButton) {
        print("button tapped")
    }
    
    private func setupTableView() -> Void {
        list.dataSource = self
        list.delegate = self
        list.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        list.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(list)
        list.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        list.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
        list.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        list.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

