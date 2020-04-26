import UIKit

//추상화 적용해보기 (Protocol 로 표현)
//
//사람(Human)을 표현하는 속성과 동작 정의
//레스토랑을 운영하는 오너(Owner)의 속성과 동작 정의
//요리사(Chef)의 속성과 동작 정의
//손님(Customer)의 속성과 동작 정의
protocol Human2 {
  var name: String { get }
  var gender: String { get }
  var age: Int { get }
  var height: Double { get }
  
  func sleep()
  func eat()
  func walk()
}

protocol Owner {
  var name: String { get }
  
  func promote()
  func hire()
  func fire()
}

//Q. 캡슐화 적용해보기
//- A가 서울에서 부산까지 여행을 가기로 함
//- A의 현재 위치는 currentLocation 이라는 메서드를 통해서만 확인 가능
//- 부산으로 이동하는 동작(메서드)을 구현하고 위치의 변경은 이 메서드를 통해서만 가능
//- 부산까지 이동하는 도중에 다른 일들을 할 수 있지만 A 클래스 외부에서는 자세한 내용은 알거나 직접 건드리지 못 함
class A {
  var location: String = "서울"
  
  private func 대구() -> String {
    return "대구 찌고~"
  }
  private func 안산() -> String {
    return "안산 찍고"
  }
  
  func currentLocation() {
    print(location)
  }
  func goToBusan() {
    location = "부산"
    대구()
    안산()
    print("\(location) 도착!")
  }
}

//Person, Student, University Student 클래스 구현하고 관련 속성 및 메서드 구현
class Person {
  let name: String = "성단빈"
  let age: Int = 29
  let gender: String = "남자"
  
  func todayAte() {
    print("편의점 김밥")
  }
}

class Student: Person {
  let academy: String = "패스트캠퍼스"
  
  func study() {
    print("Swift")
  }
}

class UniversityStudent: Student {
  let isGraduated: Bool = false
}

let universityStudent = UniversityStudent()
universityStudent.name

// bark() 메서드를 가진 Dog 클래스를 상속받아 Poodle, Husky, Bulldog 이 서로 다르게 짖도록 구현
class Dog {
  func bark() {
    print("멍멍")
  }
}

class Poodle: Dog {
  override func bark() {
    print("왈왈")
  }
}

class Husky: Dog {
  override func bark() {
    print("왕왕")
  }
}

class Bulldog: Dog {
  override func bark() {
    super.bark()
    print("미우미우")
  }
}

let dog = Dog()
dog.bark()
let poodle = Poodle()
poodle.bark()


