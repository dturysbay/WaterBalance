//
//  ThirdPage.swift
//  WaterBalanceApp
//
//  Created by Dinmukhambet Turysbay on 09.04.2023.
//

import SwiftUI

struct DailyIntakeView: View {
    
    @Binding var screenState: OnboardingScreenState
    @State private var ml: String = ""
    @AppStorage(StorageStates.dailyIntake.rawValue) var dailyIntake: String = ""
    
    var body: some View {
        VStack{
            CustomTitleBlueText()
                .padding(.top,80)
            Spacer()
            CustomBoldBlackText(text: "Daily intake?")
                .padding(.bottom,32)
            ZStack{
                CustomBlueRoundedRectangle(height: 108)
                HStack{
                    ZStack{
                        CustomWhiteRoundedRectangle(width: 250)
                        TextField("ml", text: $ml)
                            .background(Color.white)
                            .frame(width: 100,height: 60)
                            .padding(.leading,30)
                            .foregroundColor(.blue)
                            .accentColor(.blue)
                            .keyboardType(.numberPad)
                    }
                    Text("ML")
                }
            }
            Spacer()
            Button(action: {
                if(ml != ""){
                    UserDefaults.standard.set(true, forKey: StorageStates.isOnboardingSeen.rawValue)
                    UserDefaults.standard.set(ml,forKey: StorageStates.dailyIntake.rawValue)
                }
            }) {
                CustomBlueButtonBackground(text: "Save")
            }
            .padding(.bottom,50)
        }
    }
}
