# Swift Style Guide

* 이 스타일 가이드는 Apple의 우수한 Swift 표준 라이브러리 스타일을 기반으로하며 Google의 여러 Swift 프로젝트에서 사용 된 의견을 포함합니다

## 소스 파일 기본

* 파일 이름
	- 모든 Swift 소스 파일은 확장자로 끝납니다 -> .swift

```swift
MyType.swfit
```

* 파일 인코딩
	- 소스 파일은 UTF-8로 인코딩됩니다.

```swift
UTF-8이란

// UTF-8은 유니코드를 인코딩(encoding)하는 방식이다. 전세계에서 사용하는 약속이다.

// 유니코드는 가변 인코딩방식이다. 쉬운 말로 하면 글자마다 byte 길이가 다르다는 것이다. 
// ‘a’는 1 byte이고 ‘가'는 3 byte이다. 가변을 구분하기 위해 첫 바이트에 표식을 넣었는데 2 byte는 110으로 시작하고 3바이트는 1110으로 시작한다. 
// 나머지 바이트는 10으로 시작한다. 
// 왜 그러냐고 묻는다면, 그냥 ‘약속이다’라고 말하고 싶다.
```

* Import Statements
	- 소스 파일은 필요한 최상위 모듈을 정확하게 가져옵니다.
	- 개별 선언이나 하위 모듈을 가져 오는 것보다 전체 모듈을 가져 오는 것이 좋습니다.


* UIkit을 import하면 Foundation을 자동으로 해주기 때문에 UIKit을 하면 Foundation을 따로 해줄 필요가 없습니다.
	- UIKit, Foundation : app 의 model 객체를 정의하는데 사용될 기본 타입들을 제공함
	- Foundation : string, numbers, array 등의 기본적인 데이터 타입을 제공



## General Formatting - 일반적인 형식

* 열 제한
	- 신속한 코드의 열 제한은 100 자입니다. 

* 줄 바꿈

```swift
// o
public func index<Elements: Collection, Element>(
  of element: Element,
  in collection: Elements
) -> Elements.Index?
where
  Elements.Element == Element,
  Element: Equatable
{  // GOOD.
  for current in elements {
    // ...
  }
}

// x
public func index<Elements: Collection, Element>(
  of element: Element,
  in collection: Elements
) -> Elements.Index?
where
  Elements.Element == Element,
  Element: Equatable {  // AVOID.
  for current in elements {
    // ...
  }
}
```

* 확장자 선언

```swift
class MyClass:
  MySuperclass,
  MyProtocol,
  SomeoneElsesProtocol,
  SomeFrameworkProtocol
{
  // ...
}

class MyContainer<Element>:
  MyContainerSuperclass,
  MyContainerProtocol,
  SomeoneElsesContainerProtocol,
  SomeFrameworkContainerProtocol
{
  // ...
}

class MyContainer<BaseCollection>:
  MyContainerSuperclass,
  MyContainerProtocol,
  SomeoneElsesContainerProtocol,
  SomeFrameworkContainerProtocol
where BaseCollection: Collection {
  // ...
}

class MyContainer<BaseCollection>:
  MyContainerSuperclass,
  MyContainerProtocol,
  SomeoneElsesContainerProtocol,
  SomeFrameworkContainerProtocol
where
  BaseCollection: Collection,
  BaseCollection.Element: Equatable,
  BaseCollection.Element: SomeOtherProtocolOnlyUsedToForceLineWrapping
{
  // ...
}
```

* 함수 호출

```swift
let index = index(
  of: veryLongElementVariableName,
  in: aCollectionOfElementsThatAlsoHappensToHaveALongName)

let index = index(
  of: veryLongElementVariableName,
  in: aCollectionOfElementsThatAlsoHappensToHaveALongName
)
```

* 제어 흐름

