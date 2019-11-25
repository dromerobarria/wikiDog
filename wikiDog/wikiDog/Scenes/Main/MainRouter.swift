//
//  MainRouter.swift
//  wikiDog
//
//  Created by Daniel Romero on 25-11-19.
//  Copyright (c) 2019 Dromero. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol MainRoutingLogic
{
  func routeToDogsImages(segue: UIStoryboardSegue?)
}

protocol MainDataPassing
{
  var dataStore: MainDataStore? { get }
}

class MainRouter: NSObject, MainRoutingLogic, MainDataPassing
{
  weak var viewController: MainViewController?
  var dataStore: MainDataStore?
  
  // MARK: Routing
  
  func routeToDogsImages(segue: UIStoryboardSegue?)
   {
     if let segue = segue {
       let destinationVC = segue.destination as! DogsImagesViewController
       var destinationDS = destinationVC.router!.dataStore!
       passDataToDogsImages(source: dataStore!, destination: &destinationDS)
     } else {
       let storyboard = UIStoryboard(name: "Detail", bundle: nil)
       let destinationVC = storyboard.instantiateViewController(withIdentifier: "DogsImagesViewController") as! DogsImagesViewController
       var destinationDS = destinationVC.router!.dataStore!
       passDataToDogsImages(source: dataStore!, destination: &destinationDS)
       navigateToDogsImages(source: viewController!, destination: destinationVC)
     }
   }

  // MARK: Navigation
  func navigateToDogsImages(source: MainViewController, destination: DogsImagesViewController)
  {
    source.show(destination, sender: nil)
  }
 
  
  // MARK: Passing data
  
  func passDataToDogsImages(source: MainDataStore, destination: inout DogsImagesDataStore)
  {
    destination.name = source.name
  }
}
