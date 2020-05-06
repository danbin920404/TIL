import UIKit

//1.
//func addTwoValues(a: Int, b: Int) -> Int {
//  return a + b
//}
//let task1: Any = addTwoValues(a: 2, b: 3)
//
//위와 같이 정의된 변수 task1이 있을 때 다음의 더하기 연산이 제대로 동작하도록 할 것
//task1 + task1

func addTwoValues(a: Int, b: Int) -> Int {
  return a + b
}

let task1: Any = addTwoValues(a: 2, b: 3)

func addtask1() -> Int {
  if let int = task1 as? Int {
    return int + int
  }
  
  return 0
}
addtask1()

//1.
//let task2: Any = addTwoValues
//과제 1번에 이어 이번에는 위와 같이 정의된 task2 변수에 대해
//두 변수의 더하기 연산이 제대로 동작하도록 할 것
//(addTwoValues의 각 파라미터에는 원하는 값 입력)
//
//task2 + task2

let task2: Any = addTwoValues

if let task22 = task2 as? (Int, Int) -> Int {
  task22(12, 23) + task22(22, 111)
}


func addTask2(num1: Int, num2: Int) -> Int {
  var result: Int = 0
  
  if let task2 = task2 as? (Int, Int) -> Int {
    result = task2(num1, num2)
  }
  
  return result + result
}
addTask2(num1: 3, num2: 5)



//아래 values 변수의 각 값을 switch 문과 타입캐스팅을 이용해 출력하기

class Car {}
let values: [Any] = [
  1,
  99.9,
  (2.0, Double.pi),
  Car(),
  { (str: String) -> Int in str.count }
]

for value in values {
  switch value {
  case let a where a as? Int != nil:
    print(a)
  case let a where a as? Double != nil:
    print(a)
  case let a where a as? (Double, Double) != nil:
    print(a)
  case let a where a as? Car != nil:
    print(a)
  case let a where a as? (String) -> Int != nil:
    print(a)
  default:
    break
  }
}



