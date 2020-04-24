import UIKit

//[ 과제 ]
//1. 옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수
func optional(str1: String?, str2: String?, str3: String?) -> String {
  var result: String = ""
  if let str1 = str1, let str2 = str2, let str3 = str3 {
    result = str1 + str2 + str3
  }
  
  return result
}

//2. 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic과 2개의 자연수를 입력 파라미터로 받아 (파라미터 총 3개) 해당 연산의 결과를 반환하는 함수 구현
//enum Arithmetic {
//  case addition, subtraction, multiplication, division
//}
enum Arithmetic {
  case addition, subtraction, multiplication, division
}

func calculator(operand1: Int, operand2: Int, op: Arithmetic) -> Int {
  switch op {
  case .addition:
    return operand1 + operand2
  case .subtraction:
    return operand1 - operand2
  case .multiplication:
    return operand1 * operand2
  case .division:
    return Int(operand1 / operand2)
  }
}

//[ 도전 과제 ]
//1. celcius, fahrenheit, kelvin 온도 3가지 케이스를 가진 enum 타입 Temperature 를 정의
//각 케이스에는 Double 타입의 Associated Value 를 받도록 함
//
//추가로 Temperature 타입 내부에 각 온도를 섭씨 온도로 변환해주는 toCelcius() 함수를 구현
//섭씨 = (화씨 - 32) * 5 / 9
//섭씨 = 켈빈 + 273
enum Temperature {
  case celcius(Double)
  case fahrenheit(Double)
  case kelvin(Double)
  
  func info() -> Double {
    switch self {
    case .celcius(let a):
      return a
    case .fahrenheit(let b):
      return (b * 32) * 5 / 9
    case .kelvin(let c):
      return c + 273
    }
  }
}




