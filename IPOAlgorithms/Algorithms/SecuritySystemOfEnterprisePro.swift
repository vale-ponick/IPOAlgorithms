//
//  SecuritySystemOfEnterprisePro.swift
//  IPOAlgorithms
//
//  Created by Валерия Пономарева on 09.08.2026.
//

import Foundation

struct SecuritySystemOfEnterprisePro {
    static func run() {
        print("▶️ Run: 🌌 Security Pro-System of 'Enterprise'") // ▶️ Run: 🌌 Security Pro- System of 'Enterprise'
   
        // MARK: - 'Валидация через типы' Parse, don't validate'
        
        struct CrewMemberPro {
            let name: String
            let rank: String
            let securityClearance: SecurityStatus
            
            enum SecurityStatus {
                case valid(Int) // тип обязателен - нужно сохранять число = уровень допуска
                case invalid
                case missing
                
                init(_ value: Int?) {
                    guard let unwrappedValue = value else {
                        self = .missing
                        return
                    }
                    if (1...10).contains(unwrappedValue) {
                        self = .valid(unwrappedValue)
                    } else {
                        self = .invalid
                    }
                }
            }
            
            // кастомный init of struct
            init(name: String, rank: String, securityClearance: Int?) {
                self.name = name
                self.rank = rank
                self.securityClearance = SecurityStatus(securityClearance)
            }
            
            // 🗂️ МЕТОД 1: Доступ на Командный мостик
            func enterCommandBridge() -> String {
                switch securityClearance {
                case .missing:
                    return "🔴 ACCESS DENIED: Missing ID"
                case .invalid:
                    return "🔴 SECURITY ALERT: Invalid clearance"
                case .valid(let value):
                    return value >= 7 ? "Welcome to Command Bridge, \(rank) \(name)!" : "Access denied: Low clearance"
                }
            }
            
            // 📥 МЕТОД 2: Доступ к критическим системам
            func accessMainComputer(_ requiredLevel: Int) -> String {
                switch securityClearance {
                case .missing:
                    return  "🔴 ACCESS DENIED: Missing ID"
                case .invalid:
                    return "🔴 SECURITY ALERT: Invalid clearance"
                case .valid(let value):
                    return value >= requiredLevel ? "🌌 Access granted to Main Computer" : "Access denied: Insufficient level"
                }
            }
        }
            
            // MARK: - TEST CASES
        // MARK: - TEST CASES (PRO VERSION)
                let spock = CrewMemberPro(name: "Spock", rank: "First Officer", securityClearance: 10)
                let chekov = CrewMemberPro(name: "Pavel Chekov", rank: "Ensign", securityClearance: 2)
                let intruder = CrewMemberPro(name: "Unknown", rank: "Alien", securityClearance: 99)
                let anomaly = CrewMemberPro(name: "Anomaly", rank: "Ghost", securityClearance: nil)
                
                print(spock.enterCommandBridge())    // Welcome to Command Bridge, First Officer Spock!
                print(spock.accessMainComputer(8))   // 🌌 Access granted to Main Computer (10 >= 8)
                print(chekov.enterCommandBridge())   // Access denied: Low clearance (2 < 7)
                print(intruder.accessMainComputer(5))// 🔴 SECURITY ALERT: Invalid clearance
                print(anomaly.enterCommandBridge())  // 🔴 ACCESS DENIED: Missing ID
    }
}
/*
 ⚠️  Где спотыкаешься?
 1. Область видимости переменных: попытка использовать переменную структуры name внутри изолированного enum без передачи параметра.
 
 2. Математическая логика инверсии: написание условий для защиты. Вместо «отсечь плохое» (if clearance < 1 || clearance > 10) ты пишешь «проверить хорошее» и вешаешь на него ошибку.
 
 3. Синтаксическая строгость: Swift — жестко типизированный язык. Ошибка в одну букву в имени переменной парализует компилятор.
 */
