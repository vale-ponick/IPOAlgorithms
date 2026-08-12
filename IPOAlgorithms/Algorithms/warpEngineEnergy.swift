//
//  warpEngineEnergy.swift
//  IPOAlgorithms
//
//  Created by Валерия Пономарева on 11.08.2026.
//

import Foundation

struct WarpEngineEnergy {
    static func run() {
        print("▶️ Run: 🌌🛸 Warp Engine Energy of 'USS Enterprise'")
        
        print("⭐⭐ ТЗ: На 'USS Enterprise циклическая система распределения энергии варп-ядра const сканирует показатели по кругу. Дан массив уровней энергии. Напиши функцию, которая при каждом вызове возвращает следующий уровень энергии. При извлечении последнего элемента массива перед обновлением индекса выведи предупреждение в консоль.")
        
        /**
         Лог сброса: ⚠️ Energy cycle restarted
         
         Edge Cases:
         - Пустой массив → nil.
         
         - Один элемент → возвращает его бесконечно, лог предупреждения срабатывает при каждом вызове. */
        
        var energyLevels = [85, 92, 95, 88, 77]
        var index = 0 // начинаем всегда с первого элемента
        var previousIndex: Int? = nil // Храним индекс предыдущего шага
        
        func getNextEnergyLevel() -> Int? {
            guard !energyLevels.isEmpty else { return nil }
            
            if previousIndex == energyLevels.count - 1 || energyLevels.count == 1 {
                    print("⚠️ Energy cycle restarted")
                }
            
            let currentLevel =  energyLevels[index]
            
            previousIndex = index
            index = (index + 1) % energyLevels.count
            
            return currentLevel
        }
            
            // MARK: - TESTS
        // test 1: Ordinary circle
        print("-- Test 1: Ordinary circles 'for..'")
        for i in 0..<6 {
            let level = getNextEnergyLevel() ?? 0
            print("\(i + 1). Current level: \(level)")
        }
        // --- Тест 2: Single element ---
        print("\n-- Test 2: Edge Case — Single element")
        
        // Просто подменяем данные в ТЕХ ЖЕ САМЫХ переменных!
        energyLevels = [99]
        index = 0
        previousIndex = nil // очищаем историю для нового теста
        
        for i in 0..<3 { // делаем 3 вызова
            let level = getNextEnergyLevel() ?? 0
            print("\(i + 1). Current level: \(level)")
        }
            
            // --- Тест 2: Empty array ---
            print("\n-- Test 3: Edge Case — Empty array")
            
            // Просто подменяем данные в ТЕХ ЖЕ САМЫХ переменных!
            energyLevels = []
            index = 0
            previousIndex = nil // очищаем историю для нового теста
            
            for i in 0..<2 { // делаем 2 вызова
                if let level = getNextEnergyLevel() {
                    print("\(i + 1). Current level: \(level)")
                } else {
                    print("\(i + 1). System returned nil (Array is empty) — SAFE")
            }
        }
    }
}
/**
 ▶️ Run: 🌌🛸 Warp Engine Energy of 'USS Enterprise'
 ⭐⭐ ТЗ: На 'USS Enterprise циклическая система распределения энергии варп-ядра const сканирует показатели по кругу. Дан массив уровней энергии. Напиши функцию, которая при каждом вызове возвращает следующий уровень энергии. При извлечении последнего элемента массива перед обновлением индекса выведи предупреждение в консоль.
 -- Test 1: Ordinary circles 'for..'
 1. Current level: 85
 2. Current level: 92
 3. Current level: 95
 4. Current level: 88
 5. Current level: 77
 ⚠️ Energy cycle restarted
 6. Current level: 85

 -- Test 2: Edge Case — Single element
 ⚠️ Energy cycle restarted
 1. Current level: 99
 ⚠️ Energy cycle restarted
 2. Current level: 99
 ⚠️ Energy cycle restarted
 3. Current level: 99
 */
