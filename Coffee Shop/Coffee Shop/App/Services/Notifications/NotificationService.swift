import NotificationCenter

class NotificationService {
    static let shared = NotificationService()
    private init() {}
    
    func requestPermission() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
                print(granted ? "✅ Разрешение есть" : "❌ Разрешения нет")
            }
    }
    
    func scheduleDailyNotification(id: String, title: String, body: String, hour: Int, minute: Int) {
        let content = UNMutableNotificationContent()
            content.title = title
            content.body = body
            content.sound = .default
            var dateComponents = DateComponents()
            dateComponents.hour = hour
            dateComponents.minute = minute
            
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            
            let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request)
        
    }
}
