//
//  findSecondMax.swift
//  IPOAlgorithms
//
//  Created by Валерия Пономарева on 06.08.2026.
//

import Foundation

/**
 1. Модель IPO
 - Input (Вход): numbers: [Int] — массив целых чисел.
 - Process (Процесс): Пройти по массиву, отслеживая два самых больших значения (первое и второе место).
 - Output (Выход): Int? — второе максимальное число (может быть nil, если массива не существует или он слишком мал).
 
 2. Edge Cases (Граничные случаи)
 - Пустой массив [] ➡️ Результат: nil.
 - Массив из одного элемента [5] ➡️ Результат: nil (второго максимума нет).
 - Все элементы одинаковые [7, 7, 7] ➡️ Результат: nil или 7? (Обычно по логике ищут уникальный второй максимум, пусть будет nil, если строго больше, или 7, если по индексу. Давайте искать уникальный второй максимум).
 - Отрицательные числа [-10, -5, -20] ➡️ Результат: -10. Важно не инициализировать переменные нулями по умолчанию!
 
 */
struct FindSecondMax {
    static func run() {
        print("▶️ Запуск: '📒 Find Second Max'") // ▶️ Запуск: '📒 Find Second Max'
        
        func getSecondMax(_ nums: [Int]) -> Int? {
            guard nums.count >= 2  else {
                return nil
            }
            var firstMax: Int? = nil
            var secondMax: Int? = nil
            
            for num in nums {
                if let currentFirst = firstMax {
                    if num > currentFirst {
                        // нашли новый абсолютн. max
                        secondMax = firstMax
                        firstMax = num
                    } else if num < currentFirst {
                        // число Б первого max, проверь для второго
                        if let currentSecond = secondMax {
                            if num > currentSecond {
                                secondMax = num
                            }
                        } else {
                            secondMax = num
                        }
                    }
                } else {
                    firstMax = num
                }
            }
            return secondMax
        }
// Тест-драйв:
        let numbers = [3, 5, 8, 2, 8, 7]
        if let result = getSecondMax(numbers) {
            print("Массив: \(numbers) ➡️ Второй максимум: \(result)")
                  // Массив: [3, 5, 8, 2, 8, 7] ➡️ Второй максимум: 7
        } else {
            print("Уникальный второй максимум не найден")
        }
    }
}
