//
//  Breeds.swift
//  wikiDog
//
//  Created by Daniel Romero on 25-11-19.
//  Copyright © 2019 Dromero. All rights reserved.
//

import UIKit
import RealmSwift


class Breeds: Object
{

  @objc dynamic var name = ""
  var images = List<BImages>()
  var types = List<BreedTypes>()
  
  override static func primaryKey() -> String?
  {
    return "name"
  }
  
 
}

extension Breeds
{
  
  func save()
  {
    let realm = try! Realm()
    try! realm.write
    {
      realm.add(self)
    }
  }
  
  class func all() -> Results<Breeds>
  {
    let realm = try! Realm()
    return realm.objects(Breeds.self)
  }
  
  func delete()
  {
    let realm = try! Realm()
    try! realm.write {
      realm.delete(self)
    }
  }
  
  class func query(name: String) -> Breeds
  {
    let realm = try! Realm()
    let breed = realm.objects(Breeds.self).filter("name == %@",name).first
    return breed!
  }
  
  
  class func getTypes(breeds: Breeds) -> String
  {
    var types = "\(Constants.Messages.General.subTitle):"
    
    for (index,typeValue) in breeds.types.enumerated()
      {
        
        if index == 0
        {
          types = types + "🐕" + typeValue.type
        }else
        {
          types = types + "- 🐕" + typeValue.type
        }
      }
     return types
  }
  
  class func updateBreeds(breeds: NSDictionary)
  {
     
     let realm = try! Realm()
     let breedsDB = realm.objects(Breeds.self)
     try! realm.write
     {
       realm.delete(breedsDB)
     }
     
     for breed in breeds
     {
        let breedDB = Breeds()
        breedDB.name = breed.key as! String
        let types = breed.value as! NSArray
      
        for type in types
        {
          let typeString =  type as? String ?? "NoN"
          
          let breedType = BreedTypes()
          breedType.type = typeString
          breedDB.types.append(breedType)
        }
        breedDB.save()
     }
  }
  
  
  func addImage(link: String)
  {
    
    let realm = try! Realm()
    do {
      try realm.write(
      {
        let image = BImages()
        image.link = link
        self.images.append(image)
      })
    }catch let error
    {
      print(error)
    }
  }
}



class BImages: Object
{
  
  @objc dynamic var link = ""
  
  override static func primaryKey() -> String?
  {
    return "link"
  }
  
}

extension BImages
{
  class func updateImagesBreeds(breed: Breeds,images:NSArray)
  {
     let realm = try! Realm()
     let ofImages = realm.objects(BImages.self)
     try! realm.write
     {
       realm.delete(ofImages)
     }
    
     for image in images
     {
       breed.addImage(link: image as! String)
     }
    
  }

}


class BreedTypes: Object
{
  @objc dynamic var type = ""
  @objc dynamic var remoteID = UUID().uuidString
  
  override static func primaryKey() -> String?
  {
    return "remoteID"
  }
  
}
