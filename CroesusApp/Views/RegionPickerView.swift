//
//  RegionPickerView.swift
//  CroesusApp
//
//  Created by Grace Njoroge on 21/04/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit

class RegionPickerView: UIView {
  
  var regionPicker = UIPickerView()
  var regionsArray = ["Central", "Coastal", "Nairobi", "Nyanza", "Northeast", "Riftvalley", "West Kenya", "East Kenya"]
  
  lazy var regionLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "Select your region"
      label.textColor = .lightGray
      return label
  }()
  
  lazy var regionInputField: UITextField = {
      let tf = UITextField()
      tf.inputView = regionPicker
      tf.text = regionsArray[0]
      tf.tintColor = .clear
      tf.translatesAutoresizingMaskIntoConstraints = false
      return tf
  }()
  
  lazy var pickerStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [regionLabel, regionInputField])
    stackView.axis = .vertical
    stackView.spacing = 5
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupViews()
    regionPicker.delegate = self
    regionPicker.dataSource = self
  }
  
  func setupViews() {
    addSubview(pickerStackView)
    
    NSLayoutConstraint.activate([
      pickerStackView.topAnchor.constraint(equalTo: topAnchor)
     ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension RegionPickerView: UIPickerViewDataSource, UIPickerViewDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      return regionsArray.count
    }
    
    //arranges the different options in the picker
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return regionsArray[row]
    }
    
    //sets the selected value in the textfield
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
      regionInputField.text = regionsArray[row]
    }
  
}

