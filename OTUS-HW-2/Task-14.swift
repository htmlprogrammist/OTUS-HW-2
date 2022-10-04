//
//  Task-14.swift
//  OTUS-HW-2
//
//  Created by Егор Бадмаев on 01.10.2022.
//

/**
 # Продвинутые функции и замыкания
 
 ## Цель:
 
 Закрепить знания, полученные во время лекции
 
 ## Описание/Пошаговая инструкция выполнения домашнего задания:
 
 Напишите несколько примеров и функций:
 
 * Функция, принимающая функцию как параметр
 * Функция с несколькими замыканиями
 * Функция с autoclosure
 * Использование внутренних функций
 * Дженерик-функция с условием
 * В Playground добавьте пример для демонстрации работы.
 
 ## Критерии оценки:
 
 *  Факт сдачи - 40 баллов
 * Функция, принимающая функцию как параметр - 10 баллов
 * Функция с несколькими замыканиями - 10 баллов
 * Функция с autoclosure - 10 баллов
 * Использование внутренних функций - 10 баллов
 * Дженерик-функция с условием - 10 баллов
 * Наличие примера - 10 баллов
 
 ## Примечание:
 Этот проект создан как macOS/Command Line Tool и в целом ничем не отличается от обычного Playground за исключением той детали, что вам не приходится ждать по 10 минут (или перезапускать по 10 раз Xcode), пока не запустится Playground: тут всё срабатывает моментально.
 */

// MARK: - Функция, принимающая функцию как параметр

func plus(a: Int, b: Int) -> Int {
    a + b
}

func multiply(a: Int, b: Int) -> Int {
    a * b
}

func increaseNumber(function: (Int, Int) -> Int, a: Int, b: Int) {
    print(function(a, b))
}

// MARK: - Функция с несколькими замыканиями

// 1-ая версия
let increment = { () -> Int in
    return 1
}

let doubleIncrement = { () -> Int in
    return 2
}

func add(number: inout Int, incrementers: () -> Int...) {
    for increment in incrementers {
        number += increment()
    }
}

// 2-ая версия (2 версии, т.к. не уверен, что правильно понял задание)
let wrapper = { (value: Int) -> String in
    return "Wrapped value of \(value)"
}

let output = {
    return 5
}

func wrapOutput(wrapper: (Int) -> String, output: () -> Int) {
    print(wrapper(output()))
}

// MARK: - Функция с autoclosure

func debugLog(_ isError: @autoclosure () -> Bool) {
    if isError() {
        print("There is some error occurred (как будто выводится сообщение об ошибке какой-то).")
    }
}

// MARK: - Использование внутренних функций

enum Measurement {
    case centimeters
    case meters
    case kilometers
}

func calculateLength(for length: Double, with measurement: Measurement) {
    func calculateCentimeters(length: Double) -> Double {
        return length
    }
    
    func calculateMeters(length: Double) -> Double {
        return length / 100
    }
    
    func calculateKilometers(length: Double) -> Double {
        return length / 1000
    }
    
    switch measurement {
    case .centimeters:
        print(calculateCentimeters(length: length))
    case .meters:
        print(calculateMeters(length: length))
    case .kilometers:
        print(calculateKilometers(length: length))
    }
}

// MARK: - Дженерик-функция с условием

func printContent<ContentType>(_ content: ContentType, configurationCheck: (ContentType, Int) -> Bool) where ContentType: Equatable {
    let copies = 1
    let isAllowed = configurationCheck(content, copies)
    
    if isAllowed {
        print("The printed content is: \(content).")
    } else {
        print("That content can not be printed.")
    }
}

// MARK: - Main

func task14() {
    /// # Функция, принимающая функцию как параметр.
    increaseNumber(function: plus(a:b:), a: 1, b: 2) // 3
    increaseNumber(function: multiply(a:b:), a: 2, b: 4) // 8
    
    /// # Функция с autoclosure.
    debugLog(1 < 2)
    debugLog(false)
    
    /// # Использование внутренних функций.
    calculateLength(for: 150, with: .centimeters)
    calculateLength(for: 1050.150, with: .meters)
    calculateLength(for: 20500.4, with: .kilometers)
    
    /// # Функция с несколькими замыканиями.
    var number = 10
    add(number: &number, incrementers: increment, doubleIncrement)
    print(number) // 13
    
    wrapOutput(wrapper: wrapper, output: output) // Wrapped value of 5
    
    /// # Дженерик-функция с условием
    printContent("String Content") { content, number in
        // просто такая проверка: если длина переданной строки больше, чем число копий, то "разрешаем"
        content.count > number
    }
    printContent(123) { content, number in
        // если само число больше, чем число копий, то мы его выводим
        content > number
    }
}
