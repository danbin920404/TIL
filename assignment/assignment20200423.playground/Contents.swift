import UIKit

//[ 과제 - 알고리즘 ]
//1. 정수 하나를 입력받은 뒤, 해당 숫자와 숫자 1사이에 있는 모든 정수의 합계 구하기
//e.g.  5 -> 1 + 2 + 3 + 4 + 5 = 15,   -2 -> -2 + -1 + 0 + 1 = -2
func sumNumbers(_ num: Int) -> Int {
  var result: Int = 0
  
  if num > 0 {
    for i in 1 ... num {
      result = result + i
    }
  } else {
    for i in num ... 1 {
      result = result + i
    }
  }
  
  return result
}
sumNumbers(5)
sumNumbers(-2)
sumNumbers(-5)

//2. 숫자를 입력받아 1부터 해당 숫자까지 출력하되, 3, 6, 9가 하나라도 포함되어 있는 숫자는 *로 표시
//e.g.  1, 2, *, 4, 5, *, 7, 8, *, 10, 11, 12, *, 14, 15, * ...
func 삼육구삼육구(num: Int) -> [Any] {
  var result: [Any] = []
  
  for i in 1 ... num {
    if String(i).contains("3") || String(i).contains("6") || String(i).contains("9") {
      result.append("*")
    } else {
      result.append(i)
    }
  }
  
  return result
}
삼육구삼육구(num: 20)

//3. 2개의 정수를 입력했을 때 그에 대한 최소공배수와 최대공약수 구하기
//e.g.  Input : 6, 9   ->  Output : 18, 3
//
//// 최대공약수
//// 1) 두 수 중 큰 수를 작은 수로 나눈 나머지가 0이면 최대 공약수
//// 2) 나머지가 0이 아니면, 큰 수에 작은 수를 넣고 작은 수에 나머지 값을 넣은 뒤 1) 반복
//
//// 최소 공배수
//// - 주어진 두 수의 곱을 최대공약수로 나누면 최소공배수
func commonMultipleAndDenominator(num1: Int, num2: Int) -> (Int, Int) {
  var op1 = num1, op2 = num2
  if op1 < op2 {
    swap(&op1, &op2)
  }
  
  while true {
    let r = op1 % op2
    (op1, op2) = (op2, r)
    if r == 0 { break }
  }
  let commonDenominator = op1
  let commonMultiple = num1 * num2 / commonDenominator
  return (commonMultiple, commonDenominator)
}



