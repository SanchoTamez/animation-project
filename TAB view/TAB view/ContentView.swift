//
//  ContentView.swift
//  TAB view
//
//  Created by Tamez, Elan - Student on 9/29/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .tabItem {
                    Image(systemName: "plus")
                    Text("tab 1")
                    
                }
            SwiftUIView()
                .tabItem {
                    Image(systemName: "pencil")
                    Text("tab 2")
                    
                }
            SwiftUIView2()
                .tabItem {
                    Image(systemName: "paperplane")
                    Text("tab 3")
                    
                    
                }
        }
      //  .padding()
    }
}

#Preview {
    ContentView()
}
