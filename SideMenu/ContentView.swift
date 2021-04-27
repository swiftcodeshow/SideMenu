//
//  ContentView.swift
//  SideMenu
//
//  Created by 米国梁 on 2021/4/27.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 1
    
    @State private var showMenu = false
    
    init() {
        // Hide default tab bar, use custom tab bar button instead ...
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            HStack(alignment: .top) {
                VStack(spacing: 20) {
                    Button("Item 1") {
                        selection = 1
                    }
                    .foregroundColor(selection == 1 ? .blue : .white)
                    .background(selection == 1 ? Color.white : Color.clear)
                    Button("Item 2") {
                        selection = 2
                    }
                    .foregroundColor(selection == 2 ? .blue : .white)
                    .background(selection == 2 ? Color.white : Color.clear)
                    Button("Item 3") {
                        selection = 3
                    }
                    .foregroundColor(selection == 3 ? .blue : .white)
                    .background(selection == 3 ? Color.white : Color.clear)
                    Spacer()
                }
                Spacer()
            }
            .padding(.top, 100)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue.ignoresSafeArea())
            .zIndex(0)
            
            TabView(selection: $selection) {

                Text("Page 1")
                    .tag(1)

                Text("Page 2")
                    .tag(2)

                Text("Page 3")
                    .tag(3)
            }
            .offset(x: showMenu ? 150 : 0)
            .zIndex(1)
        }
        // Toggle button on the top-left
        .overlay(Button("Menu Toggle") {
            withAnimation {
                showMenu.toggle()
            }
        }
        .padding()
        .foregroundColor(showMenu ? .white : .black), alignment: .topLeading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
