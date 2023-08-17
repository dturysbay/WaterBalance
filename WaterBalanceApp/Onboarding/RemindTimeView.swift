//
//  SecondPage.swift
//  WaterBalanceApp
//
//  Created by Dinmukhambet Turysbay on 09.04.2023.
//

import SwiftUI

enum RemindTime:String{
    case fifteenMinues = "15 minutes"
    case thirtyMinutes = "30 minutes"
    case fourtyFiveMinutes = "45 minutes"
    case oneHour = "1 hour"
    case oneHourAndHalf = "1,5 hour"
    case twoHours = "2 hour"
    case twoHoursAndHalf = "2,5 hour"
    case threeHours = "3 hour"
}

struct RemindTimeView: View {
    @Binding var screenState: OnboardingScreenState
    @State var selectedRemindTime: String = RemindTime.fifteenMinues.rawValue
    @AppStorage(StorageStates.remindTime.rawValue) var remindTime: String = ""
    var body: some View {
        VStack{
            Spacer()
            CustomTitleBlueText()
                .padding(.bottom,62)
            CustomBoldBlackText(text: "Remind me each")
                .padding(.bottom,32)
            ZStack{
                CustomBlueRoundedRectangle()
                VStack{
                    Grid(){
                        GridRow(){
                            RemindTimeButton(
                                label: RemindTime.fifteenMinues.rawValue,
                                action: {selectedRemindTime = RemindTime.fifteenMinues.rawValue},
                                isMarked: selectedRemindTime == RemindTime.fifteenMinues.rawValue ? true : false
                            )
                            RemindTimeButton(
                                label: RemindTime.thirtyMinutes.rawValue,
                                action: {selectedRemindTime = RemindTime.thirtyMinutes.rawValue},
                                isMarked: selectedRemindTime == RemindTime.thirtyMinutes.rawValue ? true : false
                            )
                        }
                        GridRow(){
                            RemindTimeButton(
                                label: RemindTime.fourtyFiveMinutes.rawValue,
                                action: {selectedRemindTime = RemindTime.fourtyFiveMinutes.rawValue},
                                isMarked: selectedRemindTime == RemindTime.fourtyFiveMinutes.rawValue ? true : false
                            )
                            RemindTimeButton(
                                label: RemindTime.oneHour.rawValue,
                                action: {selectedRemindTime = RemindTime.oneHour.rawValue},
                                isMarked: selectedRemindTime == RemindTime.oneHour.rawValue ? true : false
                            )
                        }
                        GridRow(){
                            RemindTimeButton(
                                label: RemindTime.oneHourAndHalf.rawValue,
                                action: {selectedRemindTime = RemindTime.oneHourAndHalf.rawValue},
                                isMarked: selectedRemindTime == RemindTime.oneHourAndHalf.rawValue ? true : false
                            )
                            RemindTimeButton(
                                label: RemindTime.twoHours.rawValue,
                                action: {selectedRemindTime = RemindTime.twoHours.rawValue},
                                isMarked: selectedRemindTime == RemindTime.twoHours.rawValue ? true : false
                            )
                        }
                        GridRow(){
                            RemindTimeButton(
                                label: RemindTime.twoHoursAndHalf.rawValue,
                                action: {selectedRemindTime = RemindTime.twoHoursAndHalf.rawValue},
                                isMarked: selectedRemindTime == RemindTime.twoHoursAndHalf.rawValue ? true : false
                            )
                            RemindTimeButton(
                                label: RemindTime.threeHours.rawValue,
                                action: {selectedRemindTime = RemindTime.threeHours.rawValue},
                                isMarked: selectedRemindTime == RemindTime.threeHours.rawValue ? true : false
                            )
                        }
                    }.padding(.trailing,35)
                        .padding(.leading,35)
                }
            }
            Spacer()
            Button(action: {
                UserDefaults.standard.set(remindTime, forKey: StorageStates.remindTime.rawValue)
                screenState = .dailyIntake
            }) {
                CustomBlueButtonBackground(text: "Next")
            }
            .padding(.bottom,50)
        }
    }
}
