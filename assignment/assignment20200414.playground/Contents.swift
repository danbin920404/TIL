import UIKit

//[ 과제 ]
/*
[보기] 철수 - apple, 영희 - banana, 진수 - grape, 미희 - strawberry
위 보기처럼 학생과 좋아하는 과일을 매칭시킨 정보를 Dictionary 형태로 만들고
스펠링에 'e'가 들어간 과일을 모두 찾아 그것과 매칭되는 학생 이름을 배열로 반환하는 함수
*/
let prefFruits = [
  "철수": "apple",
  "영희": "banana",
  "진수": "grape",
  "미희": "strawberry"
]

func searchContainingE(dic: [String : String]) -> [String] {
  var result: [String] = []
  
  for (key, value) in dic {
    if value.contains("e") {
      result.append(key)
    }
  }
  
  return result
}

/*
임의의 정수 배열을 입력받았을 때 홀수는 배열의 앞부분, 짝수는 배열의 뒷부분에 위치하도록 구성된 새로운 배열을 반환하는 함수
ex) [2, 8, 7, 1, 4, 3] -> [7, 1, 3, 2, 8, 4]
*/
func swapNumbers(arr: [Int]) -> [Int] {
  var result: [Int] = []
  var arrIndexCount: Int = 0
  
  for i in arr {
    if i.isMultiple(of: 2) {
      result.append(i)
    } else {
      result.insert(i, at: arrIndexCount)
      arrIndexCount += 1
    }
  }
  
  return result
}

//- 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
//  ex) 123 -> 321 , 10293 -> 39201
func reversNum(num: Int) -> Int {
  var result: Int = 0
  var number = num
  var numStr: String = ""
  
  while number > 0 {
    numStr = numStr + String(number % 10)
    number = number / 10
  }
  
  if let resultStr = Int(numStr) {
    result = resultStr
  }
  
  return result
}

//
//- 100 ~ 900 사이의 숫자 중 하나를 입력받아 각 자리의 숫자가 모두 다른지 여부를 반환하는 함수
//  ex) true - 123, 310, 369   /  false - 100, 222, 770
func isAllDigitDiff(num: Int) -> Bool {
  let numStr = String(num)
  let uniqueValues = Set(numStr)
  return uniqueValues.count == numStr.count
}

//[ 도전 과제 ]
//- 주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수
//  ex) ["a", "b", "c", "a", "e", "d", "c"]  ->  ["b", "e" ,"d"]
func printUniqueValues(from arr: [String]) -> [String] {
  var recordArr: [String] = []
  var result: [String] = []
  
  for str in arr {
    if !result.contains(str) && !recordArr.contains(str) {
      result.append(str)
    } else if let index = result.firstIndex(of: str) {
      result.remove(at: index)
      recordArr.append(str)
    }
  }
  
  return result
}
