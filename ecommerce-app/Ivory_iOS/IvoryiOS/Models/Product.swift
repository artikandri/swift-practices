//
//  Product.swift
//  IvoryiOS
//
//  Copyright © 2018-present, MNK Group. All rights reserved.
//

import Foundation
import SwiftyJSON

enum Gender: String{
    case all = "All"
    case men = "Men"
    case women = "Women"
    case kids = "Kids"
}

enum SortType: String{
    case newest = "newest"
    case oldest = "oldest"
    case priceUp = "priceUp"
    case priceDown = "priceDown"
}

enum Category: String{
    case all = "All"
    case clothes = "Clothes"
    case shoes = "Shoes"
    case other = "Other"
}



struct ProductPropertyKey{
    static let idKey = "productId"
    
    static let addedDateKey = "productAddedDate"
    static let categoryKey = "productCategory"
    static let colorKey = "productColor"
    static let genderKey = "productGender"
    static let imageKey = "productImage"
    static let nameKey = "productName"
    static let priceKey = "productPrice"
    static let sibilingsKey = "sibilings"
    static let sizesKey = "sizes"
}

class Product: NSObject, NSCoding{
    
    var id: Int
    
    var addedDate: String
    var category: String
    var color: String
    var gender: String
    var image: String
    var name: String
    var price: Double
    var sibilings: [Int]
    var sizes: [Size]
    
    
    override init(){
        self.id = -1
        
        self.addedDate = ""
        self.category = ""
        self.color = ""
        self.gender = ""
        self.image = ""
        self.name = ""
        self.price = -1
        self.sibilings = []
        self.sizes = []
    }
    
    init(id: Int, addedDate: String, category: String, color: String, gender: String, image: String, name: String, price: Double, sibilings: [Int], sizes: [Size]) {
        
        self.id = id
        
        self.addedDate = addedDate
        self.category = category
        self.color = color
        self.gender = gender
        self.image = image
        self.name = name
        self.price = price
        self.sibilings = sibilings
        self.sizes = sizes
    }
    
    required convenience init?(coder decoder: NSCoder){
        let id = decoder.decodeInteger(forKey: ProductPropertyKey.idKey)
        
        let price = decoder.decodeDouble(forKey: ProductPropertyKey.priceKey)
        
        guard let addedDate = decoder.decodeObject(forKey: ProductPropertyKey.addedDateKey) as? String,
            let category = decoder.decodeObject(forKey: ProductPropertyKey.categoryKey) as? String,
            let color = decoder.decodeObject(forKey: ProductPropertyKey.colorKey) as? String,
            let gender = decoder.decodeObject(forKey: ProductPropertyKey.genderKey) as? String,
            let image = decoder.decodeObject(forKey: ProductPropertyKey.imageKey) as? String,
            let name = decoder.decodeObject(forKey: ProductPropertyKey.nameKey) as? String,
            let sibilings = decoder.decodeObject(forKey: ProductPropertyKey.sibilingsKey) as? [Int],
            let sizes = decoder.decodeObject(forKey: ProductPropertyKey.sizesKey) as? [Size]
            else{
                self.init()
                return
        }
        
        self.init(
            id: id,
            addedDate: addedDate,
            category: category,
            color: color,
            gender: gender,
            image: image,
            name: name,
            price: price,
            sibilings: sibilings,
            sizes: sizes
        )
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: ProductPropertyKey.idKey)
        aCoder.encode(addedDate, forKey: ProductPropertyKey.addedDateKey)
        aCoder.encode(category, forKey: ProductPropertyKey.categoryKey)
        aCoder.encode(color, forKey: ProductPropertyKey.colorKey)
        aCoder.encode(gender, forKey: ProductPropertyKey.genderKey)
        aCoder.encode(image, forKey: ProductPropertyKey.imageKey)
        aCoder.encode(name, forKey: SizePropertyKey.nameKey)
        aCoder.encode(price, forKey: ProductPropertyKey.priceKey)
        aCoder.encode(sibilings, forKey: ProductPropertyKey.sibilingsKey)
        aCoder.encode(sizes, forKey: ProductPropertyKey.sizesKey)
    }
    
}

extension Product{
    
    static func decode(_ json: [String: JSON]) -> Product?{
        
        var sizes: [Size] = []
        if let sizesArray = json[ProductPropertyKey.sizesKey]?.array{
            for sizeObj in sizesArray{
                if let sizeDict = sizeObj.dictionary,
                    let size = Size.decode(sizeDict){
                    sizes.append(size)
                }
            }
        }
        
        var sibilings: [Int] = []
        if let sibilingsArray = json[ProductPropertyKey.sibilingsKey]?.array{
            for sibilingObj in sibilingsArray{
                if let sibilingString = sibilingObj.string{
                    if let sibiling = Int(sibilingString){
                        sibilings.append(sibiling)
                    }
                }
            }
        }
        
        guard let id = json[ProductPropertyKey.idKey]?.int,
            let addedDate = json[ProductPropertyKey.addedDateKey]?.string,
            let category = json[ProductPropertyKey.categoryKey]?.string,
            let color = json[ProductPropertyKey.colorKey]?.string,
            let gender = json[ProductPropertyKey.genderKey]?.string,
            let image = json[ProductPropertyKey.imageKey]?.string,
            let name = json[ProductPropertyKey.nameKey]?.string,
            let price =  json[ProductPropertyKey.priceKey]?.double
            else{
                return nil
        }
        
        return Product(
            id: id,
            addedDate: addedDate,
            category: category,
            color: color,
            gender: gender,
            image: image,
            name: name,
            price: price,
            sibilings: sibilings,
            sizes: sizes
        )
    }
    
}
