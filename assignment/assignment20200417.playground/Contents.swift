import UIKit

//Closure

// 클로저 Full Syntax <-> Optimized Syntax 변환 연습

//문자열을 입력받으면 그 문자열의 개수를 반환하는 클로져 구현
let performClosure1 = { (str: String) -> Int in
  return str.count
}
performClosure1("12345") // 5

let performClosure2: (String) -> Int = { str in
  return str.count
}
performClosure2("1234567") // 7

func performClosure(param: (String) -> Int) {
  param("abcd") // 4
}

performClosure(param: { (str: String) -> Int in
  return str.count
})

performClosure { (str: String) -> Int in
  return str.count
}

performClosure(param: { str in
  return str.count
})

performClosure(param: {
  return $0.count
})

performClosure(param: ) {
  $0.count
}

performClosure() {
  $0.count
}

performClosure { $0.count}

//숫자 하나를 입력받은 뒤 1을 더한 값을 반환하는 클로져 구현

let closureWithParamAndReturnType1: (Int) -> Int = { param in
  return param + 1
}

let closureWithParamAndReturnType2 = { (param: Int) -> Int in
  return param + 1
}

let closureWithParamAndReturnType3 = { param in
  param + 1
}

closureWithParamAndReturnType1(1) // 2
closureWithParamAndReturnType2(50) // 51
closureWithParamAndReturnType3(100) // 101

func closureWithParamAndReturnType(param: (Int) -> Int) {
  param(10)
}

closureWithParamAndReturnType(param: { (num: Int) -> Int in
  return num + 1
})

closureWithParamAndReturnType(param: { (num: Int) in
  return num + 1
})

closureWithParamAndReturnType(param: { num in
  return num + 1
})

closureWithParamAndReturnType(param: {
  return $0 + 1
})

closureWithParamAndReturnType(param: ) {
  $0 + 1
}
closureWithParamAndReturnType() {
  $0 + 1
}

// 정수를 하나 입력받아 2의 배수 여부를 반환하는 클로져
let isMultipleOfTwo1: (Int) -> Bool = { param in
  return param % 2 == 0
}

let isMultipleOfTwo2 = { (param: Int) -> Bool in
  return param % 2 == 0
}

let isMultipleOfTwo3 = { param in
  return param % 2 == 0
}
isMultipleOfTwo1(3) // false(홀수)
isMultipleOfTwo2(10) // true(짝수)
isMultipleOfTwo3(2) // true(짝수)

func isMultipleOfTwo(param: (Int) -> Bool) {
  param(5)
}

isMultipleOfTwo(param: {(num: Int) -> Bool in
  return num % 2 == 0
})

isMultipleOfTwo(param: { (num: Int) in
  return num % 2 == 0
})

isMultipleOfTwo(param: { num in
  return num % 2 == 0
})

isMultipleOfTwo(param: {
   $0 % 2 == 0
})

isMultipleOfTwo(param: ) {
  $0 % 2 == 0
}

isMultipleOfTwo() {
  $0 % 2 == 0
}

isMultipleOfTwo { $0 % 2 == 0}

// 정수를 두 개 입력 받아 곱한 결과를 반환하는 클로져
let multiplication1: (Int, Int) -> Int = { param1, param2 in
  return param1 * param2
}

let multiplication2 = { (param1: Int, param2: Int) -> Int in
  return param1 * param2
}
multiplication1(5, 10) // 50
multiplication2(3, 5) // 15

func multiplication(param: (Int, Int) -> Int) {
  param(5, 10)
}

multiplication(param: { (num1: Int, num2: Int) -> Int in
  return num1 * num2
})

multiplication(param: { (num1: Int, num2: Int) in
  return num1 * num2
})

multiplication(param: { num1, num2 in
  return num1 * num2
})

multiplication(param: {
  return $0 * $1
})

multiplication(param: {
  $0 * $1
})

multiplication(param: ) {
  $0 * $1
}

multiplication() {
  $0 * $1
}

multiplication { $0 * $1}

//// 오름차순 여부
//let someClosure: (String, String) -> Bool = { (s1: String, s2: String) -> Bool in
//  let isAscending: Bool
//  if s1 > s2 {
//    isAscending = true
//  } else {
//    isAscending = false
//  }
//  return isAscending
//}
let someClosure1: (String,String) -> Bool = { $0 > $1 }
someClosure1("aaa", "a") // true

//// 배열 요소의 개수를 반환
//let otherClosure: ([Int]) -> Int = { (values: [Int]) -> Int in
//  var count: Int = 0
//  for _ in values {
//    count += 1
//  }
//  return count
//}
let otherClosure: ([Int]) -> Int = { $0.count }
otherClosure([1,2,3,4,5]) // 5









