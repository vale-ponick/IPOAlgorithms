//
//  bridgeAccessCode.swift
//  IPOAlgorithms
//
//  Created by Валерия Пономарева on 11.08.2026.
//

import Foundation

struct BridgeAccessCode {
    static func run() {
        print("▶️ Run: 🌌🛸 Bridge Access Code on 'USS Enterprise'")
        
        print("⭐ ТЗ: Для входа на капитанский мостик офицеры используют динамически меняющиеся пароли из зацикленного списка безопасности. Дан массив кодовых слов. Напиши функцию, которая при каждом вызове возвращает текущий рабочий код доступа и переводит систему на следующий шаг по формуле кольца.")
        
        // Edge Cases:
        /** Пустой массив → nil.
         Один код в массиве → код доступа никогда не меняется.
         */
        
        var paroles = ["Alpha", "Beta", "Gamma", "Delta"]
        var index = 0 // начинаем всегда с 1-го элемента
        
        func getParole() -> String? {
            guard !paroles.isEmpty else {
                return "Error! Paroles not found"
            }
            let currentParole = paroles[index] // сохрани текущий
            index = (index + 1) % paroles.count // обнови индекс
           
            return "Current parole: \(currentParole)" // верни СОХРАНЕННОЕ ЗНАЧЕНИЕ индекса
        }
        
        // MARK: - TESTS
        
        // 1. Обычный массив
        print("-- Test 1: Ordinary array --")
        for _ in paroles {
            print(getParole() ?? "Error! Paroles not found")
        }
        
        // 2. Проверка перезапуска
        print("-- Test 4: Show restart --")
        index = 0
        for i in 0..<paroles.count + 2 {
            let result = getParole() ?? "Error! Paroles not found"
            print("\(i + 1). \(result)")
        }
        
        // 3. Один элемент
        print("\n-- Test 2: Single element --")
        index = 0
        paroles = ["Epsilon"]
        for _ in 0..<3 {
            print(getParole() ?? "Error! Paroles not found")
        }
        
        // 4. Пустой массив
        print("\n-- Test 3: Empty array --")
        paroles = []
        index = 0
        print(getParole() ?? "Error! Paroles not found")
        print()
        
        // 5. Проверка перезапуска (снова с полным массивом)
        print("-- Test 5: Show restart again --")
        paroles = ["Alpha", "Beta", "Gamma", "Delta"]  // восстанавливаем
        index = 0
        for i in 0..<paroles.count + 2 {
            let result = getParole() ?? "Error! Paroles not found"
            print("\(i + 1). \(result)")
        }
    }
}
/**
 ▶️ Run: 🌌🛸 Bridge Access Code on 'USS Enterprise'
 ⭐ ТЗ: Для входа на капитанский мостик офицеры используют динамически меняющиеся пароли из зацикленного списка безопасности. Дан массив кодовых слов. Напиши функцию, которая при каждом вызове возвращает текущий рабочий код доступа и переводит систему на следующий шаг по формуле кольца.
 -- Test 1: Ordinary array --
 Current parole: Alpha
 Current parole: Beta
 Current parole: Gamma
 Current parole: Delta
 -- Test 4: Show restart --
 1. Current parole: Alpha
 2. Current parole: Beta
 3. Current parole: Gamma
 4. Current parole: Delta
 5. Current parole: Alpha
 6. Current parole: Beta

 -- Test 2: Single element --
 Current parole: Epsilon
 Current parole: Epsilon
 Current parole: Epsilon

 -- Test 3: Empty array --
 Error! Paroles not found

 -- Test 5: Show restart again --
 1. Current parole: Alpha
 2. Current parole: Beta
 3. Current parole: Gamma
 4. Current parole: Delta
 5. Current parole: Alpha
 6. Current parole: Beta
 */
