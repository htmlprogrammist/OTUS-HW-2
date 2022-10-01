//
//  Task-11.swift
//  OTUS-HW-2
//
//  Created by Егор Бадмаев on 01.10.2022.
//

/**
 # ООП и наследование
 
 ## Цель:
 
 Закрепить полученные знания по ООП и наследованию

 ## Описание/Пошаговая инструкция выполнения домашнего задания:
 
 В Playground реализуйте некоторый базовый класс из выбранной вами области описания (тематики).
 Добавьте в него свойства и методы, а также несколько инициализаторов. Класс должен содержать свойства и методы разной области видимости (private, fileprivate, internal или public)
 Создайте несколько классов-наследников. Переопределите при необходимости свойства и методы родителя. А также добавьте свои.
 В основном пространстве Playground создайте функцию для демонстрации полиморфизма.
 К заданию приложите либо архив с Playground, либо ссылку на гитхаб репозиторий, куда загрузите код.

 ## Критерии оценки:
 
 Факт сдачи - 40 баллов
 Есть базовый класс и хотя бы 1 класс наследник - 20 баллов
 Показаны различные модификатора доступа - 10 баллов
 Есть переопределенные свойства и методы - 10 баллов
 Есть пример полиморфизма - 10 баллов
 
 ## Примечание:
 
 Этот проект создан как macOS/Command Line Tool и в целом ничем не отличается от обычного Playground за исключением той детали, что вам не приходится ждать по 10 минут (или перезапускать по 10 раз Xcode), пока не запустится Playground: тут всё срабатывает моментально.
 */

import Foundation

/// Базовый класс "Оружия".
class Weapon {
    
    // MARK: - Public Properties
    
    /// Текущее количество патронов.
    /// Например: 13/30, `currentNumberOfBullets == 13, numberOfBulletsInClip == 30`
    public var currentNumberOfBullets: Int = 0
    /// Обойма, магазин (общее количество патронов).
    public var numberOfBulletsInClip: Int
    
    // MARK: - Private Properties
    
    /// Время перезарядки.
    private let reloadingTime: Int
    
    // MARK: - Init
    
    init(numberOfBulletsInClip: Int, reloadingTime: Int) {
        self.numberOfBulletsInClip = numberOfBulletsInClip
        self.reloadingTime = reloadingTime
    }
    
    // MARK: - Public Methods
    
    public func shoot() {
        if currentNumberOfBullets > 0 {
            print("Выстрел!")
        } else {
            print("*Щёлк* (пустой магазин)")
        }
    }
    
    /// Метод, отвечающий за перезарядку.
    public func reload() {
        print("Перезарядка...")
        sleep(UInt32(reloadingTime))
        currentNumberOfBullets = numberOfBulletsInClip // по максимуму заполняем текущее количество патрон в магазин
    }
}

/// Класс для описания автоматического оружия.
class AutomaticWeapon: Weapon {
    
    // MARK: - Private Properties
    
    /// Режим стрельбы.
    private var shootingMode: ShootingMode = .single
    
    // MARK: - Public Methods
    
    public func changeShootingMode(to mode: ShootingMode) {
        shootingMode = mode
    }
    
    override func shoot() {
        if currentNumberOfBullets > 0 {
            switch shootingMode {
            case .queue:
                currentNumberOfBullets -= 3
                print("Выстрел! Выстрел! Выстрел!")
            case .automatic:
                let numberOfShots = Int.random(in: 1...currentNumberOfBullets)
                currentNumberOfBullets -= numberOfShots
                print("\(numberOfShots) выстрела(ов)!")
            case .single:
                currentNumberOfBullets -= 1
                print("Выстрел!")
            }
        } else {
            print("*Щёлк* (пустой магазин)")
        }
    }
}

enum ShootingMode {
    case queue
    case automatic
    case single
}

func task11() {
    let ak = AutomaticWeapon(numberOfBulletsInClip: 30, reloadingTime: 4)
    ak.reload()
    ak.changeShootingMode(to: .automatic)
    ak.shoot()
    ak.shoot()
    ak.shoot()
}
