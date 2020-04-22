//
//  ViewController.swift
//  CroesusApp
//
//  Created by Grace Njoroge on 21/04/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit
import AloeStackView

class MainViewController: AloeStackViewController {
  
  var firstNameTF: UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    let attributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]
    tf.attributedPlaceholder = NSAttributedString(string: "First name", attributes: attributes)
    return tf
  }()
  
  var firstNameLineView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .lightGray
    return view
  }()
  
  var lastNameTF: UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    let attributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]
    tf.attributedPlaceholder = NSAttributedString(string: "Last name", attributes: attributes)
    return tf
  }()
  
  var lastNameLineView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .lightGray
    return view
  }()
  
//  var idFieldTF: UITextField = {
//    let tf = UITextField()
//    tf.keyboardType = .numberPad
//    tf.translatesAutoresizingMaskIntoConstraints = false
//    let attributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]
//    tf.attributedPlaceholder = NSAttributedString(string: "ID number", attributes: attributes)
//    return tf
//  }()
//
//  var passportFieldTF: UITextField = {
//    let tf = UITextField()
//    tf.translatesAutoresizingMaskIntoConstraints = false
//    let attributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]
//    tf.attributedPlaceholder = NSAttributedString(string: "Passport number", attributes: attributes)
//    return tf
//  }()
//
//  var passportExpiryTF: UITextField = {
//    let tf = UITextField()
//    tf.translatesAutoresizingMaskIntoConstraints = false
//    let attributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]
//    tf.attributedPlaceholder = NSAttributedString(string: "Passport", attributes: attributes)
//    return tf
//  }()
  
  var addImageLabel: UILabel = {
    let label = UILabel()
    label.text = "Add a passport photo"
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightGray
    return label
  }()
  
  var addImageView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.borderWidth = 1
    view.layer.borderColor = UIColor.black.cgColor
    view.layer.cornerRadius = 7
    view.clipsToBounds = true
    return view
  }()
  
  var addImageButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(UIImage(named: "plusImage"), for: .normal)
    //button.addTarget(self, action: #selector(presentCameraSheet), for: .touchUpInside)
    return button
  }()
  
  var passportPhotoImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.isHidden = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  var viewSummaryButton: UIButton = {
    let button = UIButton(type: .system)
    //button.addTarget(self, action: #selector(showDetailsSummary), for: .touchUpInside)
    button.layer.cornerRadius = 20
    button.clipsToBounds = true
    button.setTitle("Show summary", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .blue
    button.tintColor = .white
    return button
  }()
  
  var regionPicker = RegionPickerView()
  let toolBar = UIToolbar() //picker toolbar
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func loadView() {
    super.loadView()
    stackView.hidesSeparatorsByDefault = true
    setupViews()
    setupPickerToolbar()
    setupImageView()
    setupButtonView()
  }
  
  func setupViews() {
    stackView.addRows([firstNameTF, firstNameLineView, lastNameTF, lastNameLineView])
    firstNameLineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
    lastNameLineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
    
    //adding picker
    regionPicker.translatesAutoresizingMaskIntoConstraints = false
    stackView.addRow(regionPicker)
    regionPicker.heightAnchor.constraint(equalToConstant: 50).isActive = true
  }
  
  fileprivate func setupPickerToolbar() {
    regionPicker.regionInputField.inputAccessoryView = toolBar

    toolBar.barStyle = UIBarStyle.default
    toolBar.isTranslucent = true
    toolBar.tintColor = UIColor.lightGray
    toolBar.sizeToFit()
    
    let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(doneClick))
    doneButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor :UIColor.darkGray], for: UIControl.State.normal)
    
    let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
    
    toolBar.setItems([spaceButton, doneButton], animated: false)
    toolBar.isUserInteractionEnabled = true
  }
  
  @objc fileprivate func doneClick() {
    regionPicker.endEditing(true)
  }
  
  fileprivate func setupImageView() {
    stackView.addRows([addImageLabel, addImageView, passportPhotoImageView])
    addImageView.heightAnchor.constraint(equalToConstant: 135).isActive = true
    addImageView.addSubview(addImageButton)
    NSLayoutConstraint.activate([
      addImageButton.centerXAnchor.constraint(equalTo: addImageView.centerXAnchor),
      addImageButton.centerYAnchor.constraint(equalTo: addImageView.centerYAnchor)
    ])
    addImageView.addSubview(passportPhotoImageView)
    NSLayoutConstraint.activate([
      passportPhotoImageView.topAnchor.constraint(equalTo: addImageView.topAnchor),
      passportPhotoImageView.leadingAnchor.constraint(equalTo: addImageView.leadingAnchor),
      passportPhotoImageView.trailingAnchor.constraint(equalTo: addImageView.trailingAnchor),
      passportPhotoImageView.bottomAnchor.constraint(equalTo: addImageView.bottomAnchor)
    ])
  }
  
  fileprivate func setupButtonView() {
    stackView.addRow(viewSummaryButton)
  }
  


}

