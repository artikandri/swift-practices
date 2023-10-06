//
//  WishList.swift
//  IvoryiOS
//
//  Copyright © 2018-present, MNK Group. All rights reserved.
//

import Foundation
import SwiftyJSON

struct WishListPropertyKey{
    static let userIdKey = "id"
    static let productsKey = "products"
}

class WishList: NSObject, NSCoding{
    
    var userId: Int
    var products: [Int]
    
    override init(){
        self.userId = -1
        self.products = []
    }
    
    init(userId: Int, products: [Int]){
        self.userId = userId
        self.products = products
    }
    
    required convenience init?(coder decoder: NSCoder){
        let userId = decoder.decodeInteger(forKey: WishListPropertyKey.userIdKey)
        let products = decoder.decodeObject(forKey: WishListPropertyKey.productsKey) as? [Int] ?? []
        
        self.init(
            userId: userId,
            products: products
        )
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(userId, forKey: WishListPropertyKey.userIdKey)
        aCoder.encode(products, forKey: WishListPropertyKey.productsKey)
    }
    
   
    
}

extension WishList{
    
    static func decode(_ json: [String: JSON]) -> WishList?{
        
        var products: [Int] = []
        if let productsArray = json[WishListPropertyKey.productsKey]?.array{
            for productObj in productsArray{
                if let product = productObj.int{
                    products.append(product)
                }
            }
        }
        
        let userId = json[WishListPropertyKey.userIdKey]?.int ?? -1
        
        return WishList(
            userId: userId,
            products: products
        )
    }
    
}

//MARK: Current User's Wishlist

final class CurrentWishlist{
    static var sharedInstance = WishList()
    
    init(){
        
    }
}
