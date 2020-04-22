//
//  SummaryViewController.swift
//  CroesusApp
//
//  Created by Grace Njoroge on 22/04/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit
import AloeStackView

//firstname:
//lastname:
//id/passport
//devicetype:
//region:
//photo
//update save buttons

class SummaryViewController: AloeStackViewController {
  
  var firstNameLabel: UILabel = {
    let label = UILabel()
    label.text = "Firstname:"
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightGray
    return label
  }()
  
  var firstNameInput: UILabel = {
    let label = UILabel()
    label.text = "Firstname"
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightGray
    return label
  }()
  
  var lastNameLabel: UILabel = {
    let label = UILabel()
    label.text = "Lastname:"
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightGray
    return label
  }()
  
  var lastNameInput: UILabel = {
    let label = UILabel()
    label.text = "Lastname"
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightGray
    return label
  }()
  
  var identificationLabel: UILabel = {
    let label = UILabel()
    label.text = "Id/Passport:"
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightGray
    return label
  }()
  
  var indentificationInput: UILabel = {
    let label = UILabel()
    label.text = "1234567"
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightGray
    return label
  }()
  
  var deviceTypeLabel: UILabel = {
    let label = UILabel()
    label.text = "Device type:"
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightGray
    return label
  }()
  
  var deviceTypeInput: UILabel = {
    let label = UILabel()
    label.text = "Firstname"
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightGray
    return label
  }()
  
  var regionLabel: UILabel = {
    let label = UILabel()
    label.text = "Region:"
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightGray
    return label
  }()
  
  var regioneInput: UILabel = {
    let label = UILabel()
    label.text = "Central"
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightGray
    return label
  }()
  
  var photoLabel: UILabel = {
    let label = UILabel()
    label.text = "Photo:"
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightGray
    return label
  }()
  
  var photoImageView: UIImageView = {
    let imgView = UIImageView()
    imgView.translatesAutoresizingMaskIntoConstraints = false
    return imgView
  }()
  
  var updateButton: UIButton = {
    let button = UIButton(type: .system)
    //button.addTarget(self, action: #selector(showDetailsSummary), for: .touchUpInside)
    button.layer.cornerRadius = 20
    button.clipsToBounds = true
    button.setTitle("Update info", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .blue
    button.tintColor = .white
    return button
  }()
  
  var saveButton: UIButton = {
    let button = UIButton(type: .system)
    //button.addTarget(self, action: #selector(showDetailsSummary), for: .touchUpInside)
    button.layer.cornerRadius = 20
    button.clipsToBounds = true
    button.setTitle("Save", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .blue
    button.tintColor = .white
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupBioDetails()
  }
  
  fileprivate func setupBioDetails() {
    stackView.addRow(firstNameLabel)
    stackView.addSubview(firstNameInput)
    firstNameInput.topAnchor.constraint(equalTo: firstNameLabel.topAnchor).isActive = true
    firstNameInput.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: -24).isActive = true
  }


}
