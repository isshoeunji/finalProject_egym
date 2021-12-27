# 💪 운동커뮤니티와 다이어트식품 E-Commerce (Team)
-------------
SpringBoot + JPA를 이용한 운동 커뮤니티와 다이어트식품 쇼핑몰 사이트 만들기<br/>

팀프로젝트 (서은지 외5명) <br/>
(2021.11.13 - 2021.12.10) <br/>
------------
### ✨구현화면
-----------
#### 1. 커뮤니티 메인화면
![메인캡쳐](https://user-images.githubusercontent.com/88135219/147409400-25c2117f-7881-4453-9c0f-ece5841c60bb.png)
#### 2. 쇼핑몰 메인화면
![샵메인캡쳐](https://user-images.githubusercontent.com/88135219/147409443-6916d079-a8ae-453c-901b-1f1cfcdd34e9.png)
--------
#### ✨프로젝트 목적  
-------
- 사용자들이 집에서 쉽게 다이어트와 건강에 대한 정보를 얻고 온라인 운동메이트를 찾아 재미있는 다이어트와 건강한 생활에 대한 목표를 이룰 수 있도록 돕고, 다이어트 식단에 맞는 식품을 함께 판매한다.
--------
#### ✨ 개발환경 및 협업도구
--------
- **사용언어 & UI**
	- java, Servlet&JSP, HTML5, CSS3, JavaScript, BootStrap
- **FrameWork**
	- SpringBoot JPA
- **서버 & DB**
	- 아파치톰캣, Oracle11, AWS RDS
- **개발도구**
	- eclipse, SqlDeveloper
- **형상관리 & 협업도구**
	- GitHubDesktop, Slack, Notion
----
### 📊 개발일정
----
![plan](https://user-images.githubusercontent.com/88135219/147466122-08cd1de2-5e09-4a4a-823f-7f50977e0f32.jpg)
----
### 📜 Usecase Diagram
----
#### 1.커뮤니티 Usecase Diagram
![UsecaseDiagram_Main](https://user-images.githubusercontent.com/88135219/147466383-d5f6551f-6fc7-4d61-af6e-efcc695a8723.jpg)
#### 2. 쇼핑몰 Usecase Diagram
![UsecaseDiagram_shoppingmall](https://user-images.githubusercontent.com/88135219/147466419-a5c52bd7-5a03-40eb-8d9a-6b3dd5660eed.jpg)

----
#### 📊 DB Table
----
![FinalProject](https://user-images.githubusercontent.com/88135219/147472273-bf3181a6-ab98-4ae9-857e-30afc92101f7.png)
----
- 비회원인 고객도 쇼핑몰에서 주문을 할 수 있게 `비회원 주문 테이블`과 `비회원 주문상세 테이블`, `비회원 횐불/구매취소 테이블`을 따로 만들어주었다.
- 각 테이블의 `no`에는 `시퀀스`를 설정해주었다.
- 각 테이블의 `FK`에 `1:다` 또는 `다:1`의 형태로 `join`할 수 있도록 설정.
----
### ✨ 내가 맡은 부분
----
- `카테고리별 게시판 구현` → `다이어트꿀팁게시판`, `운동게시판`, `지역게시판`, `자유게시판`, `일기게시판`
- `게시글` → `등록` `조회` `수정` `삭제` `댓글달기` `댓글삭제`
----
#### 📃 카테고리별 게시판 구현
----
#### 1. 다이어트 꿀팁 게시판
![diettipboard](https://user-images.githubusercontent.com/88135219/147473817-6aa69537-cbed-4f92-8676-065f1d797a67.png)
#### 2. 운동게시판
![hometraining](https://user-images.githubusercontent.com/88135219/147473920-bcec0527-639d-4b85-8132-f144d7666ec0.png)
#### 3. 지역 게시판
![locationboard](https://user-images.githubusercontent.com/88135219/147474047-bd92227c-8a72-4206-8272-a45c4d519979.png)
#### 4. 자유 게시판
![freeboard](https://user-images.githubusercontent.com/88135219/147474087-8ec1be9a-14d0-4325-8527-ccd62052892a.png)
#### 5. 일기 게시판
![dailyboard](https://user-images.githubusercontent.com/88135219/147474134-72746626-bd1a-4d6e-baaf-376f7a3cd092.png)
----
### ✍ 게시글 `등록` | `수정` | `삭제` | `댓글기능` 구현
----
#### 1. 게시글 등록
![write](https://user-images.githubusercontent.com/88135219/147474728-56a6d572-82cc-4dd7-827e-6300ea4743d9.png)
<br>글 작성시 좀 더 많은 기능들을 위하여 `서머노트`를 적용시켰습니다.
- 이미지 첨부 기능
- 동영상 url 첨부 기능
- 폰트 색상, 굵기 변경 기능 등
#### 2. 게시글 수정
![update](https://user-images.githubusercontent.com/88135219/147475096-069388fe-dc91-461f-9093-1935fbb4415a.png)
글 작성자와 로그인된 사용자가 일치할 경우에만 글 수정이 가능하도록 시큐리티와 JSTL을 이용하여 View단에 적용.
```java
<sec:authorize access="isAuthenticated()">
	          <sec:authentication property="principal" var="user"/>
	          <c:choose>
		          <c:when test="${user.username eq board.memberId}">
			          <form name="requestForm" method="post" id="requestForm" class="float-right"> 
			          		<!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
				            <input type=hidden name="boardNo" value="${board.boardNo}">
				            <input type=hidden name="boardKind" value="${board.boardKind}">
				            <input type=button value="수정하기" style="background: none; border: none;" class="d-inline-block g-color-gray-dark-v4 g-color-white--hover g-bg-gray-dark-v2--hover rounded g-transition-0_3 g-text-underline--none--hover g-px-15 g-py-5">
				            <input type=button value="삭제하기" style="background: none; border: none;" class="d-inline-block g-color-gray-dark-v4 g-color-white--hover g-bg-gray-dark-v2--hover rounded g-transition-0_3 g-text-underline--none--hover g-px-15 g-py-5">
			          </form>
		          </c:when>
```

#### 3. 게시글 삭제
![delete1](https://user-images.githubusercontent.com/88135219/147480024-59ab33a6-d860-4bdc-b1ba-1f2829e17267.png) 
---

![delete2](https://user-images.githubusercontent.com/88135219/147480073-1954db7e-0226-4a4c-9866-ce82f7449eae.png)
- **글 작성자와 로그인된 사용자가 일치할 경우** 삭제하기 버튼이 보이도록 구현.<br>

- 삭제하기 버튼을 누르면 **글 작성 시 입력했던 비밀번호와 일치한 경우**에만 삭제하도록 구현.
```java
@Override
	public void delete(Long boardNo, String password) {
		// 비밀번호 검증
		Board board = boardRepository.findById(boardNo).orElse(null);
		if(board == null) throw new RuntimeException("글번호 오류로 삭제할 수 없습니다.");
		
		if(board.getPassword().equals(password)) {
			throw new RuntimeException("비밀번호를 다시 확인해주세요(삭제실패)");
		}

		boardRepository.delete(board);
	}
```
#### 4. 댓글 기능
- **댓글 등록하기** - 시큐리티 적용
	- `회원`과 `관리자`만 댓글 작성폼이 보이도록 구현
	- `비회원`은 댓글 작성폼이 보이지 않도록 구현
![reply](https://user-images.githubusercontent.com/88135219/147480539-094d00d2-7fa4-4664-b9d0-eda68d5f9497.png)
```java
<!-- Start 댓글 입력 폼 -->
	<sec:authorize access="hasAnyRole('MEMBER', 'ADMIN')">
       <h3 class="h6 g-color-black g-font-weight-600 text-uppercase g-mb-30">댓글 쓰기</h3>
		  <form name="replyWriteForm" method="post" action="${pageContext.request.contextPath}/reply/insert" enctype="multipart/form-data">
		  	  <input type="hidden" name="boardNo" value="${board.boardNo}" />
	          <div class="g-mb-30">
	            <textarea name="replyContent" class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v4 g-brd-primary--focus g-resize-none rounded-3 g-py-13 g-px-15" rows="4" placeholder="댓글 내용을 입력하세요."></textarea>
	          </div>
	          <button class="btn u-btn-primary g-font-weight-600 g-font-size-12 text-uppercase g-py-12 g-px-25" type="submit">댓글 등록하기</button>
          </form>
    </sec:authorize>
<!-- End 댓글 입력 폼 -->
 ```
- **댓글 삭제하기** - 시큐리티 적용
	- `댓글 작성자와 로그인 된 사용자가 일치할 경우`와 `관리자로 로그인 되어있을 경우`만 `삭제하기` 버튼이 보이도록 구현.

![reply3](https://user-images.githubusercontent.com/88135219/147481031-d40df432-e900-4bbf-9aa7-e316adebbf66.png)
![reply4](https://user-images.githubusercontent.com/88135219/147481057-b66b1afc-a30b-4002-8d96-b833d9e5d52d.png)

----
#### 🤔 프로젝트 진행 중 문제점과 해결방안
----
#### 문제점
- 게시판을 카테고리별로 나누었지만 다중 카테고리로 나누어 세부카테고리에 맞는 게시판 페이지가 나오게 구현을 어떻게 해야할지 막막했다.
- JPA에서 기본으로 제공하는 메소드인 Id값을 파라미터로 SELECT할 수 있는 findbyID 메소드를 이용할 수 없었다.
	- 지역 게시판의 지역 카테고리가 Id값이 아닌 `@ManyToOne` `JoinColumn(name = "tagrel_no")` 로 설정 되어있다.
#### 해결방안
- JPQL문법을 사용하여 BoardRepository에 따로 선언해주었다.
```java
@Query(value = "select b from Board b where b.tag.tagrelNo=?1" ) 
	Page<Board> selectByTag(Long tagrelNo, Pageable pageable);
```

----
#### ✔ 프로젝트 리뷰 및 개선방향
----
- 문서작업으로 유스케이스 명세서와 액티비티 다이어그램을 설계한 후 코딩을 하면서 이전 프로젝트보다 더욱 견고하고 단단하게 진행할 수 있었다.
- 처음 사용해 본 SpringBoot와 JPA는 편리하지만 기초 개념이 철저하게 잡혀있어야 하고, 더 공부해야할 것 같다.
- 중복되는 코드 최대한 정리하기
- DB테이블 처음 설계시 명확한 설계의 필요성
