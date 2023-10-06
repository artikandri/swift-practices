//
//  Address.swift
//  IvoryiOS
//
//  Copyright © 2018-present, MNK Group. All rights reserved.
//

import Foundation
import SwiftyJSON

struct AddressPropertyKey{
    static let cityKey = "city"
    static let countryKey = "country"
    static let districtKey = "district"
    static let numberKey = "number"
    static let postalCodeKey = "postalCode"
    static let streetKey = "street"
}


class Address: NSObject, NSCoding{
    
    var city: String
    var country: String
    var district: String
    var number: Int
    var postalCode: String
    var street: String
    
    override init(){
        self.city = ""
        self.country = ""
        self.district = ""
        self.number = -1
        self.postalCode = ""
        self.street = ""
    }
    
    init(city: String, country: String, district: String, number: Int, postalCode: String, street: String) {
        self.city = city
        self.country = country
        self.district = district
        self.number = number
        self.postalCode = postalCode
        self.street = street
    }
    
    required convenience init?(coder decoder: NSCoder){
        let number = decoder.decodeInteger(forKey: AddressPropertyKey.numberKey)
        
        guard let city = decoder.decodeObject(forKey: AddressPropertyKey.cityKey) as? String,
            let country = decoder.decodeObject(forKey: AddressPropertyKey.countryKey) as? String,
            let district = decoder.decodeObject(forKey: AddressPropertyKey.districtKey) as? String,
            let postalCode = decoder.decodeObject(forKey: AddressPropertyKey.postalCodeKey) as? String,
            let street = decoder.decodeObject(forKey: AddressPropertyKey.streetKey) as? String
            else{
                self.init()
                return
        }
        self.init(
            city: city,
            country: country,
            district: district,
            number: number,
            postalCode: postalCode,
            street: street
        )
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(city, forKey: AddressPropertyKey.cityKey)
        aCoder.encode(country, forKey: AddressPropertyKey.countryKey)
        aCoder.encode(district, forKey: AddressPropertyKey.districtKey)
        aCoder.encode(number, forKey: AddressPropertyKey.numberKey)
        aCoder.encode(postalCode, forKey: AddressPropertyKey.postalCodeKey)
        aCoder.encode(street, forKey: AddressPropertyKey.streetKey)
    }
    
    
    func copy(_ address: Address){
        self.city = address.city
        self.country = address.country
        self.district = address.district
        self.number = address.number
        self.postalCode = address.postalCode
        self.street = address.street
    }
    
}

extension Address{
    
    static func decode(_ json: [String: JSON]) -> Address?{
        
        let city = json[AddressPropertyKey.cityKey]?.string ?? ""
        let country = json[AddressPropertyKey.countryKey]?.string ?? ""
        let district = json[AddressPropertyKey.districtKey]?.string ?? ""
        let number = json[AddressPropertyKey.numberKey]?.int ?? -1
        let postalCode = json[AddressPropertyKey.postalCodeKey]?.string ?? ""
        let street = json[AddressPropertyKey.streetKey]?.string ?? ""
        
        return Address(
            city: city,
            country: country,
            district: district,
            number: number,
            postalCode: postalCode,
            street: street
        )
    }
    
}

