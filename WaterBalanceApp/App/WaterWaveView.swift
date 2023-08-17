//
//  WaterWaveView.swift
//  WaterBalanceApp
//
//  Created by Dinmukhambet Turysbay on 27.04.2023.
//

import SwiftUI

struct WaterWaveView: View {
    
    @Binding var progress: CGFloat
    @Binding var phase: CGFloat
    @Binding var consumedWaterAmount: Double
    @EnvironmentObject var userSettings: UserSettings
    
    var body: some View {
        VStack {
            ZStack{
                Circle()
                    .stroke(.white,lineWidth: 6)
                    .frame(width: 180,height: 180)
                
                WaterWave(progress: self.progress, phase: self.phase)
                    .fill(Color.customWaveLightBlue)
                    .clipShape(Circle())
                    .frame(width: 160, height: 160)
                    .animation(phase == 0 ? .default : Animation.linear(duration: 1).repeatForever(autoreverses: true), value: phase)
                    .animation(.easeIn(duration: 10), value: progress)
                    .onAppear {
                                self.phase = .pi * 2
                    }

                WaterWave(progress: self.progress, phase: self.phase)
                    .fill(Color.customWaveBlue)
                    .clipShape(Circle())
                    .frame(width: 160, height: 160)
                    .animation(phase == 0 ? .default : Animation.linear(duration: 1).repeatForever(autoreverses: false), value: phase)
                    .animation(.easeOut(duration: 0.5), value: progress)
                    .onAppear {
                                self.phase = .pi * 2
                    }
                
                VStack{
                    CustomBoldBlackText(text: "\(getPercent())%")
                    Text("\(String(format: "%.2f", converter(of: consumedWaterAmount))) out of \(String(format: "%.2f", converter(of:Double(userSettings.dailyIntake)!))) L")
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                }
            }
        }
    }
    
    func getPercent() -> Double{
        let value = consumedWaterAmount/Double(userSettings.dailyIntake)! * 100
        return  round(value*10)/10.0
    }
    
//    converts ml to l
    func converter(of volume: Double) -> Double{
        let value = volume * 0.001
        return Double((value * 100)/100.0)
    }
}

struct WaterWave: Shape {
    var progress: CGFloat
    let amplitude: CGFloat = 10
    let waveLength: CGFloat = 20
    var phase: CGFloat

    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get { AnimatablePair(phase, progress) }
        set {
            phase = newValue.first
            progress = newValue.second
        }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let width = rect.width
        let height = rect.height
        let midWidth = width / 2
        let progressHeight = height * (1 - progress)

        path.move(to: CGPoint(x: 0, y: progressHeight))

        for x in stride(from: 0, to: width, by: 10) {
            let relativeX = x/waveLength
            let normalizedLength = (x - midWidth) / midWidth
            let y = progressHeight + sin(phase + relativeX) * amplitude * normalizedLength
            path.addLine(to: CGPoint(x: x, y: y))
        }

        path.addLine(to: CGPoint(x: width, y: progressHeight))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: progressHeight))

        return path
    }
}
