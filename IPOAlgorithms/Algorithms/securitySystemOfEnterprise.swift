//
//  securitySystemOfEnterprise.swift
//  IPOAlgorithms
//
//  Created by Валерия Пономарева on 08.08.2026.
//

import Foundation

struct SecuritySystemOfEnterprise {
    static func run() {
        print("▶️ Run: 🚀 Security System of 'Enterprise'") // ▶️ Run: 🚀 Security System of 'Enterprise'
        /*
         📋 TS: «🚀 Security System of 'Enterprise'»
         Напиши софт для системы безопасности корабля + struct CrewMember. У каждого члена экипажа есть имя и уровень допуска (Security Clearance) от 1 до 10. Допуск может не прийти (nil).
         
         Edge Cases:🛡️ для обоих методов:
         1. Данных нет (nil): Вернуть строку '🔴 ACCESS DENIED: Missing ID'
         2. Сбой системы: Допуск не м.б. < 1 || > 12. Если пришло число ВНЕ этого диапазона -> '🔴 SECURITY ALERT: Invalid clearance'
         
         🗂️ Метод 1: Доступ на командный мостик (Параметры НЕ нужны)
         - Имя метода: enterComandBridge()
         - Правило: на командный мостик пускают офицеров с допуском >= 7.
         - Синтаксис: Скобки пустые, так как метод берет допуск из самой структуры.
         - Выход: Если допуск ок ➡️ "Welcome to command Bridge, [Имя офицера]!", иначе ➡️ "Access denied: Low clearance".
         
         📥 Метод 2: Доступ к критическим системам (Параметр НЕОБХОДИМ)
         - Имя метода: accessMainComputer
         - Параметр в скобках: requiredLevel: Int (требуемый уровень допуска для конкретной программы Главного Компа, который компьютер узнает только в момент вызова? логику человеческую исправить).
         - Правило: Разрешить, если допуск офицера больше или равен переданному requiredLevel.
         - Выход: Если допуск ок ➡️ "Access granted to system.", иначе ➡️ "Access denied: Insufficient level".
         */
        
        struct CrewMember {
            let name: String
            let sequrtyClearance: Int? // уровень допуска м. НЕ прийти => optional value
            
            init(name: String, sequrtyClearance: Int?) {
                self.name = name
                self.sequrtyClearance = sequrtyClearance
            }
                // доступ на командный мостик
            func enterComandBridge() -> String { // используем внутр. значение структуры = 'себяшечка'
                guard let clearance = sequrtyClearance else {
                    return "🔴 ACCESS DENIED: Missing ID"
                    }
                if clearance < 1  || clearance > 10 {
                    return "🔴 SECURITY ALERT: Invalid clearance"
                }
                // 3. Основная бизнес-логика (лимит >= 7)
                return clearance >= 7 ? "Welcome to command Bridge, \(name)!" : "Access denied: Low clearance"
            }
            
            // Доступ к критическим системам
            func accessMainComputer(_ requiredLevel: Int) -> String {
                guard let clearance = sequrtyClearance else {
                    return "🔴 ACCESS DENIED: Missing ID"
                    }
                if clearance < 1  && clearance > 10 {
                    return "🔴 SECURITY ALERT: Invalid clearance"
                }
                return clearance >= requiredLevel ? "Access granted to Main Computer" : "Access denied: Insufficient level"
            }
        }
        // MARK: - TESTS
                print(CrewMember(name: "First Officer Spock", sequrtyClearance: 10).accessMainComputer(7))
                // Выведет: Access granted to Main Computer (Допуск 10 >= 7)
                
                print(CrewMember(name: "First Officer Spock", sequrtyClearance: 10).enterComandBridge())
                // Выведет: Welcome to command Bridge, First Officer Spock! (Допуск 10 >= 7)
                
                print(CrewMember(name: "Captain James Kirk", sequrtyClearance: 8).accessMainComputer(9))
                // Выведет: Access denied: Insufficient level (Допуск 8 < 9)
                
                print(CrewMember(name: "Ensign Pavel Chekov", sequrtyClearance: 2).enterComandBridge())
                // Выведет: Access denied: Low clearance (Допуск 2 < 7, но теперь без паники датчика!)
                
                print(CrewMember(name: "Alien Anomaly", sequrtyClearance: nil).accessMainComputer(5))
                // Выведет: 🔴 ACCESS DENIED: Missing ID
                
                print(CrewMember(name: "Hacker Khahn", sequrtyClearance: 99).enterComandBridge())
                // Выведет: 🔴 SECURITY ALERT: Invalid clearance (Поймали взлом!)
    }
}
