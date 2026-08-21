//
//  analiseTempSensor.swift
//  IPOAlgorithms
//
//  Created by Валерия Пономарева on 21.08.2026.
//

import Foundation

struct AnaliseTempSensor {
    static func run() {
        print("▶️ Run: 🌌🛸 AnaliseTempSensor on 'Enterprise'")
        
        print("📋 ТЗ: «Анализ темтературных данных на 'USS Enterprise': Напиши функцию, которая проверяет наличие температуры и определяет отсек по доп. ключам.")
        
        func analizeSensor(data: [String: Any]) {
            guard let unwrappedTemp = data
        }
    }
}
//MARK: - Напиши функцию `analyzeSensor(data: [String: Any])`, которая:
/* 1. Проверяет наличие температуры:
 - Извлекает `"temp"` как `Int`
 - Если `"temp"` нет → выводит `"❌ Ошибка: датчик неисправен."`
 
 2. Определяет отсек по дополнительным ключам (проверяй в этом порядке):
 - Если есть `"status"` → `"🖖 На мостике [X]°C. Статус: [Y]."`
 - Если есть `"patients"` → `"🏥 В медцентре [X]°C. Пациентов: [Y]."`
 - Если есть `"warpActive"` → `"🌀 Варп-двигатель: [X]°C. Статус: [включён/выключен]."`
 - Если есть `"deck"` → `"🛌 Жилой сектор ([Y]): [X]°C."`
 - Если есть `"alert"` → `"🚨 ТРЕВОГА! В отсеке [X]°C. Эвакуация: [YES/NO]."`
 - Если ничего из этого нет → `"❓ Неизвестный сектор: [X]°C."`
 
 3. Для Bool значений:
 - `warpActive: true` → `"включён"`, `false` → `"выключен"`
 - `alert: true` → `"YES"`, `false` → `"NO"`
 */
