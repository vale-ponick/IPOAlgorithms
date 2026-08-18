//
//  bridgeScannersEnterprise.swift
//  IPOAlgorithms
//
//  Created by Валерия Пономарева on 18.08.2026.
//

import Foundation

struct BridgeScannersEnterprise {
    static func run() {
        print("▶️ Run: 🪐 Bridge Scanners of 'Enterprise'")
        
        // MARK: - 1. ЦЕЛЬ ➡️ Научиться создавать enum с ассоциированными значениями и обрабатывать их через switch с использованием where для фильтрации.
        
        print("🪐 USS Enterprise вышел на орбиту неизученной планеты класса М. 🔭 Вы — научный сотрудник у консоли сенсоров. Атмосферные и энергетические условия на планете постоянно меняются. Ваша задача ➡️ мгновенно категоризировать состояние аномалий и автоматически отправлять рекомендации капитану Кирку.")
        
        enum PlanetCondition {
            case clear(radiation: Int)
            case storm(plasmaDensity: Int) 
            case nebula
            case anomaly(treatLevel: Int)
        }
        
        func reportStatus(condition: PlanetCondition) {
            switch condition {
            case .clear(let radiation) where radiation > 50:
                print("⚠️ Внимание: Радиация повышена (+\(radiation) rad). Использовать защитные экраны!")
            case .clear(let radiation):
                print("🟢 Обстановка стабильна. Уровень радиации: \(radiation). Разрешить высадку.")
            case .storm(let plasmaDensity) where plasmaDensity > 80:
                print("🚨 КРАСНЫЙ КОД! Ионный шторм критической плотности \(plasmaDensity) %! Отключить транспортеры!")
            case .storm(let plasmaDensity):
                print("🟡 Желтый код. Ионный шторм средней плотности: \(plasmaDensity) %. Наблюдение.")
            case .nebula:
                print("☁️ Визуальный контакт потерян. Мы вошли в туманность. Включить подпространственные сенсоры.")
            case .anomaly(let treatLevel) where treatLevel > 500:
                print("💥 КРИТИЧЕСКАЯ УГРОЗА! Аномалия генерирует \(treatLevel) ТВт! Зарядить фазеры, поднять щиты!")
            case .anomaly(let treatLevel):
                print("🔮 Обнаружена слабая энергетическая аномалия \(treatLevel) ТВт. Направить исследовательский зонд.")
           
            }
        }
        
        /** 3. Создай enum PlanetCondition с четырьмя кейсами:
         🔹 Кейс                            🔸 Ассоциированное значение             📝  Описание
         .clear(radiation: Int)          radiation: Int                  Стабильная обстановка, уровень радиации в рентгенах
         .storm(plasmaDensity: Int)      plasmaDensity: Int              Ионный шторм, плотность плазмы в %
         .nebula                         ❌ нет данных                   Корабль вошел в туманность
         .anomaly(treatLevel: Int)      treatLevel: Int                Энергетическая аномалия, уровень угрозы в ТВт */
         
         // MARK: - 4. ФУНКЦИЯ АНАЛИЗА
         
        /** Создай функцию reportStatus(condition: PlanetCondition), которая:
         🔹 Условие                            🔸 Вывод
         .clear где radiation > 50      "⚠️ Внимание: Радиация повышена (+X рад). Использовать защитные экраны!"
         .clear (любой другой)          "🟢 Обстановка стабильна. Уровень радиации: X рад. Разрешить высадку."
         .storm где plasmaDensity > 80  "🚨 КРАСНЫЙ КОД! Ионный шторм критической плотности (X%)! Отключить транспортеры!"
         .storm (любой другой)          "🟡 Желтый код. Ионный шторм средней плотности: X%. Наблюдение."
         .nebula                        "☁️ Визуальный контакт потерян. Мы вошли в туманность. Включить подпространственные сенсоры."
         .anomaly где energyLevel > 500  "💥 КРИТИЧЕСКАЯ УГРОЗА! Аномалия генерирует X ТВт! Зарядить фазеры, поднять щиты!"
         .anomaly (любой другой)         "🔮 Обнаружена слабая энергетическая аномалия (X ТВт). Направить исследовательский зонд." */
        
        // MARK:  - Tests
        reportStatus(condition: PlanetCondition.clear(radiation: 60))
        reportStatus(condition: PlanetCondition.clear(radiation: 20))
        reportStatus(condition: PlanetCondition.storm(plasmaDensity: 95))
        reportStatus(condition: PlanetCondition.storm(plasmaDensity: 50))
        reportStatus(condition: PlanetCondition.nebula)
        reportStatus(condition: PlanetCondition.anomaly(treatLevel: 700))
        reportStatus(condition: PlanetCondition.anomaly(treatLevel: 200))
     
        // MARK: -> вывод на консоль
        /* ▶️ Run: 🪐 Bridge Scanners of 'Enterprise'
         🪐 USS Enterprise вышел на орбиту неизученной планеты класса М. 🔭 Вы — научный сотрудник у консоли сенсоров. Атмосферные и энергетические условия на планете постоянно меняются. Ваша задача ➡️ мгновенно категоризировать состояние аномалий и автоматически отправлять рекомендации капитану Кирку.
         ⚠️ Внимание: Радиация повышена (+60 rad). Использовать защитные экраны!
         🟢 Обстановка стабильна. Уровень радиации: 20. Разрешить высадку.
         🚨 КРАСНЫЙ КОД! Ионный шторм критической плотности 95 %! Отключить транспортеры!
         🟡 Желтый код. Ионный шторм средней плотности: 50 %. Наблюдение.
         ☁️ Визуальный контакт потерян. Мы вошли в туманность. Включить подпространственные сенсоры.
         💥 КРИТИЧЕСКАЯ УГРОЗА! Аномалия генерирует 700 ТВт! Зарядить фазеры, поднять щиты!
         🔮 Обнаружена слабая энергетическая аномалия 200 ТВт. Направить исследовательский зонд.
         Program ended with exit code: 0 */
    }
}
