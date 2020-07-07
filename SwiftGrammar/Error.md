# 2020년 07월 05일(일요일)




## Error Handling Basic_code

##### Three Types of Try

```swift
let tmpDir = NSTemporaryDirectory()
let filePath = NSTemporaryDirectory() + "swift.txt"
```

* try  -  do ~ catch 없이 단독 사용 불가.

```swift
func typeOneTry() {
	do {
    let fileContents = try String(contentsOfFile: filePath)
    print(fileContents)
    
    let fileContents1 = try String(contentsOfFile: tmpDir)
    print(fileContents1)
  } catch {
    print(error.localizedDescription)
  }
}
```

* try?  -  성공하면 Optional 값 반환, 에러가 발생하면 nil 반환

```swift
func typeTwoTry() {
	let contentsOptional = try? String(contentsOfFile: filePath)
  print(contentsOptional ?? "nil")
  
  let contentsError = try? String(contentsOfFile: tmpDir)
  print(contentsError ?? "nil")
}
```

* try!  -  Optional 강제 언래핑. 단, 에러 발생 시 crash.

```swift
let contentsUnwrapped = try! String(contentsOfFile: filePath)
  print(contentsUnwrapped)
//  let unwrappedError = try! String(contentsOfFile: tmpDir)
//  print(unwrappedError)
```

























