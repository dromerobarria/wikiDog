//
//  DogsImagesPresenter.swift
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

protocol DogsImagesPresentationLogic
{
  func presentImagesDogs(response: DogsImages.Images.Response)
}

class DogsImagesPresenter: DogsImagesPresentationLogic
{
  weak var viewController: DogsImagesDisplayLogic?
  
  func presentImagesDogs(response: DogsImages.Images.Response)
  {
    
    let isError = response.isError
    let breed = response.breed
    let message = response.message
    
    switch isError {
    case true:
      let viewModel = DogsImages.Images.ViewModel(message: message, breed: breed)
      viewController?.errorImagesDogs(viewModel: viewModel)
    default:
      let viewModel = DogsImages.Images.ViewModel(message: message, breed: breed)
      viewController?.successImagesDogs(viewModel: viewModel)
    }
  }
}
