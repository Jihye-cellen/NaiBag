## 배경

JSP/Servlet과 MVC 패턴을 학습한 후, 이론을 실제로 적용해보고 싶어, Naver API를 활용하여 가방 관련 쇼핑몰을 제작했습니다. 

개인적인 관심사인 가방을 주제로 다양한 상품 정보를 동적으로 제공하며, 웹 애플리케이션의 기초와 구조적 개발 경험을 쌓는 것이 목표였습니다. 이 프로젝트를 통해 사용자 친화적인 쇼핑 환경을 제공하고자 했습니다.

## 프로젝트 요약 설명

JSP, Servlet, Naver API를 활용하여 쇼핑몰을 구축하며, 웹 개발에 대한 이해도를 높이기 위한 개인 프로젝트입니다. 관리자 페이지와 사용자 페이지의 설계와 구현을 통해 전체 시스템의 흐름을 깊이 있게 이해하고자 했습니다.
![013](https://github.com/user-attachments/assets/46c2730a-e14d-4d1c-986f-decbedaef2e1)
![014](https://github.com/user-attachments/assets/ca045c4b-48c3-49b2-9b77-000016a04767)
![015](https://github.com/user-attachments/assets/8fe6ffe1-beb5-42c9-a018-1ad8c3773048)
![016](https://github.com/user-attachments/assets/2d867441-8613-444f-ba8f-0779c4b9b887)
![017](https://github.com/user-attachments/assets/412ac004-64eb-4ce6-9bbd-761c48c62e67)
![018](https://github.com/user-attachments/assets/714caf5b-5b6f-4782-8047-e06c09c1ab7f)
![019](https://github.com/user-attachments/assets/0eb37fa3-9580-48a8-8d83-9fb293b85d9b)


### 목표

JSP와 Servlet을 활용한 웹 애플리케이션 개발 역량 강화

Naver API 통합을 통한 동적 데이터 처리

관리자 및 사용자 페이지 설계 및 구현

### 주요 제공 서비스

- 가방 관련 정보 및 구매, 좋아요 기능, 장바구니
- 가방 상품 정보 검색 및 상품목록 구성, 주문관리 (관리자용 페이지)
- 게시판, 댓글

## 기술스택

**Frontend:** HTML, Javascript, css

**Backend:** JSP/Servlet

**Database:** MySql

**API:** NaverAPI

**Tool:** Eclipse

## 역할 및 기능

- 로그인(회원가입, 아이디중복, 비밀번호변경)
- 사용자 페이지(쇼핑몰 메인 페이지, 상품 바로 구매, 장바구니, 선택 주문하기, 좋아요 기능, 상품 리뷰)
- 관리자 페이지(Naver API를 활용한 쇼핑하기 API이용, 상품 목록 관리, 상품검색 기능)
- 게시판(전체 게시판 CRUD, 댓글 기능)

## 어려웠던 점/해결방안

| 어려웠던 점  | 해결방안 |
| --- | --- |
| 좋아요 기능에 대한 이해 | primary key를 하나만 줘서 좋아요에 대한 기능이 제대로 작동되지 않음. 알고보니, primary key는 1개 이상이어도 된다는 사실을 알게 되어 user, gid를 primary key를 주었다. |
| 게시판 수정 모달 창 생성 시, 게시판 수정에 대한 글을 읽어오지 않음  | value값이 안 나오는게 문제였음, 동일한 아이디를 줘서 읽어오지 못하므로 id의 명을 바꿔서 해결했다. |

## 회고

- 쇼핑몰 시스템에 대한 전반적인 이해도가 향상되었습니다.
- 관리자 페이지와 사용자 페이지가 별도로 구분되어 작동하는 구조를 이해하게 되었습니다.
- Primary Key는 하나일 필요가 없다는 사실을 깨달았습니다.
- Id명을 줄 시 하나만 줄 수 있어, 명명할 시, 유의해야한다는 것을 깨달았습니다.
- JSP/Servlet에 대한 이해도가 높아졌고, 웹 애플리케이션의 동작 원리를 더 잘 알게 되었습니다.
- SQL문에 대한 이해가 더욱 깊어졌으며, 데이터베이스 설계와 쿼리 작성 능력이 향상되었습니다.
- 주문 처리 로직에 대한 이해도가 크게 향상되었습니다.
