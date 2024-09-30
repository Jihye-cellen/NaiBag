## 배경

JSP/Servlet과 MVC 패턴을 학습한 후, 이론을 실제로 적용해보고 싶어, Naver API를 활용하여 가방 관련 쇼핑몰을 제작했습니다. 

개인적인 관심사인 가방을 주제로 다양한 상품 정보를 동적으로 제공하며, 웹 애플리케이션의 기초와 구조적 개발 경험을 쌓는 것이 목표였습니다. 이 프로젝트를 통해 사용자 친화적인 쇼핑 환경을 제공하고자 했습니다.

<br>

## 프로젝트 요약 설명

다양한 브랜드의 가방을 직접 구매를 할 수가 있으며, 게시판으로 구매자들과 커뮤니티를 형성할 수 있는 JSP/Servlet을 이용한 쇼핑몰

<br>


## 프로젝트 설명

![NERD (1)](https://github.com/user-attachments/assets/8577db42-a5f3-4334-959e-8d423e96b078)
![016](https://github.com/user-attachments/assets/b529b822-6acf-4bc5-8fd4-02ec70c52782)
![017](https://github.com/user-attachments/assets/c9f73bf6-39be-4878-8cb7-49f02373b2f4)
![018](https://github.com/user-attachments/assets/35749a04-3ce7-447e-9135-38728a7fecaa)
![019](https://github.com/user-attachments/assets/39b7b012-805c-4716-bec3-dc8a4f677a12)
![020](https://github.com/user-attachments/assets/3ae088c0-f190-45f2-aa5c-800b2be36037)
![021](https://github.com/user-attachments/assets/aef40a6a-bfde-4ea2-af05-1ded20dee6c4)

<br>
<br>


### 목표

JSP와 Servlet을 활용한 웹 애플리케이션 개발 역량 강화

Naver API 통합을 통한 동적 데이터 처리

관리자 및 사용자 페이지 설계 및 구현

<br>



### 주요 제공 서비스

- 가방 관련 정보 및 구매, 좋아요 기능, 장바구니
- 가방 상품 정보 검색 및 상품목록 구성, 주문관리 (관리자용 페이지)
- 게시판, 댓글

<br>


## 기술스택

**Frontend:** HTML, Javascript, css

**Backend:** JSP/Servlet

**Database:** MySql

**API:** NaverAPI

**Tool:** Eclipse

<br>

## 역할 및 기능

- 로그인(회원가입, 아이디중복, 비밀번호변경)
- 사용자 페이지(쇼핑몰 메인 페이지, 상품 바로 구매, 장바구니, 선택 주문하기, 좋아요 기능, 상품 리뷰)
- 관리자 페이지(Naver API를 활용한 쇼핑하기 API이용, 상품 목록 관리, 상품검색 기능)
- 게시판(전체 게시판 CRUD, 댓글 기능)

<br>


## 어려웠던 점/해결방안

| 어려웠던 점  | 해결방안 |
| --- | --- |
| 좋아요 기능에 대한 이해 | primary key를 하나만 줘서 좋아요에 대한 기능이 제대로 작동되지 않음. 알고보니, primary key는 1개 이상이어도 된다는 사실을 알게 되어 user, gid를 primary key를 주었다. |
| 게시판 수정 모달 창 생성 시, 게시판 수정에 대한 글을 읽어오지 않음  | value값이 안 나오는게 문제였음, 동일한 아이디를 줘서 읽어오지 못하므로 id의 명을 바꿔서 해결했다. |

<br>


## 회고

- 쇼핑몰 시스템에 대한 전반적인 이해도가 향상되었습니다.
- 관리자 페이지와 사용자 페이지가 별도로 구분되어 작동하는 구조를 이해하게 되었습니다.
- Primary Key는 하나일 필요가 없다는 사실을 깨달았습니다.
- Id명을 줄 시 하나만 줄 수 있어, 명명할 시, 유의해야한다는 것을 깨달았습니다.
- JSP/Servlet에 대한 이해도가 높아졌고, 웹 애플리케이션의 동작 원리를 더 잘 알게 되었습니다.
- SQL문에 대한 이해가 더욱 깊어졌으며, 데이터베이스 설계와 쿼리 작성 능력이 향상되었습니다.
- 주문 처리 로직에 대한 이해도가 크게 향상되었습니다.
