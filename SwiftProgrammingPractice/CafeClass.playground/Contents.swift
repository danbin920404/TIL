import UIKit

/*
 < 문제 >
 손님, 바리스타, 커피 클래스를 각각 정의하고
 손님이 바리스타에게 커피를 주문하는 기능 구현하기
 
 [ Class ]
 ** 손님 (Customer)
 - 필수 속성: 이름(name)
 - 필수 메서드: 주문하기( func order(menu: CoffeeMenu, to barista: Barista) )
 
 ** 바리스타 (Barista)
 - 필수 속성: 이름(name)
 - 필수 메서드: 커피 만들기( func makeCoffee(menu: CoffeeMenu) -> Coffee )
 
 ** 커피 (Coffee)
 - 필수 속성: 이름(name), 가격(price)
 
 [ Enumeration ]
 ** 커피 메뉴 (CoffeeMenu)
 - case: americano, latte, cappuccino
 
 e.g.
 let customer = Customer(name: "손님A")
 let barista = Barista(name: "바리스타A")
 customer.order(menu: .americano, to: barista)
 
 Output: 손님A이(가) 바리스타A에게 2000원짜리 Americano을(를) 주문하였습니다.
 */
class Customer {
  var name: String
  
  init(name: String) {
    self.name = name
  }
  
  func order(menu: CoffeeMenu, to barista: Barista) {
    let menuAndprice = barista.makeCoffee(menu: menu)

    print("\(self.name)가 \(barista.name)에게 \(menuAndprice.price)원짜리 \(menuAndprice.name)를 주문하였습니다.")
  }
}

class Barista {
//  - 필수 속성: 이름(name)
//  - 필수 메서드: 커피 만들기( func makeCoffee(menu: CoffeeMenu) -> Coffee )
  var name: String
  
  init(name: String) {
    self.name = name
  }
  
  func makeCoffee(menu: CoffeeMenu) -> Coffee {
    var price = 0
    
    switch menu {
    case .americano:
      price = 2000
    case .cappuccino:
      price = 4000
    case .latte:
      price = 6000
    }
    
    let coffee = Coffee(name: "\(menu)", price: price)
    return coffee
  }
}

class Coffee {
//  - 필수 속성: 이름(name), 가격(price)
  var name: String
  var price: Int
  
  init(name: String, price: Int) {
    self.name = name
    self.price = price
  }
}

enum CoffeeMenu {
  case americano
  case latte
  case cappuccino
}

let customer = Customer(name: "손님A")
let barista = Barista(name: "바리스타A")

customer.order(menu: .americano, to: barista)

// 손님A이(가) 바리스타A에게 2000원짜리 Americano을(를) 주문하였습니다.
