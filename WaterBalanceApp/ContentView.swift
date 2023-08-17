//
//  ContentView.swift
//  WaterBalanceApp
//
//  Created by Dinmukhambet Turysbay on 09.04.2023.
//

import SwiftUI

enum TabState{
    case main
    case settings
    case history
}

struct ContentView: View {
    @AppStorage(StorageStates.isOnboardingSeen.rawValue) var isOnboardingSeen: Bool = false
    
    var body: some View {
        if isOnboardingSeen{
            TabView{
                MainPage()
                    .tabItem{
                        Label("Main",systemImage: "house")
                    }
                SettingsPage()
                    .tabItem {
                        Label("Settings",systemImage: "slider.horizontal.3")
                    }

                HistoryPage()
                    .tabItem{
                        Label("History",systemImage: "doc")
                    }
            }
        }else{
            OnboardingView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
