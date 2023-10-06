//
//  ContentView.swift
//  FoodPin
//
//  Created by stud on 12/04/2023.
//

import SwiftUI

struct RestaurantListView: View {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery"
    , "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional",
    "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkee", "posatelier", "bourkestreetbakery", "haigh", "palomino", "upstate", "traif", "graham", "waffleandwolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "cask"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney","New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian/ Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee &Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var body: some View {
        List {
            ForEach(restaurantNames.indices, id: \.self) { index in
            
            HStack(alignment: .top, spacing: 20){
                Image(restaurantImages[index])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame( height: 118)
                    .cornerRadius(20) }
                
                
            VStack(alignment: .leading) {
                Text(restaurantNames[index])
                
                Text(restaurantLocations[index])                .font(.system(.body, design: .rounded))
                    Text(restaurantTypes[index])
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.gray)            }                .font(.system(.title2, design: .rounded))
           
            
        }
            .listRowSeparator(.hidden)
        }        .listStyle(.plain)
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        
        RestaurantListView()
            .preferredColorScheme(.dark)
        
    }
}
