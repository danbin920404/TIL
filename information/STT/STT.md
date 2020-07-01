# 2020년 06월 30일(화요일)




## STT - Speech To Text

* iOS 10 이상 가능
* 애플에서 제공하는 speech 프레임워크
* 음성 인식의 로케일(위치)를 지원. 지원되는 것이 현재 사용 가능한 것은 아닙니다. 일부 로케일은 인터넷 연결이 필요할 수 있음
* 유의 사항
	- 네트워크 및 속도 제한 실패를 처리할 수 있도록 준비
	- 배터리 소모 및 네트워크 트래픽 측면에서 비용이 많이 들 수 있음
	- 사용자의 음성을 녹음하는 경우 사용자 인터페이스에 명확하게 표시
	- 음성 인식을 사용하는 경우 사용자에게 명확하게 어떤 용도로 사용하는 지 밝힐 것

-----

* 기본 코드
* info.plist에 추가 사항
	- Privacy - Speech Recognition Usage Description
	- Privacy - Microphone Usage Description
* import Speech를 해준다

```swift
import Speech

// 어느나라 말을 인식할 건지 설정
  // 음성 인식 서비스의 가용성을 확인하고 음성 인식 프로세스를 시작하는 데 사용하는 객체
  private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "ko-KR"))
  // 사용자가 말한 음성인식요청을 처리
  // 장치 마이크의 오디오와 같은 캡처 된 오디오 콘텐츠의 음성 인식 요청
  private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
  // 인식 요청 결과를 제공
  // 음성 인식 진행률을 모니터링하는 데 사용하는 작업 개체
  private var recognitionTask: SFSpeechRecognitionTask?
  // 순수 소리만을 인식하는 오디오 엔진
  
  private let audioEngine = AVAudioEngine()
```

* 버튼에 액션을 걸어주고

```swift
@objc private func didtapBtn(_ sender: UIButton) {
  if audioEngine.isRunning { // 현재 음성인식이 수행중이라면
    audioEngine.stop() // 오디오 입력을 중단한다.
    recognitionRequest?.endAudio() // 음성인식 역시 중단
    speechBtn.isEnabled = false
    speechBtn.setTitle("말하기", for: .normal)
  } else {
    startRecording()
    speechBtn.setTitle("멈추기", for: .normal)
  }
}
```

* Delegate 설정

```swift
private func setSpeech() {
    speechRecognizer?.delegate = self
}

extension ViewController: SFSpeechRecognizerDelegate {
  func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
  }
  
  func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
  }
}
```

* 실제로 구동하는 액션 함수

```swift
// 현재 음성인식을 처리하고 있으면 그 작업을 중지하고 새로운 음성인식처리
private func startRecording() {
  if recognitionTask != nil {
    recognitionTask?.cancel()
    recognitionTask = nil
  }
  
  //오디오 녹음을 준비 할 AVAudioSession을 만듬
  // 여기서 세션의 범주를 녹음, 측정 모드로 설정하고 활성화 이러한 속성을 설정하면 예외가 발생할 수 있으므로 try catch 절에 넣어야 함
  let audioSession = AVAudioSession.sharedInstance()
  do {
    try audioSession.setCategory(AVAudioSession.Category.record)
    try audioSession.setMode(AVAudioSession.Mode.measurement)
    try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
  } catch {
    print("audioSession properties weren't set because of an error.")
  }
  
  //recognitionRequest를 인스턴스화. 여기서 SFSpeechAudioBufferRecognitionRequest 객체를 생성. 나중에  오디오 데이터를 Apple 서버에 전달하는 데 사용
  // 위에 변수 선언한 것에 인스턴스화 시킴, 음성인식을 처리
  recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
  
  // audioEngine (장치)에 녹음 할 오디오 입력이 있는지 확인해야 함. 그렇지 않은 경우 치명적 오류가 발생.
  let inputNode = audioEngine.inputNode
  
  //recognitionRequest 객체가 인스턴스화되고 nil이 아닌지 확인.
  guard let recognitionRequest = recognitionRequest else {
    fatalError("Unable to create an SFSpeechAudioBufferRecognitionRequest object")
  }
  
  //사용자가 말할 때의 인식 부분적인 결과를 보고 하도록 recognitionRequest에 지시함.
  recognitionRequest.shouldReportPartialResults = true
  
  // 인식을 시작하려면 speechRecognizer의 recognitionTask 메소드를 호출. 이 함수는 완료 핸들러가 있음. 이 완료 핸들러는 인식 엔진이 입력을 수신했을 때, 현재의 인식을 세련되거나 취소 또는 정지 한 때에 불려 최종 성적표를 돌려 줌.
  recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest,
                                                      resultHandler: { (result, error) in
    
    //  부울을 정의하여 인식이 최종인지 확인함.
    var isFinal = false
    
    // result는 위에 매개변수
    if result != nil {
      //결과가 nil이 아닌 경우 textView.text 속성을 결과의 최상의 텍스트로 설정. 결과가 최종 결과이면 isFinal을 true로 설정하기.
      let speechText = result?.bestTranscription.formattedString
      
      self.speechTextView.text = speechText
      isFinal = (result?.isFinal)!
    }
    
    //오류가 없거나 최종 결과가 나오면 audioEngine (오디오 입력)을 중지하고 인식 요청 및 인식 작업을 중지합니다. 동시에 녹음 시작 버튼을 활성화합니다.
    if error != nil || isFinal {
      self.audioEngine.stop()
      inputNode.removeTap(onBus: 0)
      self.recognitionRequest = nil
      self.recognitionTask = nil
      self.speechBtn.isEnabled = true
    }
  })
  
  //recognitionRequest에 오디오 입력을 추가. 인식 작업을 시작한 후에는 오디오 입력을 추가해도 무관. 오디오 프레임 워크는 오디오 입력이 추가되는 즉시 인식을 시작.
  
  let recordingFormat = inputNode.outputFormat(forBus: 0)
  // Bus에 오디오 탭을 설치하여 노드의 출력을 기록, 모니터링 및 관찰
  // 공식문서 참조 : https://developer.apple.com/documentation/avfoundation/avaudionode/1387122-installtap
  inputNode.installTap(onBus: 0,
                       bufferSize: 1024,
                       format: recordingFormat) { (buffer, when) in
    // 인식이 되는 즉시 recognitionRequest에 추가
    self.recognitionRequest?.append(buffer)
  }
  
  audioEngine.prepare()
  
  do {
    try audioEngine.start()
  } catch {
    print("audioEngine couldn't start because of an error.")
  }
  print("Say something, I'm listening!")
}
```