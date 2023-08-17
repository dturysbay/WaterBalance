//
//  OnboardingView.swift
//  WaterBalanceApp
//
//  Created by Dinmukhambet Turysbay on 26.04.2023.
//

import SwiftUI

enum OnboardingScreenState{
    case goal
    case remindTime
    case dailyIntake
}
struct OnboardingView: View {
    @State var screenState: OnboardingScreenState = .goal
    var body: some View {
        switch screenState {
        case .goal:
            GoalView(screenState: $screenState)
        case .remindTime:
            RemindTimeView(screenState: $screenState)
        case .dailyIntake:
            DailyIntakeView(screenState: $screenState)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
