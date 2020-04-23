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
  
  init(firstName: String, lastName: String, id: String, region: String, photo: UIImage) {
    self.firstNameInput.text = firstName
    self.lastNameInput.text = lastName
    self.indentificationInput.text = id
    self.regioneInput.text = region
    self.photoImageView.image = photo
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
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
    label.text = "\(UIDevice.current.model)"
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
    imgView.contentMode = .scaleAspectFit
    return imgView
  }()
  
  var updateButton: UIButton = {
    let button = UIButton(type: .system)
    button.addTarget(self, action: #selector(showMainVC), for: .touchUpInside)
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
    //hide the back button
    self.navigationItem.hidesBackButton = true
    stackView.hidesSeparatorsByDefault = true
    setupBioDetails()
  }
  
  fileprivate func setupBioDetails() {
    stackView.addRow(firstNameLabel)
    stackView.addSubview(firstNameInput)
    firstNameInput.topAnchor.constraint(equalTo: firstNameLabel.topAnchor).isActive = true
    firstNameInput.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: -24).isActive = true
    
    stackView.addRow(lastNameLabel)
    stackView.addSubview(lastNameInput)
    lastNameInput.topAnchor.constraint(equalTo: lastNameLabel.topAnchor).isActive = true
    lastNameInput.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: -24).isActive = true
    
    stackView.addRow(identificationLabel)
    stackView.addSubview(indentificationInput)
    indentificationInput.topAnchor.constraint(equalTo: identificationLabel.topAnchor).isActive = true
    indentificationInput.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: -24).isActive = true
    
    stackView.addRow(deviceTypeLabel)
    stackView.addSubview(deviceTypeInput)
    deviceTypeInput.topAnchor.constraint(equalTo: deviceTypeLabel.topAnchor).isActive = true
    deviceTypeInput.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: -24).isActive = true
    
    stackView.addRow(regionLabel)
    stackView.addSubview(regioneInput)
    regioneInput.topAnchor.constraint(equalTo: regionLabel.topAnchor).isActive = true
    regioneInput.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: -24).isActive = true
    
    stackView.addRow(deviceTypeLabel)
    stackView.addSubview(deviceTypeInput)
    deviceTypeInput.topAnchor.constraint(equalTo: deviceTypeLabel.topAnchor).isActive = true
    deviceTypeInput.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: -24).isActive = true
    
    stackView.addRow(photoLabel)
    stackView.addRow(photoImageView)
    stackView.addRow(updateButton)
    stackView.addRow(saveButton)
  }
  
  @objc fileprivate func showMainVC() {
    navigationController?.popViewController(animated: true)
  }


}
