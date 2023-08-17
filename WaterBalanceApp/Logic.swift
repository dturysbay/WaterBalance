//
//  Logic.swift
//  WaterBalanceApp
//
//  Created by Dinmukhambet Turysbay on 26.04.2023.
//

import SwiftUI

enum StorageStates:String {
    case isOnboardingSeen
    case goal
    case remindTime
    case dailyIntake
    case currentProgressPercent
    case currentConsumedWaterAmount
    case progress
    case historyArrayDate
    case historyArrayAmount
}

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

extension Color{
    static let customSecondaryBlue = Color(red: 0.833, green: 0.882, blue: 0.972)
    static let titleBlueForeground = Color(red: 0.02, green: 0.647, blue: 0.937)
    static let customPrimaryBlack = Color(red: 0.185, green: 0.183, blue: 0.201)
    static let customPrimaryBlue = Color(red: 0.094, green: 0.408, blue: 0.992)
    static let customWaveBlue = Color(red: 0.094, green: 0.669, blue: 0.992)
    static let customWaveLightBlue = Color(red: 0.454, green: 0.761, blue: 0.935)
}

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}
extension Dictionary: RawRepresentable where Key == String, Value == String {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),  // convert from String to Data
            let result = try? JSONDecoder().decode([String:String].self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),   // data is  Data type
              let result = String(data: data, encoding: .utf8) // coerce NSData to String
        else {
            return "{}"  // empty Dictionary resprenseted as String
        }
        return result
    }

}

@propertyWrapper
struct DictionaryDefaults: DynamicProperty {
    private let key: String
    private let userDefaults: UserDefaults

    @State private var dictionary: [String: Any] {
        didSet {
            userDefaults.set(dictionary, forKey: key)
        }
    }

    var wrappedValue: [String: Any] {
        get {
            dictionary
        }

        nonmutating set {
            dictionary = newValue
        }
    }

    var projectedValue: Binding<[String: Any]> {
        Binding {
            wrappedValue
        } set: { newValue in
            wrappedValue = newValue
        }
    }

    init(wrappedValue defaultValue: [String: Any], key: String, suiteName: String? = nil) {
        self.key = key

        userDefaults = UserDefaults(suiteName: suiteName)!

        let dict = userDefaults.dictionary(forKey: key)
        if let dict {
            dictionary = dict
        } else {
            userDefaults.set(defaultValue, forKey: key)
            dictionary = defaultValue
        }
    }
}


