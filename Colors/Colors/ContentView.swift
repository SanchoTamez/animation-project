//
//  ContentView.swift
//  Colors
//
//  Created by Tamez, Elan - Student on 9/26/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var buttonPressed = false
    @State private var temp: Int = Int.random(in: -20...100)
    @State private var message: String = " "
    
    var body: some View {
        VStack {
            Image(systemName: "cloud.rain")
                .font(.system(size: 100))
                .foregroundStyle(.white)
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Colorado weather")
                .font(.system(size: 25))
                .foregroundStyle(.white)
            Button("set weather") {
                temp = Int.random(in: -20...100)
                message = "The temperature is \(temp) degrees"
                print("\(temp)")
                print(message)
                buttonPressed.toggle()
                    
                
            
                
            }
            .padding(10)
            .background(.orange)
            .cornerRadius(10)
            .foregroundStyle(.white)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [.white, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
        
    
    }
}

#Preview {
    ContentView()
}
