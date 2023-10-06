//
//  AppDelegateExtension.swift
//  IvoryiOS
//
//  Copyright © 2018-present, MNK Group. All rights reserved.
//

import Foundation
import Stripe
import UIKit

extension AppDelegate{
    
    func setPayPal(){
          PayPalMobile.initializeWithClientIds(forEnvironments: [PayPalEnvironmentProduction: PAYPAL_CLIENT_ID_PRODUCTION, PayPalEnvironmentSandbox: PAYPAL_CLIENT_ID_SANDBOX])
    }
    
    func setStripe(){
        STPPaymentConfiguration.shared().publishableKey = STRIPE_PUBLISHABLE_KEY
    }

}
