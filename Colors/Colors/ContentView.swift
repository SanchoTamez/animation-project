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
    @State private var icon: String = " "
    
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
                makeMessage()
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
        .sheet(isPresented: $buttonPressed) { [temp, message] in
            
            NavigationStack    {
                
                VStack {
                    Image(systemName: icon)
                        .font(.system(size: 200, design: .rounded))
                    Text("\(temp)")
                        .font(.system(size: 200, design: .rounded))
                    Text(message)
                }
                .navigationTitle(Text("Weather"))
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                            Button("Close") {
                            buttonPressed.toggle()
                        }
                    }
                }
                
            }
            
            
        }
        
    }
    
    func makeMessage() {
        if temp > 90 {
            message = "it is hot"
            icon =  "sun.max"
        } else if temp > 60 {
            message = "it is pleasent"
            icon =  "cloud.sun"
        }else if temp > 32 {
            message = "it is brisk"
            icon =  "wind.snow"
        } else if temp > 0 {
            message = "brr! bundle up!"
            icon =  "cloud.snow"
        }    else {
            message = "you should consider moving!"
            icon =  "tropicalstorm"
        }
        
    }
    
    
    
}

#Preview {
    ContentView()
}
