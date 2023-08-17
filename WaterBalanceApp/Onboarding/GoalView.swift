//
//  FirstPage.swift
//  WaterBalanceApp
//
//  Created by Dinmukhambet Turysbay on 09.04.2023.
//

import SwiftUI

enum Goals:String{
    case firstGoal = "Goal Number One"
    case secondGoal = "Goal Number Two"
    case thirdGoal = "Goal Number Three"
    case fouthGoal = "Goal Number Four"
}

struct GoalView: View {
    @Binding var screenState: OnboardingScreenState
    @State var selectedId: String = Goals.firstGoal.rawValue
    @AppStorage(StorageStates.goal.rawValue) var goal: String = ""
    var body: some View {
        VStack{
            Spacer()
            CustomTitleBlueText()
                .padding(.bottom,62)
            CustomBoldBlackText(text: "What is your goal?")
                .padding(.bottom,32)
            ZStack{
                CustomBlueRoundedRectangle()
                VStack{
                    ZStack{
                        CustomWhiteRoundedRectangle(leading: 35,trailing: 35,width: 320)
                        RadioButtonField(
                                    id: Goals.firstGoal.rawValue,
                                   label: Goals.firstGoal.rawValue,
                                    isMarked: selectedId == Goals.firstGoal.rawValue ? true : false ,
                                    callback: radioGroupCallback
                               )
                    }
                    ZStack{
                        CustomWhiteRoundedRectangle(leading: 35,trailing: 35,width: 320)
                        RadioButtonField(
                                   id: Goals.secondGoal.rawValue,
                                   label: Goals.secondGoal.rawValue,
                                   isMarked: selectedId == Goals.secondGoal.rawValue ? true : false ,
                                   callback: radioGroupCallback
                               )
                    }
                    ZStack{
                        CustomWhiteRoundedRectangle(leading: 35,trailing: 35,width: 320)
                        RadioButtonField(
                                   id: Goals.thirdGoal.rawValue,
                                   label: Goals.thirdGoal.rawValue,
                                   isMarked: selectedId == Goals.thirdGoal.rawValue ? true : false ,
                                   callback: radioGroupCallback
                               )
                    }
                    ZStack{
                        CustomWhiteRoundedRectangle(leading: 35,trailing: 35,width: 320)
                        RadioButtonField(
                                   id: Goals.fouthGoal.rawValue,
                                   label: Goals.fouthGoal.rawValue,
                                   isMarked:selectedId == Goals.fouthGoal.rawValue ? true : false,
                                   callback: radioGroupCallback
                               )
                    }
                    
                }
            }
            Spacer()
            Button(action: {
                UserDefaults.standard.set(selectedId, forKey: StorageStates.goal.rawValue)
                screenState = .remindTime
            }){
                CustomBlueButtonBackground(text: "Next")
            }
            .padding(.bottom,50)
                
        }
    }
    func radioGroupCallback(id: String) {
        selectedId = id
    }
}
