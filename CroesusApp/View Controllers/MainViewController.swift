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
  
  var idFieldTF: UITextField = {
    let tf = UITextField()
    tf.keyboardType = .numberPad
    tf.translatesAutoresizingMaskIntoConstraints = false
    let attributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]
    tf.attributedPlaceholder = NSAttributedString(string: "ID/Passport number", attributes: attributes)
    return tf
  }()
  
  var idLineView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .lightGray
    return view
  }()

  var passportExpiryTF: UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    let attributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]
    tf.attributedPlaceholder = NSAttributedString(string: "Passport expiry date", attributes: attributes)
    return tf
  }()
  
  var passportLineView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .lightGray
    return view
  }()
  
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
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(UIImage(named: "plusImage"), for: .normal)
    button.addTarget(self, action: #selector(presentCameraSheet), for: .touchUpInside)
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
    button.addTarget(self, action: #selector(showDetailsSummary), for: .touchUpInside)
    button.layer.cornerRadius = 20
    button.clipsToBounds = true
    button.setTitle("Show summary", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .blue
    button.tintColor = .white
    return button
  }()
  
  let regionPicker = RegionPickerView()
  let datePicker = UIDatePicker()
  let toolBar = UIToolbar() //picker toolbar
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "Fill in your details"
  }
  
  override func loadView() {
    super.loadView()
    stackView.hidesSeparatorsByDefault = true
    setupViews()
    showDatePicker()
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
    
    //adding id fields
    stackView.addRows([idFieldTF, idLineView])
    idLineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
    passportLineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
  }
  
  fileprivate func setupPickerToolbar() {
    regionPicker.regionInputField.inputAccessoryView = toolBar

    toolBar.barStyle = UIBarStyle.default
    toolBar.isTranslucent = true
    toolBar.sizeToFit()
    
    let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneClick))
    let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPicker));
    
    toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
    toolBar.isUserInteractionEnabled = true
  }
  
  @objc fileprivate func doneClick() {
    regionPicker.endEditing(true)
  }
  
  fileprivate func setupImageView() {
    stackView.addRows([addImageLabel, addImageView, passportPhotoImageView])
    addImageView.heightAnchor.constraint(equalToConstant: 135).isActive = true
    stackView.addSubview(addImageButton)
    addImageButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    addImageButton.topAnchor.constraint(equalTo: addImageLabel.topAnchor).isActive = true
    addImageButton.rightAnchor.constraint(equalTo: addImageLabel.rightAnchor, constant: -24).isActive = true

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
    viewSummaryButton.heightAnchor.constraint(equalToConstant: 47).isActive = true
  }
  
  @objc fileprivate func showDetailsSummary() {
    guard let firstName = firstNameTF.text, !firstName.isEmpty else {
      let errorPresentor = BasicErrorPresenter.init(message: "Please fill all fields.")
      errorPresentor.present(in: self)
      return
    }
    
    guard let lastName = lastNameTF.text, !lastName.isEmpty else {
      let errorPresentor = BasicErrorPresenter.init(message: "Please fill all fields.")
      errorPresentor.present(in: self)
      return
    }
    guard let idInput = idFieldTF.text, !idInput.isEmpty else {
      let errorPresentor = BasicErrorPresenter.init(message: "Please fill all fields.")
      errorPresentor.present(in: self)
      return
    }
    guard let region = regionPicker.regionInputField.text, !region.isEmpty else {
      let errorPresentor = BasicErrorPresenter.init(message: "Please select a region.")
      errorPresentor.present(in: self)
      return
    }
    guard let passportImage = passportPhotoImageView.image, !(passportImage == nil) else {
      let errorPresentor = BasicErrorPresenter.init(message: "Please add an image.")
      errorPresentor.present(in: self)
      return
    }
    let summaryVC = SummaryViewController(firstName: firstName, lastName: lastName, id: idInput, region: region, photo: passportImage)
    navigationController?.pushViewController(summaryVC, animated: true)
    
  }
  
  func showDatePicker() {
    //Formate Date
    datePicker.datePickerMode = .date
    
    //ToolBar
    let toolbar = UIToolbar();
    toolbar.sizeToFit()
    let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker));
    let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPicker));
    
    toolbar.setItems([doneButton, spaceButton, cancelButton], animated: false)
    
    passportExpiryTF.inputAccessoryView = toolbar
    passportExpiryTF.inputView = datePicker
    
  }
  
  @objc func doneDatePicker() {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    passportExpiryTF.text = formatter.string(from: datePicker.date)
    self.view.endEditing(true)
  }
  
  @objc func cancelPicker() {
    self.view.endEditing(true)
  }
  
  fileprivate func checkIfPassport() {
    let idInput = idFieldTF.text?.lowercased() ?? ""
    if CharacterSet.letters.isSuperset(of: CharacterSet(charactersIn: idInput)) {
      stackView.insertRows([passportExpiryTF, passportLineView], after: idLineView)
    }
  }
  
  @objc fileprivate func presentCameraSheet() {
    //present action sheet with upload or take photo
    let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    
    let cameraAction = UIAlertAction(title: "Take a picture", style: .default) { _ in
      self.presentCamera()
    }
    let galleryAction = UIAlertAction(title: "Choose from gallery", style: .default) { _ in
      self.presentGallery()
    }
    let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
    
    optionMenu.addAction(cameraAction)
    optionMenu.addAction(galleryAction)
    optionMenu.addAction(cancelAction)
    
    self.present(optionMenu, animated: true, completion: nil)
  }
  
  fileprivate func presentGallery() {
    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
      let picker = UIImagePickerController()
      picker.delegate = self
      picker.allowsEditing = true
      picker.sourceType = .photoLibrary
      self.present(picker, animated: true, completion: nil)
    }
  }
  
  fileprivate func presentCamera() {
    if UIImagePickerController.isSourceTypeAvailable(.camera){
      let picker = UIImagePickerController()
      picker.delegate = self
      picker.allowsEditing = true
      picker.sourceType = .camera
      self.present(picker, animated: true, completion: nil)
    }
  }
}

extension MainViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
    if let pickedImage = info[.editedImage] as? UIImage {
      passportPhotoImageView.isHidden = false
      passportPhotoImageView.contentMode = .scaleAspectFit
      passportPhotoImageView.image = pickedImage
    } else if let editedImage = info[.editedImage] as? UIImage {
      passportPhotoImageView.isHidden = false
      passportPhotoImageView.contentMode = .scaleAspectFit
      passportPhotoImageView.image = editedImage
    }
    
    dismiss(animated: true, completion: nil)
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true, completion: nil)
  }
}
