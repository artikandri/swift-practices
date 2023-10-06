//
//  ContentView.swift
//  HelloWorld
//
//  Created by stud on 15/03/2023.
//

import SwiftUI
import AVFoundation


let synthesizer = AVSpeechSynthesizer()

func speak(text: String) {
    let utterance = AVSpeechUtterance(string: text)
    utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
    synthesizer.speak(utterance)
}

struct ContentView: View {
    var body: some View {
        
        VStack {
            Text("Guess these movies")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Text("Can you guess the movie from these emojis? Tap the button to reveal the answer")
                .font(.headline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            Button {
                speak(text: "Home alone")
            } label: {
              Text("🏠👦🏼🥷🏼")
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.yellow)
            .cornerRadius(20)
            Button {
                speak(text: "Tale of Princess Kaguya")
            } label: {
                Text("🌙🎎🎋")
                    .fontWeight(.bold)
                    .font(.system(.title, design: .rounded))
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.purple)
            .cornerRadius(20)
            
            Button {
                speak(text: "Midnight Diner")
            } label: {
                Text("🌌🍜 🍲 🍛")
                    .fontWeight(.bold)
                    .font(.system(.title, design: .rounded))
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.purple)
            .cornerRadius(20)
            
            Button {
                speak(text: "Cat returns")
            } label: {
                Text("😼🪃")
                    .fontWeight(.bold)
                    .font(.system(.title, design: .rounded))
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.purple)
            .cornerRadius(20)
            
            
        }    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
