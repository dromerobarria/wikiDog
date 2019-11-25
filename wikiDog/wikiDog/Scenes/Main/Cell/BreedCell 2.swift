
//
//  BreedCell.swift
//  wikiDog
//
//  Created by Daniel Romero on 25-11-19.
//  Copyright © 2019 Dromero. All rights reserved.
//

import Foundation
import UIKit

class BreedCell: UITableViewCell {
  
  @IBOutlet weak var mainView: UIView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var detailLabel: UILabel!


  var breed: Breeds?{
    willSet(newValue){
      self.breed = newValue
    }
    didSet{
      self.configurateCell()
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  func configurateCell(){
    
    
    self.backgroundColor = .clear
    
    self.mainView.backgroundColor = .white
    self.mainView.layer.borderWidth = 1
    //self.mainView.layer.borderColor = .black
    self.mainView.layer.cornerRadius = 8
    
    self.titleLabel.textColor = .black
    self.titleLabel.text = "🐶 \(breed!.name.uppercased())"
   
    self.detailLabel.textColor = .black
    self.detailLabel.text = Breeds.getTypes(breeds: breed!)
    
    self.detailLabel.isHidden = true
    if breed!.types.count > 0
    {
      self.detailLabel.isHidden = false
    }
  }

}

