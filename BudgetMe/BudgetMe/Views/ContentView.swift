//
//  ContentView.swift
//  BudgetMe
//
//  Created by Jake Alvarado on 10/4/23.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    
    var body: some View
    {
        NavigationView {
            if username == "" {
                LoginView()
            }
            else {
                Text("Logged In")
            }
            
        }
    }
}
