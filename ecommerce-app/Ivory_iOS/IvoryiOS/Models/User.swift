//
//  User.swift
//  IvoryiOS
//
//  Copyright © 2018-present, MNK Group. All rights reserved.
//

import Foundation
import SwiftyJSON
import SwiftKeychainWrapper

struct UserPropertyKey{
    static let idKey = "id"
    
    static let addressKey = "address"
    static let firstNameKey = "firstName"
    static let lastNameKey = "lastName"
    static let emailKey = "email"
    static let phoneKey = "phone"
    static let tokenKey = "token"
}


class User: NSObject, NSCoding{
    
    var id: Int
    
    var address: Address
    var firstName: String
    var lastName: String
    var email: String
    var phone: String
    var token: String
    
    
    
    override init(){
        self.id = -1
        
        self.address = Address()
        self.firstName = ""
        self.lastName = ""
        self.email = ""
        self.phone = ""
        self.token = ""
    }
    
    init(id: Int, address: Address, firstName: String, lastName: String, email: String, phone: String, token: String = "") {
        self.id = id
        
        self.address = Address()
        self.address.copy(address)
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phone = phone
        self.token = token
    }
    
    required convenience init?(coder decoder: NSCoder){
        let id = decoder.decodeInteger(forKey: UserPropertyKey.idKey)
        
        let address = decoder.decodeObject(forKey: UserPropertyKey.addressKey) as? Address ?? Address()
        let firstName = decoder.decodeObject(forKey: UserPropertyKey.firstNameKey) as? String ?? ""
        let lastName = decoder.decodeObject(forKey: UserPropertyKey.lastNameKey) as? String ?? ""
        let email = decoder.decodeObject(forKey: UserPropertyKey.emailKey) as? String ?? ""
        let phone = decoder.decodeObject(forKey: UserPropertyKey.phoneKey) as? String ?? ""
        let token = decoder.decodeObject(forKey: UserPropertyKey.tokenKey) as? String ?? ""
        guard id != -1, email != ""
            else{
                self.init()
                return
        }
        self.init(
            id: id,
            address: address,
            firstName: firstName,
            lastName: lastName,
            email: email,
            phone: phone,
            token: token
        )
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: UserPropertyKey.idKey)
        aCoder.encode(address, forKey: UserPropertyKey.addressKey)
        aCoder.encode(firstName, forKey: UserPropertyKey.firstNameKey)
        aCoder.encode(lastName, forKey: UserPropertyKey.lastNameKey)
        aCoder.encode(email, forKey: UserPropertyKey.emailKey)
        aCoder.encode(phone, forKey: UserPropertyKey.phoneKey)
        aCoder.encode(token,forKey: UserPropertyKey.tokenKey)
        
    }
    
    func copy(_ user: User){
        self.id = user.id
        self.firstName = user.firstName
        self.lastName = user.lastName
        self.email = user.email
        self.phone = user.phone
        self.address.copy(user.address)
        self.token = user.token
    }
    
    //checks
    var exists: Bool{
        return self.id != -1
    }
    
}

extension User{
    
    static func setPassword(pass: String, passKey: String){
        _ = KeychainWrapper.standard.set(pass, forKey: passKey)
    }
    
    static func getPassword(passKey: String) -> String{
        if let pass = KeychainWrapper.standard.string(forKey: passKey){
            return pass
        }
        return ""
    }
    
    static func removePassword(passKey: String) -> Bool{
        return KeychainWrapper.standard.removeObject(forKey: passKey)
    }
    
    
    static func decode(_ json: [String: JSON]) -> User?{
        
        var address = Address()
        
        
        
        if !DEMO_DATA {
            if let result =  json["response"]?.dictionary{
                if let addressJSON = result[UserPropertyKey.addressKey]?.dictionary{
                    if let addressDecoded = Address.decode(addressJSON){
                        address = addressDecoded
                    }
                }
                
                
                
                let id = result[UserPropertyKey.idKey]?.int ?? -1
                
                let firstName = result[UserPropertyKey.firstNameKey]?.string ?? ""
                let lastName = result[UserPropertyKey.lastNameKey]?.string ?? ""
                let email = result[UserPropertyKey.emailKey]?.string ?? ""
                let phone = result[UserPropertyKey.phoneKey]?.string ?? ""
                
                guard id != -1, email != ""
                    else{
                        return nil
                }
                
                return User(
                    id: id,
                    address: address,
                    firstName: firstName,
                    lastName: lastName,
                    email: email,
                    phone: phone,
                    
                    token: CurrentUser.sharedInstance.token
                )
            }else{
                return nil
            }
            
        }else {
            if let addressJSON = json[UserPropertyKey.addressKey]?.dictionary,
                let addressDecoded = Address.decode(addressJSON){
                address = addressDecoded
            }
            
            
            
            
            let id = json[UserPropertyKey.idKey]?.int ?? -1
            
            let firstName = json[UserPropertyKey.firstNameKey]?.string ?? ""
            let lastName = json[UserPropertyKey.lastNameKey]?.string ?? ""
            let email = json[UserPropertyKey.emailKey]?.string ?? ""
            let phone = json[UserPropertyKey.phoneKey]?.string ?? ""
            
            guard id != -1, email != ""
                else{
                    return nil
            }
            
            return User(
                id: id,
                address: address,
                firstName: firstName,
                lastName: lastName,
                email: email,
                phone: phone
            )
        }
        
    }
}
//MARK: Current User
final class CurrentUser{
    static var sharedInstance = User()
    
    init(){
    }
}
