//
//  StarTrekMedicalScanner.swift
//  IPOAlgorithms
//
//  Created by Валерия Пономарева on 06.08.2026.

import Foundation
        
        // MARK: - МОДЕЛИ ДАННЫХ
        
        enum Species: String { case human, vulcan }
        
        struct CrewMember {
            let pulse: Int
            let species: Species
            init(pulse: Int, species: Species) {
                self.pulse = max(0, pulse)
                self.species = species
            }
        }
        
        struct CrewPulseAnalysis {
            let averagePulse: Double
            let criticalTachycardiaCount: Int
        }
        
        // MARK: - ОСНОВНАЯ ЛОГИКА (Оптимизировано за 1 проход O(n))
        
        struct StarTrekMedicalScanner {
            private static let thresholds: [Species: Int] = [.human: 100, .vulcan: 300]
            
            func analyzeCrewPulse(_ members: [CrewMember]) -> CrewPulseAnalysis {
                guard !members.isEmpty else { return CrewPulseAnalysis(averagePulse: 0, criticalTachycardiaCount: 0) }
                
                // Считаем сумму пульса и количество тахикардии параллельно за один цикл
                let (totalPulse, tachycardiaCount) = members.reduce((0, 0)) { acc, member in
                    let isTachycardia = member.pulse > (Self.thresholds[member.species] ?? 0)
                    return (acc.0 + member.pulse, acc.1 + (isTachycardia ? 1 : 0))
                }
                
                return CrewPulseAnalysis(
                    averagePulse: Double(totalPulse) / Double(members.count),
                    criticalTachycardiaCount: tachycardiaCount
                )
            }
        }
        
        // MARK: - ТЕСТ-КЕЙСЫ
        
        extension StarTrekMedicalScanner{
            
            /// Главная точка входа для запуска тестов
            static func run() {
                print("▶️ Запуск: 🌌 Star Trek Medical Scanner")
                print(String(repeating: "=", count: 50))
                
                runTest1()
                runTest2()
                runTest3()
                
                print(String(repeating: "=", count: 50))
                print("🏁 Все тесты завершены!")
            }
            
            /// Тест 1: Спокойное дежурство (Кирк, Маккой, Спок в норме)
            private static func runTest1() {
                print("📊 ТЕСТ 1: Спокойное дежурство")
                print("👨‍✈️ Кирк (human, 75) + 🩺 Маккой (human, 65) + 🖖 Спок (vulcan, 242)\n")
                
                let members = [
                    CrewMember(pulse: 75, species: .human),
                    CrewMember(pulse: 65, species: .human),
                    CrewMember(pulse: 242, species: .vulcan)
                ]
                
                let result = StarTrekMedicalScanner().analyzeCrewPulse(members)
                printResult(result, expectedAvg: 127.33, expectedCount: 0)
            }
            
            /// Тест 2: Красная тревога (все в тахикардии)
            private static func runTest2() {
                print("📊 ТЕСТ 2: Красная тревога")
                print("🚨 Кирк (human, 120) + 🚨 Маккой (human, 110) + 🚨 Спок (vulcan, 310)\n")
                
                let members = [
                    CrewMember(pulse: 120, species: .human),
                    CrewMember(pulse: 110, species: .human),
                    CrewMember(pulse: 310, species: .vulcan)
                ]
                
                let result = StarTrekMedicalScanner().analyzeCrewPulse(members)
                printResult(result, expectedAvg: 180.0, expectedCount: 3)
            }
            
            /// Тест 3: Пустой массив (Edge Case)
            private static func runTest3() {
                print("📊 ТЕСТ 3: Пустой массив")
                print("📭 Экипажа нет на борту\n")
                
                let result = StarTrekMedicalScanner().analyzeCrewPulse([])
                printResult(result, expectedAvg: 0.0, expectedCount: 0)
            }
            
            /// Вспомогательная функция вывода результатов
            private static func printResult(_ result: CrewPulseAnalysis, expectedAvg: Double, expectedCount: Int) {
                let avgFormatted = String(format: "%.2f", result.averagePulse)
                let avgExpected = String(format: "%.2f", expectedAvg)
                
                let avgPass = abs(result.averagePulse - expectedAvg) < 0.01
                let countPass = result.criticalTachycardiaCount == expectedCount
                
                print("📤 Результат:")
                print("   averagePulse: \(avgFormatted) (ожидалось \(avgExpected))")
                print("   criticalTachycardiaCount: \(result.criticalTachycardiaCount) (ожидалось \(expectedCount))\n")
                print("✅ Тест пройден: \(avgPass && countPass ? "ДА" : "НЕТ")\n")
            }
        }
    



