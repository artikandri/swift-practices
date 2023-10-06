//
//  Order.swift
//  IvoryiOS
//
//  Copyright © 2018-present, MNK Group. All rights reserved.
//

import Foundation
import SwiftyJSON

struct OrderPropertyKey{
    static let addressKey = "address"
    static let contactKey = "contact"
    static let userIdKey = "user_id"
    static let cardKey = "card"
    static let itemsKey = "items"
    static let amountKey = "amount"
    static let paymentMethodKey = "method"
    static let confirmationKey = "confirmation"
    static let tokenKey = "token"
    static let couponCodeKey = "couponCode"
}

class Order{
    var address: Address
    var card: CreditCard
    var items: [CartProduct]
    var amount: Double
    var paymentMethod: PaymentMethod
    var confirmation: [AnyHashable: Any]
    var userId: Int
    var contact: User
    var token:  String
    var couponCode: String
    
    init(){
        self.address = Address()
        self.card = CreditCard()
        self.items = []
        self.amount = 0.0
        self.paymentMethod = .noPayment
        self.confirmation = [:]
        self.userId = -1
        self.contact = User()
        self.token = ""
        self.couponCode = ""
    }
    
}

