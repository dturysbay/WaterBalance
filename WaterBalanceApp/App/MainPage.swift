//
//  MainFirstPage.swift
//  WaterBalanceApp
//
//  Created by Dinmukhambet Turysbay on 09.04.2023.
//

import SwiftUI

struct MainPage: View {
    
    @StateObject var userSettings = UserSettings()
    @State var phase: CGFloat = 0
    @State var progress: CGFloat
    @State var consumedWaterAmount:Double
    @State var flag = true
    
//    @DictionaryDefaults(key: StorageStates.historyDictionary.rawValue)
//    private var myDictionary = [String: [WaterConsumingTime]]()
    
//    private var keys: [String] {
//        get {
//            myDictionary.keys.map { $0 }
//        }
//    }
    
    init(){
        self.consumedWaterAmount = UserDefaults.standard.object(forKey: StorageStates.currentConsumedWaterAmount.rawValue) as? Double ?? 0
        self.progress =  UserDefaults.standard.object(forKey: StorageStates.progress.rawValue) as? CGFloat ?? 0
    }
    
    var body: some View {
        VStack{
            CustomTitleBlueText(size: 17)
            Spacer()
            ZStack{
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(LinearGradient(gradient: Gradient(colors: [.blue,.white]), startPoint: .top, endPoint: .bottom))
                    .frame(height: 330)
                    .padding(.leading,16)
                    .padding(.trailing,16)
                    .opacity(0.3)
                
                VStack{
                    WaterWaveView(
                        progress: $progress,
                        phase: $phase,
                        consumedWaterAmount: $consumedWaterAmount
                    )
                    .padding(.bottom,56)
                    CurrentDate()
                }
            }
            Group{
                if(consumedWaterAmount == 0){
                    CustomBoldBlackText(text:"Add your first drink for today")
                }else{
                    CustomBoldBlackText(text: "Great job")
                }
            }
                .multilineTextAlignment(.center)
                .padding(.top,20)
                .padding(.bottom,100)
            Spacer()
            Button{
                if flag{
                    dailyProgress()
//                    addDataToHistory()
                }
            }label: {
                CustomBlueButtonBackground(text: "Add")
            }
            .padding(.bottom,30)
        }
        .environmentObject(userSettings)
    }
    
    private func dailyProgress(){
        phase = 0
        if(consumedWaterAmount+200 < Double(userSettings.dailyIntake)!){
            progress += 200/Double(userSettings.dailyIntake)!
            consumedWaterAmount += 200
        }else{
            progress += (Double(userSettings.dailyIntake)!-consumedWaterAmount)/Double(userSettings.dailyIntake)!
            consumedWaterAmount += Double(userSettings.dailyIntake)!-consumedWaterAmount
            flag = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.phase = .pi * 2
        }
        UserDefaults.standard.set(consumedWaterAmount, forKey: StorageStates.currentConsumedWaterAmount.rawValue)
        UserDefaults.standard.set(progress, forKey: StorageStates.progress.rawValue)
    }
    
    private func getDate()-> String{
        let date = Date()
        let df = DateFormatter()
        df.dateStyle = DateFormatter.Style.short
//        df.dateFormat = "dd/mm/yyyy"
//        df.timeStyle = DateFormatter.Style.short
        return "\(df.string(from: date))"
    }
    
//    private func addDataToHistory(){
//        myDictionary["string"]?.append(WaterConsumingTime(time: "12:38", ml:"200ml"))
//        for key in keys{
//            print("smt",key)
//        }
//
//        print("key",myDictionary)
//    }
}

struct MainFirstPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
