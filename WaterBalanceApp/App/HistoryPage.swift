//
//  HistoryPage.swift
//  WaterBalanceApp
//
//  Created by Dinmukhambet Turysbay on 09.04.2023.
//

import SwiftUI

struct HistoryPage: View {
    var body: some View {
        VStack{
            CustomTitleBlueText(text: "History",size: 17)
                .padding(.bottom,24)
            
            VStack{
                HStack{
                    CustomDateText(text: "Today")
                    Spacer()
                }
                HStack{
                    Text("250 ml")
                    Spacer()
                    CustomGrayText(text: "12:13")
                }
                Divider()
                HStack{
                    Text("200 ml")
                    Spacer()
                    CustomGrayText(text: "14:10")
                }
                Divider()
                HStack{
                    Text("50 ml")
                    Spacer()
                    CustomGrayText(text: "15:13")
                }
                Divider()
                HStack{
                    Text("300 ml")
                    Spacer()
                    CustomGrayText(text: "19:10")
                }
                Divider()
                
            }
            .padding()
            
            VStack{
                HStack{
                    CustomDateText(text: "23.11.21")
                    Spacer()
                }
                HStack{
                    Text("250 ml")
                    Spacer()
                    CustomGrayText(text: "12:13")
                }
                Divider()
                HStack{
                    Text("200 ml")
                    Spacer()
                    CustomGrayText(text: "14:10")
                }
                Divider()
                HStack{
                    Text("50 ml")
                    Spacer()
                    CustomGrayText(text: "15:13")
                }
                Divider()
                HStack{
                    Text("300 ml")
                    Spacer()
                    CustomGrayText(text: "19:10")
                }
                Divider()
                
            }
            .padding()
            Spacer()
        }
    }
}

struct HistoryPage_Previews: PreviewProvider {
    static var previews: some View {
        HistoryPage()
    }
}
