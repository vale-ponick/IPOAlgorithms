//
//  controlSpeedCar.swift
//  IPOAlgorithms
//
//  Created by Valeria Ponomareva on 07.08.2026.
//

import Foundation

struct ControlSpeedCar {
    static func run() {
        print("▶️ Run: '🚕💨 Control Speed Car'") // ▶️ Run: '🚕💨 Control Speed Car'
        
        /**
         1. INPUT
         - maxSpeed: Int (speed limit)
         - currentSpeed: Int? (optional sensor data)
         
         2. OUTPUT
         - String (using ternary operator: condition ? expression1 : expression2)
         
         3. EDGE CASES
         - Reverse gear (negative speed) -> physical speed still increases.
           Solution: use absolute value via abs(currentSpeed). Example: -70 becomes 70.
         - Sensor error (unrealistic values) -> physical limit exceeded.
           Solution: set upper threshold (> 300 returns "Speed sensor error!").
         - Missing data (nil value).
           Solution: if currentSpeed == nil, immediately return "Data not found".
         
         🧠 Pseudocode
         FUNCTION checkSpeed(currentSpeed, maxSpeed)
             IF currentSpeed IS nil THEN
                 RETURN "Data not found"
                 
             IF abs(currentSpeed) > 300 THEN
                 RETURN "Speed sensor error!"
                 
             absoluteSpeed = abs(currentSpeed)
             
             RETURN (absoluteSpeed > maxSpeed) ? "Slow down!" : "Speed is normal"
         END FUNCTION
         */
        
        // MARK: - DATA MODELS
        // (Empty: using standard primitive types Int and String)
        
        // MARK: - MAIN LOGIC
        func checkSpeed(currentSpeed: Int?, maxSpeed: Int = 60) -> String {
            // 1. Check for nil (missing data) via guard let
            guard let speed = currentSpeed else {
                return "Data not found"
            }
            
            // 2. Check for sensor error (> 300)
            guard abs(speed) <= 300 else {
                return "Speed sensor error!"
            }
            
            // 3. Convert to absolute value for reverse gear
            let absoluteSpeed = abs(speed)
            
            // 4. Return result using ternary operator
            return absoluteSpeed > maxSpeed ? "Slow down!" : "Speed is normal"
        }
        
        // MARK: - TEST CASES
        print(checkSpeed(currentSpeed: 50))    // "Speed is normal"
        print(checkSpeed(currentSpeed: 80))    // "Slow down!"
        print(checkSpeed(currentSpeed: -75))   // "Slow down!" (moving backwards at 75 km/h)
        print(checkSpeed(currentSpeed: nil))   // "Data not found"
        print(checkSpeed(currentSpeed: 450))   // "Speed sensor error!"
        
        /**
         📊 Сравнение формулировок комментариев
         Этап кодаТвой ответ (Суть)Грамотный технический язык (Сленг разработчиков)1. guard let speedОбъявили и безопасно развернули скорость со значением текущей скорости, иначе выход из программы — данных нет.Безопасно развернули (распаковали) опционал currentSpeed в константу speed. Если данных нет (nil), срабатывает ранний выход (early return) из функции.2. guard abs(speed)Безопасно развернули? Встр. функцию abs с жестко заданным значением нереальной скорости.Отсекли граничный случай (Edge Case) с ошибкой датчика. Проверили значение по модулю через функцию abs(), чтобы отфильтровать нереальную скорость (> 300).3. let absoluteSpeedОбъявили константу абс. скорость со значением физ., чтобы отрицательная скорость — задний ход — преобразовалась в походит.Создали константу для абсолютного значения скорости. Преобразовали отрицательное значение заднего хода в положительное число для корректного сравнения.4. return ... ? : ...Вернули условие: если абс. скорость больше макс. скорости, то слон даун (как перевести?) или скорость норм.Вернули результат через тернарный оператор. Если скорость превышена, возвращаем "Slow down!" (Сбавьте скорость!), иначе — "Speed is normal".
         */
    }
}