```swift
if aBooleanValueReturnedByAVeryLongOptionalThing() &&
   aDifferentBooleanValueReturnedByAVeryLongOptionalThing() &&
   yetAnotherBooleanValueThatContributesToTheWrapping() {
  doSomething()
}

if aBooleanValueReturnedByAVeryLongOptionalThing() &&
   aDifferentBooleanValueReturnedByAVeryLongOptionalThing() &&
   yetAnotherBooleanValueThatContributesToTheWrapping()
{
  doSomething()
}

if let value = aValueReturnedByAVeryLongOptionalThing(),
   let value2 = aDifferentValueReturnedByAVeryLongOptionalThing() {
  doSomething()
}

if let value = aValueReturnedByAVeryLongOptionalThing(),
   let value2 = aDifferentValueReturnedByAVeryLongOptionalThingThatForcesTheBraceToBeWrapped()
{
  doSomething()
}

guard let value = aValueReturnedByAVeryLongOptionalThing(),
      let value2 = aDifferentValueReturnedByAVeryLongOptionalThing() else {
  doSomething()
}

guard let value = aValueReturnedByAVeryLongOptionalThing(),
      let value2 = aDifferentValueReturnedByAVeryLongOptionalThing()
else {
  doSomething()
}

for element in collection
    where element.happensToHaveAVeryLongPropertyNameThatYouNeedToCheck {
  doSomething()
}
```

* 공백

```swift
// 0
var x = 5

func sum(_ numbers: [Int], initialValue: Int = 0) {
  // ...
}


// x
var x=5

func sum(_ numbers: [Int], initialValue: Int=0) {
  // ...
}
```

* 수평 정렬

```swift
// o
struct DataPoint {
  var value: Int
  var primaryColor: UIColor
}


// x
struct DataPoint {
  var value:        Int
  var primaryColor: UIColor
}
```

* 세미콜론
	- 세미콜론 ( ;)은 문장을 종료하거나 분리하는 데 사용되지 않습니다.
	- 즉, 세미콜론이 나타날 수있는 유일한 위치는 문자열 리터럴 또는 주석 안에 있습니다.

```swift
// o
func printSum(_ a: Int, _ b: Int) {
  let sum = a + b
  print(sum)
}

// x
func printSum(_ a: Int, _ b: Int) {
  let sum = a + b;
  print(sum);
}
```


## Formatting Specific Constructs - 특정 구문 포맷

* 지역 변수는 범위를 최소화하기 위해 (이유 내에서) 처음 사용 된 지점에 가깝게 선언됩니다.
* 튜플 파괴를 제외하고, 모든 let또는 var명령문 (속성 또는 로컬 변수)은 정확히 하나의 변수를 선언합니다.

```swift
// o
var a = 5
var b = 10

let (quotient, remainder) = divide(100, 9)


// x
var a = 5, b = 10
```

* switch문
	- Case 문은 해당 스위치 문과 동일한 레벨로 들여 쓰기됩니다 . 그런 다음 케이스 블록 내의 명령문은 해당 레벨에서 +2 공백만큼 들여 쓰기됩니다.

```swift
// o 
switch order {
case .ascending:
  print("Ascending")
case .descending:
  print("Descending")
case .same:
  print("Same")
}


// x
switch order {
  case .ascending:
    print("Ascending")
  case .descending:
    print("Descending")
  case .same:
    print("Same")
}

switch order {
case .ascending:
print("Ascending")
case .descending:
print("Descending")
case .same:
print("Same")
}
```

* 열거 형
	- 일반적으로 한 case줄에 하나만 작성, 쉼표로 구분 된 형식은 형식에 맞고 연결된 값으로 한다

```swift
// o
public enum Token {
  case comma
  case semicolon
  case identifier
}

public enum Token {
  case comma, semicolon, identifier
}

public enum Token {
  case comma
  case semicolon
  case identifier(String)
}


// x
public enum Token {
  case comma, semicolon, identifier(String)
}
```