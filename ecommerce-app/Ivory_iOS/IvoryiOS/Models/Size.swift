//
//  Size.swift
//  IvoryiOS
//
//  Copyright © 2018-present, MNK Group. All rights reserved.
//

import Foundation
import SwiftyJSON

struct SizePropertyKey{
    static let idKey = "id"
    static let nameKey = "name"
    static let quantityKey = "quantity"
}


class Size: NSObject, NSCoding{
    
    var id: Int
    var name: String
    var quantity: Int
    
    override init(){
        self.id = -1
        self.name = ""
        self.quantity = 0
    }
    
    init(id: Int, name: String, quantity: Int) {
        self.id = id
        self.name = name
        self.quantity = quantity
    }
    
    required convenience init?(coder decoder: NSCoder){
        let id = decoder.decodeInteger(forKey: SizePropertyKey.idKey)
        let quantity = decoder.decodeInteger(forKey: SizePropertyKey.quantityKey)
        
        guard let name = decoder.decodeObject(forKey: SizePropertyKey.nameKey) as? String
            else{
                self.init()
                return
        }
        self.init(
            id: id,
            name: name,
            quantity: quantity
        )
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: SizePropertyKey.idKey)
        aCoder.encode(name, forKey: SizePropertyKey.nameKey)
        aCoder.encode(quantity, forKey: SizePropertyKey.quantityKey)
    }
    
}

extension Size{
    
    static func decode(_ json: [String: JSON]) -> Size?{
        
        guard let id = json[SizePropertyKey.idKey]?.int,
            let name = json[SizePropertyKey.nameKey]?.string,
            let quantity = json[SizePropertyKey.quantityKey]?.int
            else{
                return nil
        }

        return Size(
            id: id,
            name: name,
            quantity: quantity
        )
    }

}
