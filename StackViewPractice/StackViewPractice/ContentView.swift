//
//  ContentView.swift
//  StackViewDemo
//
//  Created by stud on 29/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    
    var body: some View {
        VStack {
            Text("Instant Developer")
                .fontWeight(.medium)
                .font(.system(size: 40))
                .foregroundColor(.white)
            if verticalSizeClass == .compact {
                Text("Get help from experts in 15 minutes")
                   .foregroundColor(Color.black)
            } else {
                Text("Get help from experts in 15 minutes")
                   .foregroundColor(Color.white)
            }
            HStack {
                Image("student")
                    .resizable()
                    .scaledToFit()
                Image("tutor")
                    .resizable()
                    .scaledToFit()
            }.padding(.horizontal, 20)
            
            Text("Need help with coding problems? Register!")
                .foregroundColor(Color.white)
            
            Spacer()
            
            if verticalSizeClass == .compact {
                HSignUpButtonGroup()
            } else {
                VSignUpButtonGroup()
            }
        }
        .frame(maxWidth: .infinity)
        .background(Image("background").resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0), resizingMode: .stretch)
            .ignoresSafeArea())
    }
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
                .previewDisplayName("iPhone 12 Pro")
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
                .previewDisplayName("iPhone 12 Pro")
                .previewInterfaceOrientation(.landscapeLeft)
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
                .previewDisplayName("iPhone 12 Pro Max")
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPad Air (4th generation)")) }
                .previewDisplayName("iPad Air")

} }

struct VSignUpButtonGroup: View {
    var body: some View {
        VStack {
            Button {
            } label: {
                Text("Sign Up")
            }
            .frame(width: 200)
            .padding()
            .foregroundColor(.white)
            .background(Color.indigo)
            .cornerRadius(10)
            Button {
            } label: {
                Text("Log In")
            }
            .frame(width: 200)
            .padding()
            .foregroundColor(.white)
            .background(Color.gray)
            .cornerRadius(10)
        }
    }
}

struct HSignUpButtonGroup: View {
    var body: some View {
        HStack {
            Button {
            } label: {
                Text("Sign Up")
            }
            .frame(width: 200)
            .padding()
            .foregroundColor(.white)
            .background(Color.indigo)
            .cornerRadius(10)
            Button {
            } label: {
                Text("Log In")
            }
            .frame(width: 200)
            .padding()
            .foregroundColor(.white)
            .background(Color.gray)
            .cornerRadius(10)
        }
    }
}
