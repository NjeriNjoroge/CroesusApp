//
//  SummaryViewController.swift
//  CroesusApp
//
//  Created by Grace Njoroge on 22/04/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit
import AloeStackView
import CoreData
import Alamofire

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
    self.identificationInput.text = id
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
  
  var identificationInput: UILabel = {
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
    button.addTarget(self, action: #selector(sendToServer), for: .touchUpInside)
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
    navigationItem.title = "Confirm your details"
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
    stackView.addSubview(identificationInput)
    identificationInput.topAnchor.constraint(equalTo: identificationLabel.topAnchor).isActive = true
    identificationInput.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: -24).isActive = true
    
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
  
  @objc fileprivate func sendToServer() {
    checkIfConnectivityIsAvailable()
  }
  
  //if there is connectivity we make the next call to send to a server
  fileprivate func checkIfConnectivityIsAvailable() {
    if Connectivity.isConnectedToInternet(){
      print("connected to internet")
      //do the network call
    } else {
      sendToDatabase()
    }
  }
  
  fileprivate func sendToDatabase() {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
    let newUser = NSManagedObject(entity: entity!, insertInto: context)

    //add the data
    guard let firstName = firstNameInput.text else { return }
    guard let lastName = lastNameInput.text else { return }
    guard let id = identificationInput.text else { return }
    guard let region = regioneInput.text else { return }
    guard let photo = photoImageView.image else { return }
    let fullNames = firstName + lastName
    newUser.setValue(fullNames, forKey: "name")
    newUser.setValue(id, forKey: "id")
    newUser.setValue("\(photo)", forKey: "photo")
    newUser.setValue(region, forKey: "region")

    //save data to core data
    do {
       try context.save()
      } catch {
       print("Failed saving to core data")
    }
  }


}
