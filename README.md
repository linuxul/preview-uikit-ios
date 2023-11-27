
## 1. SRT 진입점 및 딥링크

### 1.1. SRT 진입점 

#### 사용 TRCoordinator.shared.startSRTMain()

#### 함수

- **startSRTMain**
```swift
func startSRTMain()
```
* 진입 시 SRT 메인으로 이동
* SRT 홈으로 진입하려면 먼저 트래픽 제어를 실행한 후 메인 화면으로 이동

#### 1.2. 딥링크

    enum TRDeeplinkType {
      /// 미정 - 데이터 확인 필요
      case unknown
      /// 승차권 상세
      case detailTicket
      /// 환급 완료 상세
      case refundComplete
      /// 결제 상세
      case paymentDetail
    }

- **사용 함수**: `TRCoordinator.shared.gotoMainProxy()`
   - 이 함수는 앱의 데이터베이스(DB)에 저장된 즐겨찾기 정보를 처리합니다.
   - **함수 선언**: 
      ```swift
      func gotoMainProxy(_ mainProxyModel: TRMainProxyModel)
      ```
   - **파라미터**: `mainProxyModel` - 딥링크 정보를 포함합니다. 이를 통해 예약번호(`pnrNo`)를 사용하여 특정 티켓 상세 정보, 환불 완료 정보, 결제 상세 정보 등을 처리할 수 있습니다.
  - **파라미터**:

#### 실행 리스트

| 메뉴 명 | 함수 호출 |
|---------|----------|
| 열차 승차권(딥링크)| `TRCoordinator.shared.gotoMainProxy(TRMainProxyModel(type: .detailTicket, pnrNo: "320231100657714"))` |
| 승차권 환불(딥링크) | `TRCoordinator.shared.gotoMainProxy(TRMainProxyModel(type: .refundComplete, pnrNo: "320231100657714"))` | 
| 결제 상세정보(딥링크) | `TRCoordinator.shared.gotoMainProxy(TRMainProxyModel(type: .paymentDetail, pnrNo: "320231100657714"))` | 


## 2. SRT 즐겨찾기 사용법

### 2.1. 클래스 정의: `TRFavoriteManager`

#### 함수

- **remoteFavoriteSync**
```swift
func remoteFavoriteSync(completion: @escaping TRFavoriteListManagerCompletion)
```
* 앱 시작 시 호출.
* 앱 DB 전체 삭제 후 서버에서 전체 데이터 DB에 저장 (서버 통신).
* **Parameter**: `completion` - 완료 후 결과 정보 전달.

---

- **localFavoriteList**
```swift
func localFavoriteList(completion: @escaping TRFavoriteListManagerCompletion)
```
* 앱 DB에 저장된 즐겨찾기 정보 전달.
* **Parameter**: `completion` - 완료 후 결과 정보 전달.

---

- **insertFavorite**
```swift
func insertFavorite(departureCode: String, arrivalCode: String, completion: @escaping TRFavoriteManagerCompletion)
```
* 앱 DB 추가 후 서버 통신하여 즐겨찾기 정보를 추가 (핀고정여부, 별명 설정 안함) (서버 통신).
* **Parameters**: 
  * `departureCode`: 출발역 코드.
  * `arrivalCode`: 도착역 코드.
  * `completion`: 완료 후 결과 정보 전달.

---

- **modifyPin**
```swift
func modifyPin(departureCode: String, arrivalCode: String, hasPin: Bool, completion: @escaping TRFavoriteManagerCompletion)
```
* 즐겨찾기에 핀정보 설정.
* 출발, 도착지 설정이 있는지 체크 후 앱 DB에 핀설정 후 서버 통신 진행.
* **Parameters**: 
  * `departureCode`: 출발역 코드.
  * `arrivalCode`: 도착역 코드.
  * `hasPin`: 핀여부.
  * `completion`: 완료 후 결과 정보 전달.

---

- **modifyNickname**
```swift
func modifyNickname(departureCode: String, arrivalCode: String, nickName: String, completion: @escaping TRFavoriteManagerCompletion)
```
* 즐겨찾기에 닉네임 설정.
* 출발, 도착지 설정이 있는지 체크 후 앱 DB에 닉네임 설정 후 서버 통신 진행.
* **Parameters**: 
  * `departureCode`: 출발역 코드.
  * `arrivalCode`: 도착역 코드.
  * `nickName`: 닉네임.
  * `completion`: 완료 후 결과 정보 전달.

---

- **deleteFavorite**
```swift
func deleteFavorite(departureCode: String, arrivalCode: String, completion: @escaping TRFavoriteManagerCompletion)
```
* 앱 DB 삭제 후 서버 통신하여 즐겨찾기 정보를 삭제.
* **Parameters**: 
  * `departureCode`: 출발역 코드.
  * `arrivalCode`: 도착역 코드.
  * `completion`: 완료 후 결과 정보 전달.

---

### 2.2 SRT 테스트 메뉴

메뉴 위치: 티머니 메인 - 킥보드 진입

#### 메뉴 리스트

| 메뉴 명 | 함수 호출 | 설명 |
|---------|----------|-----|
| 24.즐겨찾기 동기화 | `TRFavoriteManager.shared.remoteFavoriteSync()` | 앱 시작 시 호출. 앱 DB 전체 삭제 후 서버의 즐겨찾기 정보 전체 데이터 DB에 저장 (외부에서 사용) |
| 25.즐겨찾기 가져오기 | `TRFavoriteManager.shared.localFavoriteList()` | 앱 DB에 저장된 즐겨찾기 정보 전달 |
| 26.즐겨찾기 추가 | `TRFavoriteManager.shared.insertFavorite()` | 앱 DB 추가 후 서버 통신하여 즐겨찾기 정보 추가 |
| 27.즐겨찾기 업데이트(Pin) | `TRFavoriteManager.shared.modifyPin()` | 즐겨찾기에 핀정보 설정 (외부에서 사용) |
| 28.즐겨찾기 업데이트(별명) | `TRFavoriteManager.shared.modifyNickname()` | 즐겨찾기에 닉네임 설정 (외부에서 사용) |
| 29즐겨찾기 삭제 | `TRFavoriteManager.shared.deleteFavorite()` | 앱 DB 삭제 후 서버 통신하여 즐겨찾기 정보 삭제 (외부에서 사용) |