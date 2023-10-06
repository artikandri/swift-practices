//
//  Cart.swift
//  IvoryiOS
//
//  Copyright © 2018-present, MNK Group. All rights reserved.


import Foundation
import SwiftyJSON


struct CartProductPropertyKey{
    static let productIdKey = "id"
    static let sizeIdKey = "sizeId"
    static let quantityKey = "quantity"
}

class CartProduct: NSObject, NSCoding{
    
    var productId: Int
    var sizeId: Int
    var quantity: Int
    
    override init(){
        self.productId = -1
        self.sizeId = -1
        self.quantity = -1
    }
    
    init(productId: Int, sizeId: Int, quantity: Int){
        self.productId = productId
        self.sizeId = sizeId
        self.quantity = quantity
    }
    
    required convenience init?(coder decoder: NSCoder){
        let productId = decoder.decodeInteger(forKey: CartProductPropertyKey.productIdKey)
        let sizeId = decoder.decodeInteger(forKey: CartProductPropertyKey.sizeIdKey)
        let quantity = decoder.decodeInteger(forKey: CartProductPropertyKey.quantityKey)
        
        self.init(
            productId: productId,
            sizeId: sizeId,
            quantity: quantity
        )
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(productId, forKey: CartProductPropertyKey.productIdKey)
        aCoder.encode(sizeId, forKey: CartProductPropertyKey.sizeIdKey)
        aCoder.encode(quantity, forKey: CartProductPropertyKey.quantityKey)
    }

}

extension CartProduct{
    
    static func decode(_ json: [String: JSON]) -> CartProduct?{
        
        guard let productId = json[CartProductPropertyKey.productIdKey]?.int,
            let sizeId = json[CartProductPropertyKey.sizeIdKey]?.int,
            let quantity = json[CartProductPropertyKey.quantityKey]?.int
            else{
                return nil
        }

        return CartProduct(
            productId: productId,
            sizeId: sizeId,
            quantity: quantity
        )
    }
    
}

//MARK: Current User's Cart

final class CurrentCartList{
    static var sharedInstance: [CartProduct] = []
    
    init(){
        
    }
}

