
//  enumReflection.swift
//  IPOAlgorithms
//
//  Created by Валерия Пономарева on 08.08.2026.
//

import Foundation

struct EnumReflection {
    static func run() {
        print("▶️ Run: '🤖🔥 Enum & Self Reflection File'")
        
        // MARK: - ⚙️ ШПОРА ПО АРХИТЕКТУРЕ: УМНЫЙ ENUM И СЕБЯШЕЧКА (SELF)
        
        /*
         1. ЧТО ТАКОЕ ENUM В SWIFT?
         
         Это НЕ просто список слов. Это VALUE TYPE (тип-значение), как и struct.
         Он копируется при передаче, живет изолированно и может иметь:
            - свой init
            - вычисляемые свойства (computed properties)
            - методы
            - ассоциированные значения
         */
        
        // MARK: - 🔥 ASSOCIATED VALUES (АССОЦИИРОВАННЫЕ ЗНАЧЕНИЯ)
        
        /*
         Ассоциированные значения — это данные, которые каждый конкретный кейс enum может хранить внутри себя.
         
         ВАЖНО: Это не какой-то специальный тип. Это просто место внутри enum,
         куда можно положить ЧТО УГОДНО:
            - Int, String, Array, struct → value type (копируется)
            - class, closure → reference type (ссылка)
         
         ОТЛИЧИЕ ОТ RAW VALUES (СЫРЫХ ЗНАЧЕНИЙ):
         
         ┌─────────────────────┬──────────────────────────┬─────────────────────────────┐
         │ Аспект              │ ASSOCIATED VALUES        │ RAW VALUES                  │
         ├─────────────────────┼──────────────────────────┼─────────────────────────────┤
         │ Когда задаются      │ В момент создания        │ НАВСЕГДА в определении enum │
         ├─────────────────────┼──────────────────────────┼─────────────────────────────┤
         │ Могут различаться   │ ДА! Каждый .coder         │ НЕТ! Все кейсы одного enum  │
         │                     │ может нести свои данные  │ имеют raw value одного ТИПА  │
         ├─────────────────────┼──────────────────────────┼─────────────────────────────┤
         │ Пример              │ case coder(data: [String])│ enum Status: String {      │
         │                     │                          │     case ok = "OK"          │
         ├─────────────────────┼──────────────────────────┼─────────────────────────────┤
         │ Где живут           │ ВНУТРИ каждого кейса     │ Привязаны к ТИПУ enum       │
         └─────────────────────┴──────────────────────────┴─────────────────────────────┘
         
         // ASSOCIATED VALUES (у каждого свои данные)
         enum Response {
             case success(data: [String])    // Внутри лежит массив
             case error(code: Int)           // Внутри лежит число
             case loading(progress: Double)  // Внутри лежит Double
         }
         
         // RAW VALUES (все кейсы одного типа)
         enum HttpCode: Int {
             case ok = 200
             case notFound = 404
             case serverError = 500
         }
         */
        
        // MARK: - 🪞 КЛЮЧЕВОЕ СЛОВО self ("Себяшечка")
        
        /*
         self — это указатель объекта на самого себя.
         
         "Я" (на русском) = "myself" (на английском) = "self" (в Swift)
         
         Пример: 'vale.ponick - programmer' == self.programmer
         
         АНАЛОГИЯ ИЗ СРЕДИЗЕМЬЯ:
         
         Представь: форма для литья металла — это память под enum.
         Эльфы залили туда расплавленное золото.
         
         Без self =: Саурон залил золото, но забыл сказать эльфам,
         какую форму он отливает. Металл застыл в бесформенный слиток.
         Swift говорит: «Я такое не принимаю, это брак!».
         
         С self = .ring: Саурон говорит эльфам: «Мы отливаем кольцо».
         Металл застыл → получилось Единое Кольцо, с которым можно покорить мир.
         
         self = .кейс ➡️ Объект говорит: "Я становлюсь вот этим кейсом".
         switch self ➡️ Объект говорит: "Смотрю в зеркало на себя, чтобы понять, кто я".
         */
        
        // MARK: - 📝 ПРИМЕР: ENUM С ПРОФЕССИЯМИ
        
        /*
         enum Vale {
             case programmer(name: String)
             case professor(name: String)
             case historicOfLaw(name: String)
             case unknown
         }
         
         extension Vale {
             init(jobTitle: String, name: String) {
                 if jobTitle == "iOS Developer" {
                     self = .programmer(name: name) // Я сказала, кто я!
                 } else if jobTitle == "Professor" {
                     self = .professor(name: name)
                 } else if jobTitle == "HistoricOfLaw" {
                     self = .historicOfLaw(name: name)
                 } else {
                     self = .unknown // "Я неизвестно кто"
                 }
             }
         }
         
         // СОЗДАЕМ ЭКЗЕМПЛЯРЫ
         let me = Vale.programmer(name: "vale.ponick")
         let teacher = Vale.professor(name: "VVP")
         let researcher = Vale.historicOfLaw(name: "Valery Ponomareva")
         
         // ИСПОЛЬЗУЕМ (switch self)
         switch me {
         case .programmer(let name):
             print("\(name) — программист, учит Swift")
         case .professor(let name):
             print("\(name) — профессор, преподает")
         case .historicOfLaw(let name):
             print("\(name) — историк права")
         case .unknown:
             print("Кто-то неизвестный")
         }
         // Вывод: "vale.ponick — программист, учит Swift"
         */
        
        // MARK: - 📝 АНАЛОГИЯ: АНКЕТА
        
        /*
         АНАЛОГИЯ (САМАЯ ПРОСТАЯ):
            Представь, что ты заполняешь анкету:
                Вопрос: "Кто вы?"
                Ты пишешь: "Я — программист" ← это и есть self = .programmer
                Другой человек смотрит на анкету и говорит: "О, он программист!" ← это switch self
         */
        
        // MARK: - 🏗️ РАЗБОР СИНТАКСИСА ИНИЦИАЛИЗАТОРА: init(_ value: Int?)
        
        /*
         init ➡️ Код, который срабатывает ОДИН РАЗ в момент рождения объекта.
         
         _ ➡️ Магия Swift. Позволяет не писать имя параметра при создании:
             let rating = Rating(777)  // вместо Rating(value: 777)
         
         value ➡️ Внутреннее имя параметра, доступно только внутри { } инициализатора.
         
         Int? ➡️ Опционал. Говорим: "Я готов принять на вход число или nil".
         */
        
        // MARK: - ❓ ЗАЧЕМ НУЖЕН self = ... ВНУТРИ init?
        
        /*
         Синтаксически: Мы обязаны сказать enum, какой кейс он представляет.
         Технически (связь с памятью):
            Память под объект уже выделена. self = ... заполняет эту память
            правильной «биркой» (tag) и сохраняет туда переданные значения.
         
            Если этого не сделать, в памяти останется «неопределенное» (невалидное) состояние,
            а Swift строг к типам — он не позволит объекту существовать без четкой идентификации.
         
            Без self = — ошибка компиляции!
        */
        
        // MARK: - 🌿 ПРАВИЛО ВЕТВЛЕНИЯ В INIT
        
        /*
         Внутри init мы анализируем входные данные и в зависимости от условий присваиваем self.
         
         ВАЖНО: Веток должно быть не больше 3-5. Если больше — упрощай логику!
         
         init(json: [String: Any]) {
             // ВЕТКА 1: Ошибка
             if json["error"] != nil {
                 self = .error(code: 500)
                 return
             }
             
             // ВЕТКА 2: Успешные данные
             if let data = json["data"] as? [String] {
                 self = .success(data: data)
                 return
             }
             
             // ВЕТКА 3: Прогресс
             if let progress = json["progress"] as? Double {
                 self = .loading(progress: progress)
                 return
             }
             
             // ВЕТКА 4: Всё остальное (ОБЯЗАТЕЛЬНАЯ!)
             self = .unknown
         }
         
         ПРАВИЛА:
         1. Каждая ветка (if, else if, guard) должна заканчиваться self = ...
         2. Нельзя оставить объект "неопределенным"
         3. Всегда добавляй последнюю ветку для "всего остального"
         */
        
        // MARK: - 🎯 PATTERN MATCHING - с англ. пер. "СОПОСТАВЛЕНИЕ С ОБРАЗЦОМ'
        
        /*
         'Pattern Matching' — это механизм, который одновременно:
            1. Проверяет, какой кейс у enum
            2. Извлекает ассоциированные значения в переменные
         
         ТРИ СПОСОБА:
         
         1. SWITCH (самый надежный и полный)
         switch state {
         case .success(let data):
             print(data)
         case .error(let code):
             print(code)
         }
         
         2. IF CASE LET (для проверки одного кейса)
         if case let .success(data) = state {
             print(data)
         }
         
         3. GUARD CASE LET (для раннего выхода)
         guard case let .success(data) = state else {
             print("Не успех")
             return
         }
         print(data)
         */
        
        // MARK: - 🔍 WHERE (ДОПОЛНИТЕЛЬНЫЕ УСЛОВИЯ)
        
        /*
         where позволяет добавлять условия прямо в строку case:
         
         switch response {
         case .success(let data) where data.isEmpty:
             print("Успех, но данных нет")
             
         case .success(let data) where data.count > 10:
             print("Много данных: \(data.count)")
             
         case .success(let data):
             print("Данные: \(data)")
             
         case .loading(let progress) where progress == 1.0:
             print("Загрузка завершена!")
             
         case .loading(let progress):
             print("Загрузка: \(Int(progress * 100))%")
             
         default:
             print("Другое состояние")
         }
         */
        
        // MARK: - 🤖 АНАЛОГИЯ: РОБОТ-СОРТИРОВЩИК
        
        /*
         АНАЛОГИЯ ИЗ ЖИЗНИ: РОБОТ-СОРТИРОВЩИК НА ЗАВОДЕ
         
         Представь робота (это наш Enum). К нему на конвейер едет коробка value (это init).
         В коробке может быть деталь (Int), брак (вне диапазона) или пустота (nil).
         
         Робот заглядывает внутрь коробки (код внутри init):
         - Видит пустоту? ➡️ Наклеивает на себя наклейку self = .missing
         - Видит брак?    ➡️ Наклеивает на себя наклейку self = .invalid
         - Видит деталь?  ➡️ Кладет её в свой карман и клеит наклейку self = .score(деталь)
         
         А когда директор завода спрашивает: "Какой результат?",
         робот смотрит на свою наклейку (switch self),
         достает если надо деталь из кармана (let value)
         и выдает финальный отчет (return result).
         */
        
        // MARK: - 🔄 ЖИЗНЕННЫЙ ЦИКЛ ENUM (ДВЕ ФАЗЫ)
        
        /*
         ┌─────────────┬──────────────┬──────────────────────────────────┬───────────────────┐
         │ Фаза        │ Кто          │ Что делает                       │ Ключевое слово    │
         ├─────────────┼──────────────┼──────────────────────────────────┼───────────────────┤
         │ Рождение    │ init         │ Превращает сырые данные в кейс   │ self = .кейс      │
         ├─────────────┼──────────────┼──────────────────────────────────┼───────────────────┤
         │ Использование│ Любая функция│ Анализирует, кто мы, и достает  │ switch self       │
         │             │              │ данные                           │ + case let        │
         └─────────────┴──────────────┴──────────────────────────────────┴───────────────────┘
         */
        
        // MARK: - 📋 ГОТОВЫЙ ШАБЛОН (ДЛЯ КОПИРОВКИ)
        
        /*
         enum MyState {
             case success(data: [String])
             case error(code: Int)
             case loading(progress: Double)
             case unknown
         }
         
         extension MyState {
             init(json: [String: Any]) {
                 // ВЕТКА 1: Ошибка
                 if json["error"] != nil {
                     self = .error(code: 500)
                     return
                 }
                 
                 // ВЕТКА 2: Данные
                 if let data = json["data"] as? [String] {
                     self = .success(data: data)
                     return
                 }
                 
                 // ВЕТКА 3: Прогресс
                 if let progress = json["progress"] as? Double {
                     self = .loading(progress: progress)
                     return
                 }
                 
                 // ВЕТКА 4: Всё остальное (ОБЯЗАТЕЛЬНАЯ!)
                 self = .unknown
             }
         }
         
         func handle(state: MyState) {
             switch state {
             case .success(let data) where data.isEmpty:
                 print("Пусто")
                 
             case .success(let data):
                 print("Данные: \(data)")
                 
             case .error(let code) where code == 404:
                 print("Не найдено")
                 
             case .error(let code):
                 print("Ошибка: \(code)")
                 
             case .loading(let progress) where progress == 1.0:
                 print("Готово")
                 
             case .loading(let progress):
                 print("Загрузка: \(Int(progress * 100))%")
                 
             case .unknown:
                 print("Неизвестно")
             }
         }
         */
        
        // MARK: - ✅ ЧЕК-ЛИСТ (ДЛЯ ПРОВЕРКИ СЕБЯ)
        
        /*
         Когда ты пишешь умный enum, проверь себя:
         
         [ ] Мой enum описывает ВСЕ возможные состояния системы?
         [ ] Я использую init, чтобы превращать сырые данные в enum?
         [ ] Внутри init я ОБЯЗАТЕЛЬНО присваиваю self = .какой-то-кейс?
         [ ] У меня не больше 3-5 веток в init?
         [ ] Я использую switch self + case let для извлечения данных?
         [ ] Я добавляю where для дополнительной фильтрации?
         [ ] Я никогда не использую ! (force unwrap) внутри enum?
         [ ] Мой switch покрывает все кейсы (компилятор не ругается)?
         [ ] Я добавил "запасной" кейс (например, .unknown) для всего остального?
         */
        
        print("✅ Шпора загружена! Используй как справочник.")
    }
}
