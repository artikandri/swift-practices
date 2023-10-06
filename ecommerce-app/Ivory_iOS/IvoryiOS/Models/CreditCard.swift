//
//  CreditCard.swift
//  IvoryiOS
//
//  Copyright © 2018-present, MNK Group. All rights reserved.
//

import Foundation
import SwiftyJSON


struct CreditCardPropertyKey{
    static let cardNumberKey = "cardNumber"
    static let csvCodeKey = "csvCode"
    static let expMonthKey = "expMonth"
    static let expYearKey = "expYear"
    static let cardHolderKey = "cardHolder"
}

class CreditCard: NSObject, NSCoding {
    
    var cardNumber: String
    var csvCode: String
    var expMonth: Int
    var expYear: Int
    var cardHolder: String
    
    override init() {
        self.cardNumber = ""
        self.csvCode = ""
        self.expMonth = -1
        self.expYear = -1
        self.cardHolder = ""
    }
    
    init(cardNumber: String, csvCode: String, expMonth: Int, expYear: Int, cardHolder: String) {
        self.cardNumber = cardNumber
        self.csvCode = csvCode
        self.expMonth = expMonth
        self.expYear = expYear
        self.cardHolder = cardHolder
    }
    
    required convenience init?(coder decoder: NSCoder){
        let expMonth = decoder.decodeInteger(forKey: CreditCardPropertyKey.expMonthKey)
        let expYear = decoder.decodeInteger(forKey: CreditCardPropertyKey.expYearKey)
        
        guard let cardNumber = decoder.decodeObject(forKey: CreditCardPropertyKey.cardNumberKey) as? String,
            let cardHolder = decoder.decodeObject(forKey: CreditCardPropertyKey.cardHolderKey) as? String,
           let csvCode = decoder.decodeObject(forKey: CreditCardPropertyKey.csvCodeKey) as? String
        else {
            self.init()
            return
        }
        
        self.init(
            cardNumber: cardNumber,
            csvCode: csvCode,
            expMonth: expMonth,
            expYear: expYear,
            cardHolder: cardHolder
        )
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(cardNumber, forKey: CreditCardPropertyKey.cardNumberKey)
        aCoder.encode(csvCode, forKey: CreditCardPropertyKey.csvCodeKey)
        aCoder.encode(expMonth, forKey: CreditCardPropertyKey.expMonthKey)
        aCoder.encode(expYear, forKey: CreditCardPropertyKey.expYearKey)
        aCoder.encode(cardHolder, forKey: CreditCardPropertyKey.cardHolderKey)
    }
    
    
    func copy(_ creditCard: CreditCard){
        self.cardNumber = creditCard.cardNumber
        self.csvCode = creditCard.csvCode
        self.expMonth = creditCard.expMonth
        self.expYear = creditCard.expYear
        self.cardHolder = creditCard.cardHolder
    }
}


extension CreditCard {
    
    
    static func decode(_ json: [String: JSON]) -> CreditCard? {
    
        let cardNumber = json[CreditCardPropertyKey.cardNumberKey]?.string ?? ""
        let csvCode = json[CreditCardPropertyKey.csvCodeKey]?.string ?? ""
        let expMonth = json[CreditCardPropertyKey.expMonthKey]?.int ?? -1
        let expYear = json[CreditCardPropertyKey.expYearKey]?.int ?? -1
        let cardHolder = json[CreditCardPropertyKey.cardHolderKey]?.string ?? ""
       

        return CreditCard(
            cardNumber: cardNumber,
            csvCode: csvCode,
            expMonth: expMonth,
            expYear: expYear,
            cardHolder: cardHolder
        )
    }
    
    func isCompleted() -> Bool {
        if self.cardHolder != "" &&
            self.cardNumber != "" &&
            self.csvCode != "" &&
            self.expYear != -1 &&
            self.expMonth != -1 {
            return true
        }
        return false
    }

}



