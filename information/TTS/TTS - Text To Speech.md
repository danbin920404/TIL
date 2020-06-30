# 2020년 06월 30일(화요일)




## TTS - Text To Speech

* iOS 10 이상 사용가능

------

* 기본 코드
```swift
import AVFoundation

let synthesizer = AVSpeechSynthesizer()
let utterance = AVSpeechUtterance(string: "your string")
utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
// 말하기 속도
utterance.rate = 0.4
// 발화를 말할 때 사용되는 음량
utterance.volume = // Float
synthesizer.speak(utterance)
```

* Language 목록

```swift
Arabic (Saudi Arabia) - ar-SA
Chinese (China) - zh-CN
Chinese (Hong Kong SAR China) - zh-HK
Chinese (Taiwan) - zh-TW
Czech (Czech Republic) - cs-CZ
Danish (Denmark) - da-DK
Dutch (Belgium) - nl-BE
Dutch (Netherlands) - nl-NL
English (Australia) - en-AU
English (Ireland) - en-IE
English (South Africa) - en-ZA
English (United Kingdom) - en-GB
English (United States) - en-US
Finnish (Finland) - fi-FI
French (Canada) - fr-CA
French (France) - fr-FR
German (Germany) - de-DE
Greek (Greece) - el-GR
Hindi (India) - hi-IN
Hungarian (Hungary) - hu-HU
Indonesian (Indonesia) - id-ID
Italian (Italy) - it-IT
Japanese (Japan) - ja-JP
Korean (South Korea) - ko-KR
Norwegian (Norway) - no-NO
Polish (Poland) - pl-PL
Portuguese (Brazil) - pt-BR
Portuguese (Portugal) - pt-PT
Romanian (Romania) - ro-RO
Russian (Russia) - ru-RU
Slovak (Slovakia) - sk-SK
Spanish (Mexico) - es-MX
Spanish (Spain) - es-ES
Swedish (Sweden) - sv-SE
Thai (Thailand) - th-TH
Turkish (Turkey) - tr-TR
```