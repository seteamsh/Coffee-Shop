//
//  Coffee_ShopApp.swift
//  Coffee Shop
//
//  Created by Temirlan Zhumashov on 08.07.2025.
//

import SwiftUI

@main
struct Coffee_ShopApp: App {
    init() {
        NotificationService.shared.scheduleDailyNotification(
            id: "MorningReminder",
            title: "С добрым утром !",
            body: "Начните утро с ароматным коффе",
            hour: 8,
            minute: 40
        )
        NotificationService.shared.scheduleDailyNotification(
            id: "AfterLunchReminder",
            title: "Второе дыхание",
            body: "Осталось еще чуть чуть до конца рабочего дня",
            hour: 15,
            minute: 40
        )
    }
    var body: some Scene {
        WindowGroup {
            AppFlowScreen()
        }
    }
}
