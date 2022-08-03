import UIKit

// Перегрузка, функция с одним именем выполняет разные цели, работает с разными данным
func sum(value1: Int, value2: Int) -> Int {
    return value1 + value2
}

func sum(value1: Double, value2: Double) -> Double {
    return value1 + value2
}

print(sum(value1: 1, value2: 2))
print(sum(value1: 0.1, value2: 0.2))

let set1: Set<Int> = [1,2,3]

// Замыкания (Clousures)

let clousure = {
    print("Hi")
}

func testfunc(clousure: () -> ()) {
    print("testfunc")
    clousure()
}

testfunc(clousure: clousure)
//
//testfunc {
//    print("Hello")
//}

func delay() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        print("1")
    }
    print("2")
}

delay()

// Стуктуры

struct Woman {
    
    var height: Int
    var weight: Int
    var age: Int

    func printInfo() {
        print("height - \(height), weight - \(weight)")
    }

    mutating func growUp() {
        age += 1
    }
    
}

struct Man {
    
    var height: Int
    var weight: Int
    var age: Int

    func printInfo() {
        print("height - \(height), weight - \(weight)")
    }

    mutating func growUp() {
        age += 1
    }
    
}

var man = Man(height: 180, weight: 80, age: 19)
var man2 = Man(height: 200, weight: 40, age: 22)

man.weight
man.height
man.printInfo()
man.height = 200
man.height

func printManInfo(man: Man) {
    print(man.weight, man.height)
}

//printManInfo(man: man)
// height - ... , weight - ...

man.age
man.growUp()
man.age

// Модификаторы доступа

struct Car {
    private var wheelsCount: Int
    var engine: String

    init(wheelsCount: Int, engine: String) {
        self.wheelsCount = wheelsCount
        self.engine = engine
    }

    func getWheelsCount() -> Int {
        return wheelsCount
    }

}

let car = Car(wheelsCount: 4, engine: "v8")
car.getWheelsCount()

