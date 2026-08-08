//
//   approveMicroloan.swift
//  IPOAlgorithms
//
//  Created by Валерия Пономарева on 07.08.2026.
//

import Foundation

struct ApproveMicroloan {
    static func run() {
        print("▶️ Run: '💰 Approve Microloan'")
        /*
         📋 ТЗ: «Одобрение микрозайма»
         Условие: Система должна принять решение о выдаче займа на основе кредитного рейтинга user's.
         Если рейтинг строго больше 600, возвращаем строку: "Loan approved".
         Если рейтинг 600 или меньше, возвращаем строку: "Loan denied".
         
         🛡️ Граничные случаи (Edge Cases) для проверки:
         - Данных нет (nil): Если рейтинг не пришел, сразу возвращаем: "Error: Score missing".
         - Некорректный рейтинг: Рейтинг не может быть меньше 0 или больше 850. Если пришло число вне этого диапазона, сразу возвращаем: "Error: Invalid score rating".
         
         📥 Входные и выходные данные:
         Вход (Input): score: Int? (опциональное число)
         Выход (Output): String (строка с вердиктом)
         */
        
        // MARK: - 'Валидация через типы' Parse, don't validate
        enum Reiting {
            case score(Int) // Тип обязателен! Нам нужно сохранить число
            case invalid
            case missing
            
            init(_ value: Int?) {
                guard let unwrappedValue = value else {
                    self = .missing
                    return
                }
                
                if (0...850).contains(unwrappedValue) {
                    self = .score(unwrappedValue)
                } else {
                    self = .invalid
                }
            }
            
            var result: String {
                switch self {
                case .missing:
                    return "Error: Score missing" // Исправлено: двоеточие вместо !
                case .invalid:
                    return "Error: Invalid score rating"
                case .score(let value):
                    return value > 600 ? "💰 Loan approved" : "Loan denied"
                }
            }
        }
        
        // MARK: - TEST CASES
        print(Reiting(777).result)   // "💰 Loan approved"
        print(Reiting(600).result)   // "Loan denied" (Ровно 600 — отказ, строго по ТЗ!)
        print(Reiting(-12).result)   // "Error: Invalid score rating"
        print(Reiting(nil).result)   // "Error: Score missing"
        print(Reiting(2112).result)  // "Error: Invalid score rating"
    }
}

