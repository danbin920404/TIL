# Array 



-----
## enumerated()

* 배열을 for문 돌 때 index와 value를 같이 쓰고 싶다면 enumerated()를 사용

```swift
let array: [String] = ["one", "two", "three", "four", "five"]

for (index, value) in array.enumerated() {
	print("\(index): \(value)")
}

// 0: "one"
// 1: "two"
// 2: "therr"
// 3: "four"
// 4: "five"
```

-----