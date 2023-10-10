//
//  BudgetMeApp.swift
//  BudgetMe
//
//  Created by Jake Alvarado on 10/4/23.
//
import RealmSwift
import SwiftUI

let realmApp = RealmSwift.App(id: "budgetme-kxseg")

@main
struct BudgetMeApp: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
