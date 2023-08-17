//
//  UserSettings.swift
//  WaterBalanceApp
//
//  Created by Dinmukhambet Turysbay on 27.04.2023.
//

import SwiftUI
import Combine

class UserSettings: ObservableObject {
    @Published var dailyIntake:String {
            didSet {
                UserDefaults.standard.set(dailyIntake, forKey: StorageStates.dailyIntake.rawValue)
            }
        }
    @Published var currentProgress = 0
    
    init() {
        self.dailyIntake = UserDefaults.standard.object(forKey: StorageStates.dailyIntake.rawValue) as? String ?? ""
    }
}

struct WaterConsumingTime{
    let time: String
    let ml: String
    
    init(time: String, ml: String) {
        self.time = time
        self.ml = ml
    }
}

//struct HistoryStorage{
//    @AppStorage(StorageStates.historyArrayDate.rawValue)
//    static var historyArrayDate:[String] = []
//    
//    @AppStorage(StorageStates.historyArrayAmount.rawValue)
//    static var historyArrayAmount:[[WaterConsumingTime]] = [[WaterConsumingTime(time: "", ml: "")]]
//    
//}
