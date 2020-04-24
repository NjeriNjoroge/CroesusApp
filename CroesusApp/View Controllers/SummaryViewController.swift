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
    return label
  }()
  
  var photoLabel: UILabel = {
    let label = UILabel()
    label.text = "Photo:"
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightGray
    return label
  }()
  
  var addedImageView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.borderWidth = 1
    view.layer.borderColor = UIColor.black.cgColor
    view.layer.cornerRadius = 7
    view.clipsToBounds = true
    return view
  }()
  
  var photoImageView: UIImageView = {
    let imgView = UIImageView()
    imgView.translatesAutoresizingMaskIntoConstraints = false
    imgView.contentMode = .scaleAspectFit
    return imgView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //hide the back button
    self.navigationItem.hidesBackButton = true
    navigationItem.title = "Confirm your details"
    stackView.hidesSeparatorsByDefault = true
    setupBioDetails()
  }
  
  override func loadView() {
    super.loadView()
    addButtonsToNavBar()
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
    stackView.addRow(addedImageView)
    addedImageView.heightAnchor.constraint(equalToConstant: 135).isActive = true
    addedImageView.addSubview(photoImageView)
    NSLayoutConstraint.activate([
      photoImageView.topAnchor.constraint(equalTo: addedImageView.topAnchor),
      photoImageView.leadingAnchor.constraint(equalTo: addedImageView.leadingAnchor),
      photoImageView.trailingAnchor.constraint(equalTo: addedImageView.trailingAnchor),
      photoImageView.bottomAnchor.constraint(equalTo: addedImageView.bottomAnchor)
    ])
  }
  
  @objc fileprivate func showMainVC() {
    navigationController?.popViewController(animated: true)
  }
  
  @objc fileprivate func sendToServer() {
    checkIfConnectivityIsAvailable()
  }
  
  //if there is connectivity we make the network call to send to a server
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
  
  fileprivate func addButtonsToNavBar() {
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(showMainVC))
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(sendToServer))
  }


}
