//
//  planetarySignalAnalizer.swift
//  IPOAlgorithms
//
//  Created by Валерия Пономарева on 20.08.2026.
//

import Foundation

// MARK: - 1. МОДЕЛЬ ДАННЫХ
// Используем Enum с данными внутри — это самый мощный инструмент Swift для таких задач.
enum PlanetarySignal: Decodable {
    case lifeForms(count: Int, species: String)
    case energySignature(type: String, intensity: Int)
    case ruins(description: String)
    case silence
    
    // Ключи из JSON (исправляем нестыковки в названиях)
    enum CodingKeys: String, CodingKey {
        case lifeCount = "life count"
        case species
        case energyType = "energy type" 
        case intensity
        case ruinsDescription = "ruins description"
    }
    
    // Кастомный инициализатор для гибкого распознавания разных типов сигналов
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // 1. Пытаемся декодировать как Жизнь
        if let count = try? container.decode(Int.self, forKey: .lifeCount),
           let species = try? container.decode(String.self, forKey: .species) {
            self = .lifeForms(count: count, species: species)
            return
        }
        
        // 2. Пытаемся декодировать как Энергию
        if let type = try? container.decode(String.self, forKey: .energyType),
           let intensity = try? container.decode(Int.self, forKey: .intensity) {
            self = .energySignature(type: type, intensity: intensity)
            return
        }
        
        // 3. Пытаемся декодировать как Руины
        if let desc = try? container.decode(String.self, forKey: .ruinsDescription) {
            self = .ruins(description: desc)
            return
        }
        
        // 4. Если ключей нет вообще — это тишина
        if container.allKeys.isEmpty {
            self = .silence
            return
        }
        
        // 5. Если ключи есть, но они нам неизвестны — выбрасываем ошибку
        throw DecodingError.dataCorrupted(DecodingError.Context(
            codingPath: container.codingPath,
            debugDescription: "Unknown signal pattern"
        ))
    }
}

// MARK: - 2. АНАЛИЗАТОР
struct PlanetarySignalsAnalyzer {
    static func run() {
        print("▶️ Run: 🪐 Ultimate Swift Signal Analyzer\n")
        
        let jsonItems = [
            #"{"life count": 3, "species": "Vulcanoid"}"#,
            #"{"energy_type": "Tachyon", "intensity": 120}"#,
            #"{"ruins description": "Ancient city"}"#,
            #"{}"#,
            #"{"unknown_key": 999}"#
        ]
        
        let decoder = JSONDecoder()
        
        for (index, jsonString) in jsonItems.enumerated() {
            print("Сектор \(index + 1):", terminator: " ")
            
            guard let data = jsonString.data(using: .utf8) else { continue }
            
            do {
                let signal = try decoder.decode(PlanetarySignal.self, from: data)
                
                // Изящный Swift-way разбор результата
                switch signal {
                case .lifeForms(let count, let species):
                    print("🖖 Найдено \(count) существ расы \(species).")
                case .energySignature(let type, let intensity):
                    print("⚡️ Сигнатура: \(type) (Мощность: \(intensity)).")
                case .ruins(let desc):
                    print("🏛️ Обнаружено: \(desc).")
                case .silence:
                    print("🔇 Тишина в эфире.")
                }
            } catch {
                print("❌ Сигнал не распознан (Данные повреждены).")
            }
        }
    }
}
/**
 ▶️ Run: 🪐 Ultimate Swift Signal Analyzer

 Сектор 1: 🖖 Найдено 3 существ расы Vulcanoid.
 Сектор 2: ⚡️ Сигнатура: Tachyon (Мощность: 120).
 Сектор 3: 🏛️ Обнаружено: Ancient city.
 Сектор 4: 🔇 Тишина в эфире.
 Сектор 5: 🔇 Тишина в эфире.
 Program ended with exit code: 0
 */
