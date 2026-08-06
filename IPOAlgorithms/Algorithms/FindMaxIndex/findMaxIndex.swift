//
//  findMaxIndex.swift
//  IPOAlgorithms
//
//  Created by Валерия Пономарева on 06.08.2026.
//

import Foundation

//  Найти индекс первого максимального элемента

/*
 📒 IPO + EDGE CASES
 INPUT:
   numbers: [Int] — массив целых чисел
 OUTPUT:
   Int? — индекс максимума или nil
 EDGE CASES:
   [] → nil
   [-5,-2,-8] → 1
   [5,5,5] → 0
   [42] → 0
 PROCESS:
   1. Проверка на пустоту
   2. Инициализация max = numbers[0]
   3. Цикл по массиву
   4. Обновление максимума
   5. Возврат индекса
 ⏱ Сложность: O(n), O(1)
 */

struct FindMaxIndex {
    static func run() {
        print("▶️ Запуск: '📒 IPO + EDGE CASES'")

        
        let numbers: [Int] = []
        func getMax(_ numbers: [Int]) -> Int? {
            guard !numbers.isEmpty else {
                return nil
            }
            var indexMax = 0 // start index = 0
            var valueMax = numbers[0]
            for (index, number) in numbers.enumerated() {
                if number > valueMax {
                    indexMax = index
                    valueMax = number
                }
            }
            return indexMax
        }
        
        if let maxIndex = getMax([1, 2, 3, 4, 5, 5, 6, 7, 8, 9]) {
            print("🎯 Индекс максимального элемента: \(maxIndex)") // 🎯 Индекс максимального элемента: 9
        } else {
            print("❌ Массив пуст")
        }
    }
}
