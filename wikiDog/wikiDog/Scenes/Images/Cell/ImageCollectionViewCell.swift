//
//  ImageCollectionViewCell.swift
//  wikiDog
//
//  Created by Daniel Romero on 25-11-19.
//  Copyright © 2019 Dromero. All rights reserved.
//

import UIKit
import Kingfisher

class ImageCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var dogImageView: UIImageView!
  
  var link: String?
  {
    willSet(newValue)
    {
      self.link = newValue
    }
    didSet
    {
      self.configurateCell()
    }
  }
  
  func configurateCell()
  {
    let url = URL(string: link!)
    self.dogImageView.kf.setImage(with: url, placeholder: Constants.Images.ic_asset_dogPlaceholder,options: [.transition(.fade(1))])
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
 
}
