//
//  Settings.swift
//  SettingsClone
//
//  Created by Mouli Agastya on 8/27/26.
//

protocol Settings {
    var items: [String: [Setting]] { get }
    static func getSettingsData() -> SettingsModel
}

struct Setting {
    let title: String
    var subtitle: String? = nil
    let icon: String
}

struct SettingsModel: Settings {
    let items: [String: [Setting]]
    
    static func getSettingsData() -> SettingsModel {
        return SettingsModel(items: [
            "section1Data": [
                Setting(title: "Apple Account", subtitle: "Sign in to access your Apple account, iCloud data, Apple services and more", icon: "applelogo")
            ],
            "section2Data": [
                Setting(title: "General", subtitle: "Customize your experience", icon: "gear"),
                Setting(title: "Accessibility", icon: "accessibility"),
                Setting(title: "Action Button", icon: "button.vertical.left.press"),
                Setting(title: "Apple Intelligence and Siri", icon: "siri"),
                Setting(title: "Camera", icon: "camera.shutter.button"),
                Setting(title: "Home Screen & App Library", icon: "house"),
                Setting(title: "Search", icon: "magnifyingglass"),
                Setting(title: "Standby", icon: "eraser"),
            ],
            "section3Data": [
                Setting(title: "Screen Time", icon: "inset.filled.rectangle.and.person.filled"),
                Setting(title: "Camera", icon: "camera.shutter.button"),
                Setting(title: "Home Screen & App Library", icon: "house"),
                Setting(title: "Search", icon: "magnifyingglass"),
                Setting(title: "Standby", icon: "eraser"),
            ]
        ])
    }
}
