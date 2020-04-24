//
//  TabBarController.swift
//  CroesusApp
//
//  Created by Grace Njoroge on 24/04/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
  
  let mainControllerVC = MainViewController()
  let surveyControllerVC = SurveyViewController()
  
  var tabBarImages: [UIImage] = [
    UIImage(named: "userDetails.png")!,
    UIImage(named: "survey.png")!
  ]

  override func viewDidLoad() {
    super.viewDidLoad()
    setupChildViewControllers()
    
  }
  
  fileprivate func setupChildViewControllers() {
    mainControllerVC.tabBarItem = UITabBarItem(
      title: "Account info",
      image: tabBarImages[0].withRenderingMode(UIImage.RenderingMode.alwaysOriginal),
      selectedImage: tabBarImages[0]
    )
    
    surveyControllerVC.tabBarItem = UITabBarItem(
      title: "Fill survey",
      image: tabBarImages[1].withRenderingMode(UIImage.RenderingMode.alwaysOriginal),
      selectedImage: tabBarImages[1]
    )
    
    viewControllers = [ mainControllerVC, surveyControllerVC].map {
      UINavigationController(rootViewController: $0)
    }
  }

}
