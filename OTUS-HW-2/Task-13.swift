//
//  Task-13.swift
//  OTUS-HW-2
//
//  Created by Егор Бадмаев on 01.10.2022.
//

/**
 # Создание класса-дженерика
 
 ## Цель:
 
 Закрепить знания, полученные на лекции

 ## Описание/Пошаговая инструкция выполнения домашнего задания:
 
 1. Реализуйте дженерик-класс для структуры данных Stack, Deque или Queue.
 2. Класс должен содержать дженерик-методы согласно выбранному типу структуры данных.
 3. В Playground основном пространстве напишите пример с использованием созданного класса
 https://ru.wikipedia.org/wiki/Двухсторонняя_очередь
 https://ru.wikipedia.org/wiki/Стек
 https://ru.wikipedia.org/wiki/Очередь_(программирование)

 ## Критерии оценки:
 
 Факт сдачи - 40 баллов
 Реализация класса выбранного типа - 30 баллов
 Пример с использованием - 20 баллов
 
 ## Примечание:
 Этот проект создан как macOS/Command Line Tool и в целом ничем не отличается от обычного Playground за исключением той детали, что вам не приходится ждать по 10 минут (или перезапускать по 10 раз Xcode), пока не запустится Playground: тут всё срабатывает моментально.
 */

class Stack<Element> {
    private var stack = [Element]()
    
    /// Метод, добавляющий элемент на вершину стека.
    /// - Parameter item: Элемент, который предстоит добавить в стек.
    public func push(_ item: Element) {
        stack.append(item)
    }
    
    /// Метод, удаляющий самый верхний элемент стека и возвращающий его.
    /// - Returns: Элемент, лежащий на вершине стека.
    public func pop() -> Element {
        stack.removeLast()
    }
}

// Program flow
func task13() {
    /// Пример использования стека для целочисленного типа.
    let stackInt = Stack<Int>()
    stackInt.push(1)
    stackInt.push(2)
    stackInt.push(3)
    
    var outputInt = [Int]()
    outputInt.append(stackInt.pop())
    outputInt.append(stackInt.pop())
    
    print(outputInt) // 3, 2 (если не так, то ошибка)
    
    /// Пример использования стека для строчного типа.
    let stackString = Stack<String>()
    stackString.push("A")
    stackString.push("B")
    stackString.push("C")
    
    var outputString = [String]()
    outputString.append(stackString.pop())
    outputString.append(stackString.pop())
    
    print(outputString) // C, B (если не так, то ошибка)
}
