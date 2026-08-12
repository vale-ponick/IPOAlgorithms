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
        
        var codes = ["Alpha", "Beta", "Gamma", "Delta"]
        var index = 0 // начинаем всегда с 1-го элемента
        
        func getCode() -> String? {
            guard !codes.isEmpty else {
                return nil
            }
            let currentCode = codes[index] // сохрани текущий
            index = (index + 1) % codes.count // обнови индекс
           
            return currentCode // верни СОХРАНЕННОЕ ЗНАЧЕНИЕ индекса
        }
        
        // MARK: - TESTS
        
        // 1. Обычный массив
        print("-- Test 1: Ordinary array --")
        for _ in codes {
            print(getCode() ?? "Error! Codes not found")
        }
        
        // 2. Проверка перезапуска
        print("-- Test 2: Show restart --")
        index = 0
        for i in 0..<codes.count + 2 {
            let result = getCode() ?? "Error! Codes not found"
            print("\(i + 1). \(result)")
        }
        
        // 3. Один элемент
        print("\n-- Test 3: Single element --")
        index = 0
        codes = ["Epsilon"]
        for _ in 0..<3 {
            print(getCode() ?? "Error! Codes not found")
        }
        
        // 4. Пустой массив
        print("\n-- Test 4: Empty array --")
        codes = []
        index = 0
        print(getCode() ?? "Error! Codes not found")
        
        
        // 5. Проверка перезапуска (снова с полным массивом)
        print("-- Test 5: Show restart again --")
        codes = ["Alpha", "Beta", "Gamma", "Delta"]  // восстанавливаем
        index = 0
        for i in 0..<codes.count + 2 {
            let result = getCode() ?? "Error! Codes not found"
            print("\(i + 1). \(result)")
        }
    }
}
/**
 ▶️ Run: 🌌🛸 Bridge Access Code on 'USS Enterprise'
 ⭐ ТЗ: Для входа на капитанский мостик офицеры используют динамически меняющиеся пароли из зацикленного списка безопасности. Дан массив кодовых слов. Напиши функцию, которая при каждом вызове возвращает текущий рабочий код доступа и переводит систему на следующий шаг по формуле кольца.
 -- Test 1: Ordinary array --
 Alpha
 Beta
 Gamma
 Delta
 -- Test 2: Show restart --
 1. Alpha
 2. Beta
 3. Gamma
 4. Delta
 5. Alpha
 6. Beta

 -- Test 3: Single element --
 Epsilon
 Epsilon
 Epsilon

 -- Test 4: Empty array --
 Error! Codes not found
 -- Test 5: Show restart again --
 1. Alpha
 2. Beta
 3. Gamma
 4. Delta
 5. Alpha
 6. Beta
 */
