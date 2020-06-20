# 진동 

```swift
//진동 1
import AudioToolbox.AudioServices

func didTapButton1(_ sender: UIButton) {
  // 진동
  AudioServicesPlayAlertSoundWithCompletion(kSystemSoundID_Vibrate) {
    print("진동")
  }
}  
```

```swift
// 진동 2 - iOS 10, 아이폰 7이상 (UIKit에 들어가 있음)
func didTapButton2(_ sender: UIButton) {
  let impactFeedbackGenerator = UIImpactFeedbackGenerator(style: .heavy) // 진동 스타일, 원하는 스타일로 변경

  impactFeedbackGenerator.prepare() // 진동 준비
  impactFeedbackGenerator.impactOccurred() // 진동
}
```