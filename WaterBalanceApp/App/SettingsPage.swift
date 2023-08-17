//
//  EditPage.swift
//  WaterBalanceApp
//
//  Created by Dinmukhambet Turysbay on 09.04.2023.
//

import SwiftUI

struct SettingsPage: View {
    @State var changeDailyIntakeSheetShown: Bool = false
    @State var dailyIntake: String
    init(){
        dailyIntake = UserDefaults.standard.object(forKey: StorageStates.dailyIntake.rawValue) as? String ?? ""
    }
    var body: some View {
        VStack{
            CustomTitleBlueText(text: "Edit",size: 17)
                .padding(.bottom,40)
            
            VStack{
                HStack{
                    Text("Daily Intake Level")
                    Spacer()
                    CustomGrayText(text: dailyIntake)
                    CustomGraySystemImage(systemImage: "chevron.right")
                        .onTapGesture {
                            changeDailyIntakeSheetShown = true
                        }
                }
                Divider()
//                HStack{
//                    Text("Your goal")
//                    Spacer()
//                    CustomGraySystemImage(systemImage: "chevron.right")
//                }
//                Divider()
//                HStack{
//                    Text("Reminder")
//                    Spacer()
//                    CustomGraySystemImage(systemImage: "chevron.right")
//                }
//                Divider()
            }
            .sheet(isPresented: $changeDailyIntakeSheetShown, content: {
                ChangeDailyIntakeSheet(changeDailyIntakeShown: $changeDailyIntakeSheetShown)
            })
            .padding()
            Spacer()
        }
    }
}

struct EditPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPage()
    }
}
