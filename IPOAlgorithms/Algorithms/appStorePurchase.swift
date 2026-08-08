//
//  appStorePurchase.swift
//  IPOAlgorithms
//
//  Created by Валерия Пономарева on 08.08.2026.
//

import Foundation

struct AppStorePurchase {
    static func run() {
        print("▶️ Run: '💰 App Store Purchase'") // ▶️ Run: '💰 App Store Purchase'
        /* 📋 ТЗ:
         Структура: AppStorePurchase
         Вход в init: Double? (баланс аккаунта)
         Диапазон валидности: 0.0...2000.0
         Условие: покупки в result: строго больше или равно >= 9.99
         
         🛡️ Граничные случаи (Edge Cases) для проверки:
         - Данных нет (nil): Если рейтинг не пришел, сразу возвращаем: "Error: Score missing".
         - Некорректный рейтинг: Рейтинг не м.б. < 0 || > 850. Если пришло число вне этого диапазона, сразу возвращаем: "Error: Invalid score rating".
         
         📥 Входные и выходные данные:
         Вход (Input): score: Int? (опциональное число)
         Выход (Output): String (строка с вердиктом):
         нет данных ➡️ "Error: Account balance is unavailable"
         вне лимита ➡️ "Error: Invalid balance amount"
         успех ➡️ "Purchase successful! Enjoy your app."
         мало денег ➡️ "Purchase denied: Insufficient funds."
         */
        
        // MARK:
        struct AppStorePurchase {
            let balance: Double?
            
            init(balance: Double?) {
                self.balance = balance
            }
            
            func result()  -> String {
                guard let unwrappedBalance = balance else {
                    return "Error: Account balance is unavailable"
                }
                if unwrappedBalance < 0 || unwrappedBalance > 2000.0 {
                    return "Error: Invalid balance amount"
                }
                if unwrappedBalance >= 9.99 {
                    return "Purchase successful! Enjoy your app."
                } else {
                    return "Purchase denied: Insufficient funds."
                }
            }
        }
        
        // MARK: - TEST CASES
        
        print(AppStorePurchase(balance: 555.5).result()) // Purchase successful! Enjoy your app.
        print(AppStorePurchase(balance: 5.5).result()) // Purchase denied: Insufficient funds.
        print(AppStorePurchase(balance: 9.99).result()) // Purchase successful! Enjoy your app.
        print(AppStorePurchase(balance: nil).result()) // Error: Account balance is unavailable
        print(AppStorePurchase(balance: 2500.0).result()) // Error: Invalid balance amount
    }
}
    



