//
//  engineeringRepairTeams.swift
//  IPOAlgorithms
//
//  Created by Валерия Пономарева on 14.08.2026.
//

import Foundation

struct EngineeringRepairTeams {
    static func run() {
        print("▶️ Run: ⭐⭐⭐ Engineering Repair Teams on 'Enterprise'")
        
        print("📋 TS: Engineering Repair Teams on 'Enterprise': При повреждении обшивки инженерный отсек распределяет задачи между дежурными командами. Но главный инженер (Скотти) должен иметь возможность вручную вернуть дежурство первой бригаде в любой момент.")
        
        /** Дан массив ремонтных бригад.
         Структура должна содержать два метода:
         next() -> String? — возвращает имя следующей бригады по кругу.
         reset() — мгновенно сбрасывает указатель на самую первую бригаду (индекс 0), независимо от того, где сейчас находился цикл. */
        
        /* Edge Cases:
         - Пустой массив → next() возвращает nil, reset() не вызывает сбоев.
         - Вызов reset() сразу после инициализации не ломает логику (индекс остается 0).")
         */
       
        struct EngineeringTeam {
            let repairTeams: [String]
            
            var index = 0
            
            mutating func next() -> String? {
                guard !repairTeams.isEmpty else { return nil }
                
                let currentTeam = repairTeams[index] // 1. SAVE
                
                index = (index + 1) % repairTeams.count // 3. UPDATE
                
                if index == 0 { // 2. CHACK сброшен ли индекс ПОСЛЕ обновления
                    print("All repair teams used. Restarting.")
                }
                return currentTeam // 4. RETURN
            }
            
            mutating func reset() { // ручное управление -> "верни в начало в ЛЮБОЙ момент" = ПРИНУДИТЕЛЬНО ставит индекс 0
                index = 0
            }
        }
        
        // MARK: - TESTS
        var scotty = EngineeringTeam(repairTeams: ["Alpha Team", "Beta Team", "Gamma Team", "Delta Team"])
        
        print("-- Normal circle --")
        for _ in 0..<5 {
            print(scotty.next() ?? "⚠️ No teams")
        }
        
        print("-- Reset --")
        scotty.reset()
        
        print("-- After reset --")
        for _ in 0..<4 {
            print(scotty.next() ?? "⚠️ No teams")
        }
        
        print("\n-- Empty array --")
        var empty = EngineeringTeam(repairTeams: [])
        print(empty.next() ?? "nil ✅")
        empty.reset()
        print("Reset called - no crash ✅")
    }
}
/**
 ▶️ Run: ⭐⭐⭐ Engineering Repair Teams on 'Enterprise'
 📋 TS: Engineering Repair Teams on 'Enterprise': При повреждении обшивки инженерный отсек распределяет задачи между дежурными командами. Но главный инженер (Скотти) должен иметь возможность вручную вернуть дежурство первой бригаде в любой момент.
 -- Normal circle --
 Alpha Team
 Beta Team
 Gamma Team
 All repair teams used. Restarting.
 Delta Team
 Alpha Team
 -- Reset --
 -- After reset --
 Alpha Team
 Beta Team
 Gamma Team
 All repair teams used. Restarting.
 Delta Team
 /n-- Empty array --
 nil ✅
 Reset called - no crash ✅
 */

/*
 Что ты уже умеешь                          Как это называется
 Хранить состояние в структуре              Свойства экземпляра
 Менять состояние методами                  mutating
 Сбрасывать состояние вручную               Паттерн Reset
 Разделять логику обхода и сброса           Single Responsibility
 */
