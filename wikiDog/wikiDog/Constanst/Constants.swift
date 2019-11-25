//
//  Constants.swift
//  wikiDog
//
//  Created by Daniel Romero on 25-11-19.
//  Copyright © 2019 Dromero. All rights reserved.
//


import Foundation
import UIKit

struct Constants
{
  struct Sizes {
    static let small:Float = 13.0
    static let medium:Float = 18.0
    static let large:Float = 22.0
  }
  
  /// Images used in the App.
  struct Images
  {
     static let ic_asset_icon = UIImage(named: "ic_asset_icon")
  }
  
  /// Colors used in the App.
  struct Colors
  {
    static let backgroundColor = UIColor(red: 247/255, green: 2/255, blue: 102/255, alpha: 1.0)
    static let splashColor = UIColor(red: 247/255, green: 2/255, blue: 102/255, alpha: 1.0)
  }
  
  /// Messages used in the App.
  struct Messages
  {
    struct Alert
    {
       static let okLabel = NSLocalizedString("OK", comment: "")
       static let cancelText = NSLocalizedString("Cancelar", comment: "")
    }
    
    struct General
    {
      static let navTitle = NSLocalizedString("RAZAS", comment: "")
      static let navTextFirst = NSLocalizedString("WIKI", comment: "")
      static let navTextLast = NSLocalizedString("DOGS", comment: "")
    }
    
    struct Api {
      static let internetText = NSLocalizedString("Sin conexión a Internet.", comment: "")
      static let serverErrorText = NSLocalizedString("Lo sentimos ha ocurrido un error con el servidor.", comment: "")
    }
  }
}

/// Constants used in Api calls.
struct Api
{
  struct Server
  {
    ///True Development
    ///False Production
    static let debugURL = true

   
    /// URL base.
    static let baseURL = "http://dog.ceo" // Production
    static let testUrl = "http://dog.ceo" // Developer
    static let version = "/api"
  }
}

struct Config
{
  static var local = true
  static var versionApp = "v1.0.0"
  static var versionDevApp = "v1.0.0 Dev."
}

enum HTTPHeaderField: String
{
  case authentication = "Authorization"
  case contentType = "Content-Type"
  case acceptType = "Accept"
  case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String
{
  case json = "application/json"
}
