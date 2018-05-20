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
    var stations = [Station]() {
        didSet {
            DispatchQueue.main.sync {
                //if I use threads correctly, dont think i need futures/promises anymore.
                self.startPicker.reloadAllComponents()
                self.endPicker.reloadAllComponents()
            }
        }
    }
    var trains = [TrainWithSelectedStops]() {
        didSet {
            DispatchQueue.main.sync {
                self.list.reloadData()
            }
        }
    }
    var container: UIView = UIView()
    var startionStationTextField: UITextField = StationTextField()
    var endStationTextField: UITextField = StationTextField()
    var list: UITableView = UITableView()
    var startPicker: UIPickerView = UIPickerView()
    var endPicker: UIPickerView = UIPickerView()
    var searchBtn: UIButton = SearchBtn()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        setupStackView()
        setupTableView()
        getStations()
        searchBtn.addTarget(self, action: #selector(self.onSearchBtnTap(_:)), for: .touchUpInside)
    }
    
    private func setupStackView() -> Void {
        startPicker.dataSource = self
        startPicker.delegate = self
        endPicker.dataSource = self
        endPicker.delegate = self
        startionStationTextField.inputView = startPicker
        endStationTextField.inputView = endPicker
        let stackView = UIStackView(arrangedSubviews: [startionStationTextField, endStationTextField, searchBtn])
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trains.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = trains[indexPath.row].train.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let train = trains[indexPath.row]
        let vc = TrainDetailController()
        vc.train = train
        navigationController?.pushViewController(vc, animated: true)
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == startPicker {
            startionStationTextField.text = self.stations[row].name
            startStation = self.stations[row]
        }
        if pickerView == endPicker {
            endStationTextField.text = self.stations[row].name
            endStation = self.stations[row]
        }
    }
    
    @objc func donePicker(_: Any) -> Void {
        
    }
    @objc func cancelPicker(_: Any) -> Void {
//        picker.endEditing(true)
    }
    
    @objc func onSearchBtnTap(_ : UIButton) {
        if(startStation != nil && endStation != nil) {
            endStationTextField.endEditing(true)
            getTrains(from: startStation!, to: endStation!)
        } else {
            print("select start and end stations before searching")
        }
    }
    
    @objc func onStartStationTextFieldTap(_: UITextField) -> Void {
        print("textfield tapped")
    }
    
    private func setupTableView() -> Void {
        list.dataSource = self
        list.delegate = self
        list.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        list.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(list)
        list.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        list.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        list.topAnchor.constraint(equalTo: view.subviews[0].bottomAnchor, constant: 10).isActive = true
    }
    
    private func getStations() -> Void {
        APIService.fetchAllStations()
            .subscribe(
                onNext: { stations in
                    print(stations.count)
                    self.stations = stations
            }, onError: { err in
                print("found err")
            })
    }
    
    private func getTrains(from start: Station, to end: Station) -> Void {
        APIService.findRoute(from: start.id, to: end.id)
            .subscribe(
                onNext: { trains in
                    let formattedTrains = trains.map({ train -> TrainWithSelectedStops in
                        let selectedStart = train.Stops.first { $0.Station.id == start.id }
                        let selectedEnd = train.Stops.first { $0.Station.id == end.id }
                        return TrainWithSelectedStops(start: selectedStart!, end: selectedEnd!, train: train)
                    })
                    self.trains = formattedTrains
            }, onError: { err in
                print("found err")
            })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

