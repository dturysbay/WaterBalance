//
//  Components.swift
//  WaterBalanceApp
//
//  Created by Dinmukhambet Turysbay on 09.04.2023.
//

import SwiftUI

struct CustomTitleBlueText:View{
    let text: String
    let size: CGFloat
    init(text: String="WATER BALANCE", size: CGFloat=24) {
        self.text = text
        self.size = size
    }
    var body: some View{
        Text(text)
            .foregroundColor(Color.titleBlueForeground)
            .font(.system(size: size,weight: .heavy))
            .italic()
            .padding(.top,10)
    }
}

struct CustomBoldBlackText: View{
    let text: String
    var body: some View{
        Text(text)
            .foregroundColor(Color.customPrimaryBlack)
            .font(.system(size:36,weight: .bold))
    }
}

struct CustomGrayText: View{
    let text:String
    var body: some View{
        Text(text)
            .foregroundColor(.gray)
    }
}

struct CustomDateText: View{
    let text: String
    var body: some View{
        Text(text).font(.system(size: 20,weight: .medium)).padding(.bottom,19)
    }
}

struct CustomGraySystemImage:View{
    let systemImage: String
    var body: some View{
        Image(systemName: systemImage)
            .foregroundColor(.gray)
    }
}

struct CustomBlueRoundedRectangle: View{
    let height: CGFloat
    init(height: CGFloat=330) {
        self.height = height
    }
    var body: some View{
        RoundedRectangle(cornerRadius: 16, style: .continuous)
            .fill(Color.customSecondaryBlue)
                       .frame(height: height)
                       .padding(.leading,16)
                       .padding(.trailing,16)
    }
}

struct CustomWhiteRoundedRectangle:View{
    let leading: CGFloat
    let trailing: CGFloat
    let width: CGFloat
    init(leading: CGFloat=0, trailing: CGFloat=0,width: CGFloat = 150) {
        self.leading = leading
        self.trailing = trailing
        self.width = width
    }

    var body: some View{
        RoundedRectangle(cornerRadius: 16, style: .continuous)
                       .fill(.white)
                       .frame(width: width,height: 60)
                       .padding(.leading,leading)
                       .padding(.trailing,trailing)
    }
}

struct RadioButtonField: View {
    let id: String
    let label: String
    let size: CGFloat
    let color: Color
    let textSize: CGFloat
    var isMarked:Bool
    let callback: (String)->()
    
    init(
        id: String,
        label:String,
        size: CGFloat = 16,
        color: Color = Color.black,
        textSize: CGFloat = 14,
        isMarked: Bool = false,
        callback: @escaping (String)->()
        ) {
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.textSize = textSize
        self.isMarked = isMarked
        self.callback = callback
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Text(label)
                .foregroundColor(Color.customPrimaryBlack)
                .font(Font.system(size: textSize))
                .padding(.leading,10)
            Spacer()
            Button(action:{ self.callback(self.id)}){
                Image(systemName: self.isMarked ? "largecircle.fill.circle" : "circle")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.size, height: self.size)
                    .padding(.trailing,10)
            }.foregroundColor(Color.blue)
            
        }.foregroundColor(self.color)
            .padding(.leading,59)
            .padding(.trailing,59)
    }
}

struct CustomBlueButtonBackground: View{
    let text: String
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color.customPrimaryBlue)
                           .frame(height: 60)
                           .padding(.leading,16)
                           .padding(.trailing,16)
            Text(text)
                .foregroundColor(.white)
                .font(.system(size: 22,weight: .bold))
        }
        .padding(.horizontal,10)
    }
}


struct RemindTimeButton: View{
    let label: String
    let action: () -> ()
    let isMarked: Bool
    var body: some View{
        Button(action: action) {
            ZStack{
                CustomWhiteRoundedRectangle()
                    .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(isMarked ? Color.customPrimaryBlue : Color.clear, lineWidth: 3)
                            )
                Text(label)
                    .foregroundColor(isMarked ? Color.customPrimaryBlue : Color.customPrimaryBlack)
            }
        }
    }
}

struct CustomTextField: View {
    @Binding var field: String
    let title: String
    
    var body: some View{
        TextField(title, text: $field)
            .padding(.horizontal,11)
            .padding(.leading)
            .background(RoundedRectangle(cornerRadius: 12,style: .continuous)
            .fill(Color(red: 0.949, green: 0.949, blue: 0.933))
            .frame(height: 46))
            .padding(.bottom,16)
    }
}

struct ChangeDailyIntakeSheet: View{
//    @State private var dailyIntake: String = ""
    @State private var ml: String = ""
    @Binding var changeDailyIntakeShown: Bool
    var body: some View{
        VStack{
            HStack {
                Spacer()
                Image("x")
                    .onTapGesture {
                        changeDailyIntakeShown.toggle()
                    }
            }
            .padding(.vertical,22)
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
                    UserDefaults.standard.set(ml,forKey: StorageStates.dailyIntake.rawValue)
                    changeDailyIntakeShown.toggle()
                }
            }) {
                CustomBlueButtonBackground(text: "Save")
                    .presentationDetents([.fraction(0.43)])
                    .presentationDragIndicator(.hidden)
            }
            .padding(.bottom,50)
        }
    }
        
}


struct CurrentDate:View {
    
    var body: some View {
        VStack{
            Text(getCurrentDate())
        }
    }
    func getCurrentDate() -> String{
        let currentDate = Date()

        return "\(currentDate.formatted(.dateTime.day().weekday(.wide).month(.wide)).capitalized)"
    }
}


