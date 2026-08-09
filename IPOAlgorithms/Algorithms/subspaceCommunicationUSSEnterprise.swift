//
//  subspaceCommunicationUSSEnterprise.swift
//  IPOAlgorithms
//
//  Created by Валерия Пономарева on 09.08.2026.
//

import Foundation

struct SubspaceCommunicationUSSEnterprise {
    static func run() {
        print("▶️ Run: '🌌🛸 Subspace Communication USS Enterprise'")
        
        print("📋 ТЗ: Система аварийных сигналов 'USS Enterprise'.")
        
        /**
         Звездолет USS Enterprise терпит бедствие в глубоком космосе. Инженерный отряд зафиксировал серию критических сигналов о поломках систем корабля. Сигналы поступают в виде пакета сообщений, и служба безопасности должна переключать их один за другим для анализа.
         ТВОЯ ЗАДАЧА:
         Создать систему навигации по пакету сигналов, которая при каждом нажатии кнопки "NEXT" возвращает индекс следующего сигнала в пакете.
         УСЛОВИЕ:
         Вернуть ИНДЕКС (номер) следующего сигнала при вызове метода next().
         
         1. ВХОДНЫЕ ДАННЫЕ (INPUT)
         let signals: [String] — массив срочных сообщений о поломках (например: ["Щиты отключены", "Сбой в варп-двигателе", "Отказ жизнеобеспечения", "SOS"]).
         var currentIndex: Int? — индекс текущего сигнала, который сейчас анализирует служба безопасности (если nil — значит анализ еще не начат).
         
         2. ВЫХОДНЫЕ ДАННЫЕ (OUTPUT)Int? — индекс следующего сигнала для анализа (вернет nil, если произошла ошибка в системе или массив пуст).
         
         3. ПРАВИЛА РАБОТЫ СИСТЕМЫ (EDGE CASES)
         СИТУАЦИЯ 1: Пакет сигналов пуст
         Условие: signals.isEmptyДействие: Вернуть nil.
         СИТУАЦИЯ 2: Первый запуск (анализ еще не начат)
         Условие: currentIndex == nilДействие: Установить currentIndex = 0 и вернуть 0.
         СИТУАЦИЯ 3: Сбой в системе (индекс указывает в пустоту)
         Условие: currentIndex < 0 ИЛИ currentIndex >= signals.count
         Действие: Вернуть nil.
         СИТУАЦИЯ 4: Достигнут конец пакета (последний сигнал проанализирован)
         Условие: currentIndex == signals.count - 1
         Действие:Вывести в консоль предупреждение: "⚠️ WARNING: End of signal package. Restarting from 0."Сбросить currentIndex = 0 (начать анализ заново).Вернуть 0.
         СИТУАЦИЯ 5: Обычный переход к следующему сигналу
         Условие: Все предыдущие проверки пройдены.
         Действие: Увеличить currentIndex на 1, сохранить новое значение и вернуть его.
         
         4. ЛОГИРОВАНИЕ
         При достижении конца пакета вывести предупреждение в консоль:"⚠️ WARNING: End of signal package. Restarting from 0."
         
         5. ПРИМЕР РАБОТЫ
         Пакет сигналов: ["SOS", "Shields Down", "Life Support Fail"] (всего 3 элемента, индексы: 0, 1, 2)
         currentIndex = nilnext() → возвращает 0 (начинаем с SOS, currentIndex становится равен 0).currentIndex = 0next() → возвращает 1 (переходим к Shields Down, currentIndex становится равен 1).currentIndex = 1next() → возвращает 2 (переходим к Life Support Fail, currentIndex становится равен 2).currentIndex = 2 (последний!)next() → Выводит предупреждение в консоль, сбрасывает currentIndex на 0 и возвращает 0 (снова SOS).currentIndex = 0neЉxt() → возвращает 1 (цикл повторяется).И так по кругу, пока инженеры не починят корабль
         */
        // 🚀6. СТРУКТУРА КОДА
        
        let signals: [String] = [ // <— массив срочных сообщений о поломках
            "🆘 SOS",
            "🛡️ Shields Down",
            "⚠️ Life Support Fail",
            "🌀 Warp Drive not functioning",
            "🔥 Impulse Engine damaged"
        ]
        enum SignalState {
            case empty
            case firstLaunch
            case invalidIndex(Int)
            case endOfPackage
            case normal(Int)
        }

        struct SubspaceCommunication {
            let signals: [String]
            var currentIndex: Int?
            
            mutating func next() -> Int? {
                switch state {
                case .empty:
                    return nil
                case .firstLaunch:
                    currentIndex = 0
                    return 0
                case .invalidIndex:
                    return nil
                case .endOfPackage:
                    print("⚠️ WARNING: End of signal package. Restarting from 0.")
                    currentIndex = 0
                    return 0
                case .normal(let newIndex):
                    currentIndex = newIndex
                    return currentIndex
                }
            }
            
            private var state: SignalState {
                guard !signals.isEmpty else {
                    return .empty
                }
                
                guard let index = currentIndex else {
                    return .firstLaunch
                }
                
                guard index >= 0 && index < signals.count else {
                    return .invalidIndex(index)
                }
                
                if index == signals.count - 1 {
                    return .endOfPackage
                }
                
                return .normal(index + 1)
            }
        }
    // Создаем экземпляр нашей системы связи
        var computer = SubspaceCommunication(signals: signals, currentIndex: nil)
                
               print("\n--- ТЕСТИРОВАНИЕ СИСТЕМЫ ---")
        // Симулируем 7 нажатий кнопки NEXT
        for i in 1...7 {
            if let nextIndex = computer.next() {
                print("Нажатие \(i): Следующий индекс -> \(nextIndex) [Текст: \(signals[nextIndex])]")
            } else {
                print("Нажатие \(i): Ошибка системы (nil)")
            }
        }
    }
}
/**
 ▶️ Run: '🌌🛸 Subspace Communication USS Enterprise'
 📋 ТЗ: Система аварийных сигналов 'USS Enterprise'.

 --- ТЕСТИРОВАНИЕ СИСТЕМЫ ---
 Нажатие 1: Следующий индекс -> 0 [Текст: 🆘 SOS]
 Нажатие 2: Следующий индекс -> 1 [Текст: 🛡️ Shields Down]
 Нажатие 3: Следующий индекс -> 2 [Текст: ⚠️ Life Support Fail]
 Нажатие 4: Следующий индекс -> 3 [Текст: 🌀 Warp Drive not functioning]
 Нажатие 5: Следующий индекс -> 4 [Текст: 🔥 Impulse Engine damaged]
 ⚠️ WARNING: End of signal package. Restarting from 0.
 Нажатие 6: Следующий индекс -> 0 [Текст: 🆘 SOS]
 Нажатие 7: Следующий индекс -> 1 [Текст: 🛡️ Shields Down]
 */
/*  🎉 чистый, безопасный Swift-код с enum — он показывает понимание:

 enum с ассоциированными значениями

 Вычисляемых свойств

 Мутирующих методов

 Guard-проверок

 Кольцевой логики */
