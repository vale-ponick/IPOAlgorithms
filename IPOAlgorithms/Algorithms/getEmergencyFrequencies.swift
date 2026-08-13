//
//  getEmergencyFrequencies.swift
//  IPOAlgorithms
//
//  Created by Валерия Пономарева on 13.08.2026.
//

import Foundation

struct EmergencyFrequencies {
    static func run() {
        print("⭐⭐ TS: 📡 Emergency Frequencies")
        
        // MARK: - В случае нападения / пространственной аномалии система связи корабля 'Enterprise' начинает непрерывно и циклически сканировать аварийные каналы.
        
        print("Дан массив частот. Функция должна поочередно возвращать каналы связи. Когда сканирование доходит до конца и сбрасывается на начало, система должна зафиксировать этот факт в логах консоли.")
        
        // Лог сброса: 📡 All frequencies scanned. Restarting.
        /* Edge Cases:
         - Пустой массив → nil.
         - Индекс перед вызовом принудительно устанавливается в 0 для каждого отдельного блока тестов.
         */
        
        let channels = ["Channel 1", "Channel 2", "Channel 3", "Channel 4", "Channel 5"]
        
        var index = 0 // начинаем всегда с 1-го элемента
        
        func getFrequency() -> String? {
            guard !channels.isEmpty else {
                return nil
            }
            let current = channels[index] // 1. SAVE
            
            if index == channels.count - 1 { // 2. CHECK
                print("📡 All frequencies scanned. Restarting.") // LOG
            }
                
                index = (index + 1) % channels.count // 3. UPDATE
                
                return current // 4. RETURN
        }
    }
}
