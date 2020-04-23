import UIKit

/*
 학점을 입력받아 각각의 등급을 반환해주는 함수
 (등급 예시 : 4.5 = A+,  < 4.5 = A,  < 4.0 = B+,  < 3.5 = B,   < 3.0 = F)
 */
func calculateGrade(score: Double) -> String {
  switch score {
  case 4.5: return "A+"
  case 4.0..<4.5: return "A"
  case 3.5..<4.0: return "B+"
  case 3.0..<3.5: return "B"
  default: return "F"
  }
}

// 특정 달을 숫자로 입력 받아서 문자열로 반환하는 함수 (1 = "Jan" , 2 = "Feb")
func num2str(month: Int) -> String {
  switch month {
  case 1: return "Jan"
  case 2: return "Feb"
  case 3: return "Mar"
  case 4: return "Apr"
  case 5: return "May"
  case 6: return "Jun"
  case 7: return "Jul"
  case 8: return "Aug"
  case 9: return "Sep"
  case 10: return "Oct"
  case 11: return "Nov"
  case 12: return "Dec"
  default: return "Error"
  }
}

/*
 세 수를 입력받아 세 수의 곱이 양수이면 true, 그렇지 않으면 false 를 반환하는 함수
 switchwhere clause로 풀 수 있다면 해보기
 */
func isPositiveNumber(first: Int, second: Int, third: Int) -> Bool {
  // 3항 연산자 이용한 방법
  first * second * third > 0 ? true : false
  
  
  // switch where clause 이용한 방법 예시
  
  // 1)
//  let number = first * second * third
//  switch number {
//  case let x where x > 0:
//    return true
//  default:
//    return false
//  }

  // 2)
//  let num = (first, second, third)
//  switch num {
//  case let (x, y, z) where x * y * z > 0:
//    return true
//  default:
//    return false
//  }
}

//- 두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 정수로 반환하는 함수
//  (1과 5 입력 시 15,  29와 30 입력 시 2930,  6과 100 입력 시 6100)
func combineTwoNumbers(_ number1: Int, _ number2: Int) -> Int {
    var tempNumber2 = number2
    var numberOfCount = 1
    
    while tempNumber2 > 0 {
        numberOfCount *= 10
        tempNumber2 /= 10
    }
    return (number1 * numberOfCount) + number2
}

//- 문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수
func isLengthCheck(str1: String, str2: String) -> Bool {
  str1.count == str2.count ? true : false
}

//- 자연수를 입력받아 그 수의 약수를 모두 출력하는 함수
func FactorPrint(num: Int) -> [Int] {
  var result: [Int] = []
  for i in 1...num {
    if num % i == 0 {
      result.append(i)
    }
  }
  return result
}

//- 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수
func printCommonMultipleOfThreeAndFive() {
  for i in 1...100 {
    if i.isMultiple(of: 3), i.isMultiple(of: 5) {
      print(i)
    }
  }
}

//[ 도전 과제 ]
//- 2 이상의 자연수를 입력받아, 소수인지 아닌지를 판별하는 함수
func isPrimeNumber(_ number: Int) -> Bool {
  guard number > 1 else { return false }
  guard number != 2 else { return true }
  
  for i in 2..<number {
    if number % i == 0 {
      return false
    }
  }
  return true
}

//- 자연수 하나를 입력받아 피보나치 수열 중에서 입력받은 수에 해당하는 자리의 숫자를 반환하는 함수
//  참고로 피보나치 수열은 이전 두 수의 합이 다음 수가 되는 수열
//  e.g.  0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89 ....
//  함수 호출 시 입력받은 숫자가 4인 경우 피보나치 수열의 4번째 위치인 2 출력
func fibonacciNumber(at index: Int) -> Int {
  var op1 = 0, op2 = 1
  
  for i in 0..<index {
    if i % 2 == 0 {
      op1 += op2
    } else {
      op2 += op1
    }
  }
  
  return index % 2 == 0 ? op1 : op2
}
