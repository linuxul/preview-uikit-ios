
## 1. 렌터가 진입점 및 딥링크

### 1.1. 렌터가 진입점 

#### 사용 CRCoordinator.shared.startRentCarMain()

#### 함수

- **startRentCarMain**
```swift
func startRentCarMain()
```
* 진입 시 렌터카 메인으로 이동
* 렌터카 홈으로 진입하려면 먼저 트래픽 제어를 실행한 후 메인 화면으로 이동

#### 1.2. 딥링크
결제 상세정보 뷰로 이동

- **사용 함수**: `CRCoordinator.shared.gotoCRPaymentDetail()`
   - 이 함수는 결제 상세정보 뷰로 이동
   - **함수 선언**: 
      ```swift
      func gotoCRPaymentDetail(_ detailModel: CRPaymentDetailModel)
      ```
   - **파라미터**: `detailModel` - 딥링크 정보를 포함합니다. 이를 통해 렌터카예약일련번호(`rncrMrnpSno`)를 사용하여 결제 상세 정보 등을 처리할 수 있습니다.


### 1.3 렌터카 딥링크 테스트 메뉴

메뉴 위치: 티머니 메인 - 더보기 - [렌터카]테스트 메뉴

#### 메뉴 리스트

| 메뉴 명 | 함수 호출 |
|---------|----------|
| 16.렌터카 - 결제 상세정보| `CRCoordinator.shared.gotoCRPaymentDetail(CRPaymentDetailModel(rncrMrnpSno: "20231123000000000616"))` |

