# 텍스트 크기(사이즈) 얻어내기

```swift
let size = ("text" as NSString).size(withAttributes: [NSAttributedString.Key.font : textField.font as Any]).width
```