//
//  watchRotationEnterprise.swift
//  IPOAlgorithms
//
//  Created by Валерия Пономарева on 10.08.2026.
//

import Foundation

struct watchRotationEnterprise {
    static func run() {
        print("▶️ Run: 🌌🛸 Watch Rotation on 'Enterprise'")
        
        print("📋 ТЗ: 🌌🛸 Watch Rotation on 'Enterprise': На 'USS Enterprise' установлен строгий график вахт. Офицеры несут службу, одна вахта заканчивается, наступает следующая.Условие: Дан массив имен офицеров. Напиши функцию, которая при каждом вызове возвращает имя следующего офицера на вахту. После последнего — снова первого.")
        
        let officers = ["Spock", "Leonard McCoy", "Montgomery Scott", "LNyota Uhura", "Hikaru Sulu", "Pavel Chekov", "James T.Kirk"]
        var index = 0 // выносим ЗА функцию, чтобы индекс сохранял свое состояние

        func getNextWatchRotation() -> String {
            let currentOfficer = officers[index] // запоминаем ТЕКУЩЕГО офицера, идущего на вахту
            index = (index + 1) % officers.count // формула Cyclic Array forward
            return currentOfficer
        }
        
        // MARK: - TESTS:
        // var. 1
        print("--- Auto test with circle for ---")
        index = 0 // 🛠️ СБРОС ИНДЕКСА ДЛЯ ЧИСТОТЫ ТЕСТА!
        for i in 1...7 {
            let officer = getNextWatchRotation()
            print("\(i). 🕓 Watch: \(officer)")
        }
        print("♻️ КРУГ ЗАВЕРШИЛСЯ, ПРОВЕРЯЕМ СБРОС:")
        print("8. Watch: \(getNextWatchRotation())")
        
        print("--- Тест через цикл while ---")
        
        // var. 2 while (with limit/stop? by condition)

        var counter = 1
        while counter <= 8 {
            print("\(counter). 🔄 Вахта: \(getNextWatchRotation())")
            counter += 1
        }
        print("♻️ КРУГ ЗАВЕРШИЛСЯ, ПРОВЕРЯЕМ СБРОС:")
        print("8. Watch: \(getNextWatchRotation())")
        
        // var. 3 PRO 'swift-style': Custom Iterator
        print("--- Тест через цикл PRO 'swift-style': Custom Iterator ---")
        index = 0 // 🛠️ СБРОС ИНДЕКСА ДЛЯ ЧИСТОТЫ ТЕСТА!
        let watchStream = AnyIterator { getNextWatchRotation() } // создай БЕСконечный поток офицеров на основе своей функции
        watchStream.prefix(8).enumerated().forEach { index, officer in
            print("\(index + 1). ⏳ Watch: \(officer)")
        }
        print("♻️ КРУГ ЗАВЕРШИЛСЯ, ПРОВЕРЯЕМ СБРОС:")
        print("8. Watch: \(getNextWatchRotation())")
        
        print("\n🏆 Все тесты успешно завершены!")
    }
}
/**
 ▶️ Run: 🌌🛸 Watch Rotation on 'Enterprise'
 📋 ТЗ: 🌌🛸 Watch Rotation on 'Enterprise': На 'USS Enterprise' установлен строгий график вахт. Офицеры несут службу, одна вахта заканчивается, наступает следующая.Условие: Дан массив имен офицеров. Напиши функцию, которая при каждом вызове возвращает имя следующего офицера на вахту. После последнего — снова первого.
 --- Auto test with circle for ---
 1. 🕓 Watch: Spock
 2. 🕓 Watch: Leonard McCoy
 3. 🕓 Watch: Montgomery Scott
 4. 🕓 Watch: LNyota Uhura
 5. 🕓 Watch: Hikaru Sulu
 6. 🕓 Watch: Pavel Chekov
 7. 🕓 Watch: James T.Kirk
 ♻️ КРУГ ЗАВЕРШИЛСЯ, ПРОВЕРЯЕМ СБРОС:
 8. Watch: Spock
 --- Тест через цикл while ---
 1. 🔄 Вахта: Leonard McCoy
 2. 🔄 Вахта: Montgomery Scott
 3. 🔄 Вахта: LNyota Uhura
 4. 🔄 Вахта: Hikaru Sulu
 5. 🔄 Вахта: Pavel Chekov
 6. 🔄 Вахта: James T.Kirk
 7. 🔄 Вахта: Spock
 8. 🔄 Вахта: Leonard McCoy
 ♻️ КРУГ ЗАВЕРШИЛСЯ, ПРОВЕРЯЕМ СБРОС:
 8. Watch: Montgomery Scott
 --- Тест через цикл PRO 'swift-style': Custom Iterator ---
 1. ⏳ Watch: Spock
 2. ⏳ Watch: Leonard McCoy
 3. ⏳ Watch: Montgomery Scott
 4. ⏳ Watch: LNyota Uhura
 5. ⏳ Watch: Hikaru Sulu
 6. ⏳ Watch: Pavel Chekov
 7. ⏳ Watch: James T.Kirk
 8. ⏳ Watch: Spock
 ♻️ КРУГ ЗАВЕРШИЛСЯ, ПРОВЕРЯЕМ СБРОС:
 8. Watch: Leonard McCoy

 🏆 Все тесты успешно завершены!
 */
