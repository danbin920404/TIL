import UIKit

/*
 1. width, height 속성을 가진 Rectangle 클래스 정의
 2. 생성자(초기화 메서드)에서 width, height 프로퍼티 값을 설정할 수 있도록 구현
 3. 사각형의 가로 세로 길이를 변경할 수 있는 메서드 구현
 4. 사각형 가로와 세로의 길이를 반환하는 메서드 구현
 5. 사각형의 넓이를 반환하는 메서드 구현
 6. 다음과 같은 속성을 지닌 인스턴스 생성
 - 직사각형 1개 속성: width = 10, height = 5
 - 정사각형 1개 속성: width = 7, height = 7
 */
class Rectangle {
  var width: Double
  var height: Double
  
  init(w: Double, h: Double) {
    self.width = w
    self.height = h
  }
  
  func widthChange(w: Double) {
    self.width = w
  }
  
  func heightChange(h: Double) {
    self.width = h
  }
  
  func widthAndHeight() -> (Double, Double) {
    return (self.width, self.height)
  }
  
  func area() -> Double {
    return self.width * self.height
  }
}

/*
 1. 채널 정보, Volume 값, 전원 설정여부를 속성으로 가지는 클래스 정의
 2. TV 의 현재 채널 및 볼륨을 변경 가능한 메서드 구현
 3. TV 의 현재 채널 및 볼륨을 확인할 수 있는 메서드 구현
 4. TV 전원이 꺼져있을 때는 채널과 볼륨 변경을 할 수 없도록 구현
    (직접 프로퍼티에 값을 설정할 수 없다고 가정)
 5. 채널과 볼륨 정보를 확인했을 때 TV 전원이 꺼져있으면 -1 이 반환되도록 구현
 */
class TV {
  var volume: Int = 15
  var channel: Int = 10
  var power: Bool = false
  
  func change(vol: Int, ch: Int) {
    if power {
      self.volume = vol
      self.channel = ch
    } else {
      print("전원이 꺼져있습니다.")
    }
  }
  
  func check() -> Any {
    if power {
      return (self.volume, self.channel)
    }
    return -1
  }
}

/*
 사각형의 길이를 설정하는 초기화 메서드, 둘레와 넓이값을 구하는 메서드 구현
*/
class Square {
  var width: Int
  var height: Int
  
  init(w: Int, h: Int) {
    self.width = w
    self.height = h
  }
  
  func circumference() -> Int {
    return (width + height) * 2
  }
  
  func area() -> Int {
    return width * height
  }
}

// ** 강아지 (Dog)
// - 속성: 이름, 나이, 몸무게, 견종
// - 행위: 짖기, 먹기
class Dog {
  var name: String
  var age: Int
  var weight: Double
  var dogBreeds: String
  
  init(name: String, age: Int, weight: Double, dogBreeds: String) {
    self.name = name
    self.age = age
    self.weight = weight
    self.dogBreeds = dogBreeds
  }
  
  func bark() -> String {
    return "멍멍"
  }
  
  func eating() -> String {
    return "냠냠쩝쩝"
  }
}

// ** 학생 (Student)
// - 속성: 이름, 나이, 학교명, 학년
// - 행위: 공부하기, 먹기, 잠자기
class Student {
  var name: String
  var age: Int
  var schoolName: String
  var grade: Int
  
  init(name: String, age: Int, schoolName: String, grade: Int) {
    self.name = name
    self.age = age
    self.schoolName = schoolName
    self.grade = grade
  }
  
  func study() -> String {
    return "재밌다~"
  }
  
  func eating() -> String {
    return "포만감 +60"
  }
  
  func sleep() -> String {
    return "자자~"
  }
}

// ** 아이폰(IPhone)
// - 속성: 기기명, 가격, faceID 기능 여부(Bool)
// - 행위: 전화 걸기, 문자 전송
class IPhone {
  var deviceName: String
  var price: Int
  var faceID: Bool
  
  init(deviceName: String, price: Int, faceID: Bool) {
    self.deviceName = deviceName
    self.price = price
    self.faceID = faceID
  }
  
  func call() -> String {
    return "call"
  }
  
  func message() -> String {
    return "문자"
  }
}

// ** 커피(Coffee)
// - 속성: 이름, 가격, 원두 원산지
class Coffee {
  var coffeeName: String
  var price: Int
  var countryOrigin: String
  
  init(coffeeName: String, price: Int, countryOrigin: String) {
    self.coffeeName = coffeeName
    self.price = price
    self.countryOrigin = countryOrigin
  }
}

// ** 계산기 (Calculator)
// - 속성: 현재 값
// - 행위: 더하기, 빼기, 나누기, 곱하기, 값 초기화
class Calculator {
  var value: Int = 0
  
  func add(num: Int) -> Int {
    return value + num
  }
  
  func subtract(num: Int) -> Int {
    return value - num
  }
  
  func multiply(num: Int) -> Int {
    return value * num
  }
  
  func divide(num: Int) -> Int {
    return value / num
  }
  
  func reset() -> Int {
    value = 0
    return value
  }
}
