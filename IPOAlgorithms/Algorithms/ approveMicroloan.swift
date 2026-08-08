//
//   approveMicroloan.swift
//  IPOAlgorithms
//
//  Created by Валерия Пономарева on 07.08.2026.
//

import Foundation

struct ApproveMicroloan {
    static func run() {
        print("▶️ Run: '💰 ApproveMicroloan'") // ▶️ Run: '💰 Approve Microloan'
        /*
         📋 ТЗ: «Одобрение микрозайма»
         Условие:Система должна принять решение о выдаче займа на основе кредитного рейтинга user's.
         Если рейтинг строго больше 600, возвращаем строку: "Loan approved".
         Если рейтинг 600 или меньше, возвращаем строку: "Loan denied".
         🛡️ Граничные случаи (Edge Cases) для проверки:
         - Данных нет (nil): Если рейтинг не пришел, сразу возвращаем: "Error: Score missing".
         - Некорректный рейтинг: В мировой практике рейтинг не может быть меньше 0 или больше 850. Если пришло число вне этого диапазона (например, -10 или 950), сразу возвращаем: "Error: Invalid score rating".
         📥 Входные и выходные данные функции:
         Имя функции: checkLoanВход (Input): score: Int? (опциональное число)
         Выход (Output): String (строка с вердиктом)
         */
        
        /*
         1. INPUT
         -
         2. OUTPUT
         Рейтинг > 600 ➡️ "Loan approved", иначе ➡️ "Loan denied".
         
         3. EDGE CASES
         Edge Case 1: если рейтинг nil ➡️ "Error: Score missing".
         
         Edge Case 2: если рейтинг < 0 или > 850 ➡️ "Error: Invalid score rating".
         
         🧠 Pseudocode
         FUNCTION ..
         RETURN
         END FUNCTION
         */
        
        // MARK: - 'Валидация через типы' Parse, don't validate
        
        // MARK: - MAIN LOGIC
        enum Reiting {
            case score(Int)
            case invalid(String)
            case missing // 👈 Новый кейс для Edge Case №1
            
            // прими Int? прямо НА ВХОДЕ в init
            
            init(_ value: Int?) {
                guard let unwrappedValue = value else {
                    self = .missing // if -> nil
                    return
                }
                // logic check diapozone numbers
                if (0...850).contains(unwrappedValue) {
                    self = .score(unwrappedValue)
                } else {
                    self = .invalid("Error: Invalid score rating")
                }
            }
            
            // computed property -> result
            var result: String {
                switch self {
                case .missing:
                    return "Error! Score missing" // .. nil
                case .score(let value):
                   return value > 600 ? "💰 Loan approved"
                    : "Loan denied"
                case .invalid(let message):
                    return message
                }
            }
        }
        
        // MARK: - TEST CASES
        // MARK: - TEST CASES
        print(Reiting(777).result)   // "💰 Loan approved"
        print(Reiting(600).result)   // "Loan denied" (Ровно 600 — отказ, строго по ТЗ!)
        print(Reiting(-12).result)   // "Error: Invalid score rating"
        print(Reiting(nil).result)   // "Error: Score missing" (Магия! nil теперь обрабатывается!)
        print(Reiting(2112).result)  // "Error: Invalid score rating"

    }
}
