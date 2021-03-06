# ๐ช ์ด๋์ปค๋ฎค๋ํฐ์ ๋ค์ด์ดํธ์ํ E-Commerce (Team)
-------------
SpringBoot + JPA๋ฅผ ์ด์ฉํ ์ด๋ ์ปค๋ฎค๋ํฐ์ ๋ค์ด์ดํธ์ํ ์ผํ๋ชฐ ์ฌ์ดํธ ๋ง๋ค๊ธฐ<br/>

ํํ๋ก์ ํธ (์์์ง ์ธ 5๋ช) <br/>
(2021.11.03 - 2021.12.10) <br/>
------------
### โจ๊ตฌํํ๋ฉด
-----------
#### 1. ์ปค๋ฎค๋ํฐ ๋ฉ์ธํ๋ฉด
![๋ฉ์ธ์บก์ณ](https://user-images.githubusercontent.com/88135219/147409400-25c2117f-7881-4453-9c0f-ece5841c60bb.png)
#### 2. ์ผํ๋ชฐ ๋ฉ์ธํ๋ฉด
![์ต๋ฉ์ธ์บก์ณ](https://user-images.githubusercontent.com/88135219/147409443-6916d079-a8ae-453c-901b-1f1cfcdd34e9.png)
--------
### โจํ๋ก์ ํธ ๋ชฉ์   
-------
- ์ฌ์ฉ์๋ค์ด ์ง์์ ์ฝ๊ฒ ๋ค์ด์ดํธ์ ๊ฑด๊ฐ์ ๋ํ ์ ๋ณด๋ฅผ ์ป๊ณ  ์จ๋ผ์ธ ์ด๋๋ฉ์ดํธ๋ฅผ ์ฐพ์ ์ฌ๋ฏธ์๋ ๋ค์ด์ดํธ์ ๊ฑด๊ฐํ ์ํ์ ๋ํ ๋ชฉํ๋ฅผ ์ด๋ฃฐ ์ ์๋๋ก ๋๊ณ , ๋ค์ด์ดํธ ์๋จ์ ๋ง๋ ์ํ์ ํจ๊ป ํ๋งคํ๋ค.
--------
### โจ ๊ฐ๋ฐํ๊ฒฝ ๋ฐ ํ์๋๊ตฌ
--------
- **์ฌ์ฉ์ธ์ด & UI**
	- java, Servlet&JSP, HTML5, CSS3, JavaScript, BootStrap
- **FrameWork**
	- SpringBoot JPA
- **์๋ฒ & DB**
	- ์ํ์นํฐ์บฃ, Oracle11, AWS RDS
- **๊ฐ๋ฐ๋๊ตฌ**
	- eclipse, SqlDeveloper
- **ํ์๊ด๋ฆฌ & ํ์๋๊ตฌ**
	- GitHubDesktop, Slack, Notion
----
### ๐ ๊ฐ๋ฐ์ผ์ 
----
![plan](https://user-images.githubusercontent.com/88135219/147466122-08cd1de2-5e09-4a4a-823f-7f50977e0f32.jpg)
----
### ๐ Usecase Diagram
----
#### 1.์ปค๋ฎค๋ํฐ Usecase Diagram
![UsecaseDiagram_Main](https://user-images.githubusercontent.com/88135219/147466383-d5f6551f-6fc7-4d61-af6e-efcc695a8723.jpg)
#### 2. ์ผํ๋ชฐ Usecase Diagram
![UsecaseDiagram_shoppingmall](https://user-images.githubusercontent.com/88135219/147466419-a5c52bd7-5a03-40eb-8d9a-6b3dd5660eed.jpg)

----
### ๐ DB Table
----
![FinalProject](https://user-images.githubusercontent.com/88135219/147472273-bf3181a6-ab98-4ae9-857e-30afc92101f7.png)
----
- ๋นํ์์ธ ๊ณ ๊ฐ๋ ์ผํ๋ชฐ์์ ์ฃผ๋ฌธ์ ํ  ์ ์๊ฒ `๋นํ์ ์ฃผ๋ฌธ ํ์ด๋ธ`๊ณผ `๋นํ์ ์ฃผ๋ฌธ์์ธ ํ์ด๋ธ`, `๋นํ์ ํ๋ถ/๊ตฌ๋งค์ทจ์ ํ์ด๋ธ`์ ๋ฐ๋ก ๋ง๋ค์ด์ฃผ์๋ค.
- ๊ฐ ํ์ด๋ธ์ `no`์๋ `์ํ์ค`๋ฅผ ์ค์ ํด์ฃผ์๋ค.
- ๊ฐ ํ์ด๋ธ์ `FK`์ `1:๋ค` ๋๋ `๋ค:1`์ ํํ๋ก `join`ํ  ์ ์๋๋ก ์ค์ .
----
### โจ ๋ด๊ฐ ๋งก์ ๋ถ๋ถ
----
- `์นดํ๊ณ ๋ฆฌ๋ณ ๊ฒ์ํ ๊ตฌํ` โ `๋ค์ด์ดํธ๊ฟํ๊ฒ์ํ`, `์ด๋๊ฒ์ํ`, `์ง์ญ๊ฒ์ํ`, `์์ ๊ฒ์ํ`, `์ผ๊ธฐ๊ฒ์ํ`
- `๊ฒ์๊ธ` โ `๋ฑ๋ก` `์กฐํ` `์์ ` `์ญ์ ` `๋๊ธ๋ฌ๊ธฐ` `๋๊ธ์ญ์ `
----
### ๐ ์นดํ๊ณ ๋ฆฌ๋ณ ๊ฒ์ํ ๊ตฌํ
----
#### 1. ๋ค์ด์ดํธ ๊ฟํ ๊ฒ์ํ
![diettipboard](https://user-images.githubusercontent.com/88135219/147473817-6aa69537-cbed-4f92-8676-065f1d797a67.png)
#### 2. ์ด๋๊ฒ์ํ
![hometraining](https://user-images.githubusercontent.com/88135219/147473920-bcec0527-639d-4b85-8132-f144d7666ec0.png)
#### 3. ์ง์ญ ๊ฒ์ํ
![locationboard](https://user-images.githubusercontent.com/88135219/147474047-bd92227c-8a72-4206-8272-a45c4d519979.png)
#### 4. ์์  ๊ฒ์ํ
![freeboard](https://user-images.githubusercontent.com/88135219/147474087-8ec1be9a-14d0-4325-8527-ccd62052892a.png)
#### 5. ์ผ๊ธฐ ๊ฒ์ํ
![dailyboard](https://user-images.githubusercontent.com/88135219/147474134-72746626-bd1a-4d6e-baaf-376f7a3cd092.png)
----
### โ ๊ฒ์๊ธ `๋ฑ๋ก` | `์์ ` | `์ญ์ ` | `๋๊ธ๊ธฐ๋ฅ` ๊ตฌํ
----
#### 1. ๊ฒ์๊ธ ๋ฑ๋ก
๊ธ ์์ฑ์ ์ข ๋ ๋ง์ ๊ธฐ๋ฅ๋ค์ ์ํ์ฌ `์๋จธ๋ธํธ`๋ฅผ ์ ์ฉ์์ผฐ์ต๋๋ค.
- ์ด๋ฏธ์ง ์ฒจ๋ถ ๊ธฐ๋ฅ
- ๋์์ url ์ฒจ๋ถ ๊ธฐ๋ฅ
- ํฐํธ ์์, ๊ตต๊ธฐ ๋ณ๊ฒฝ ๊ธฐ๋ฅ ๋ฑ <br>
![write](https://user-images.githubusercontent.com/88135219/147474728-56a6d572-82cc-4dd7-827e-6300ea4743d9.png)
#### 2. ๊ฒ์๊ธ ์์ 
- **๊ธ ์์ฑ์์ ๋ก๊ทธ์ธ๋ ์ฌ์ฉ์๊ฐ ์ผ์นํ  ๊ฒฝ์ฐ**์๋ง ๊ธ ์์ ์ด ๊ฐ๋ฅํ๋๋ก `์ํ๋ฆฌํฐ`์ `JSTL`์ ์ด์ฉํ์ฌ View๋จ์ ์ ์ฉ. <br>
![update](https://user-images.githubusercontent.com/88135219/147475096-069388fe-dc91-461f-9093-1935fbb4415a.png)
```java
<sec:authorize access="isAuthenticated()">
	          <sec:authentication property="principal" var="user"/>
	          <c:choose>
		          <c:when test="${user.username eq board.memberId}">
			          <form name="requestForm" method="post" id="requestForm" class="float-right"> 
			          		<!-- ์์ ์ ํ์ํ ๋ฐ์ดํฐ๋ค์ hidden์ผ๋ก ์จ๊ฒจ๋๊ณ  ํผ ๋ฐ์ดํฐ๋ก ๋ณด๋ด์ค๋ค. -->
				            <input type=hidden name="boardNo" value="${board.boardNo}">
				            <input type=hidden name="boardKind" value="${board.boardKind}">
				            <input type=button value="์์ ํ๊ธฐ" style="background: none; border: none;" class="d-inline-block g-color-gray-dark-v4 g-color-white--hover g-bg-gray-dark-v2--hover rounded g-transition-0_3 g-text-underline--none--hover g-px-15 g-py-5">
				            <input type=button value="์ญ์ ํ๊ธฐ" style="background: none; border: none;" class="d-inline-block g-color-gray-dark-v4 g-color-white--hover g-bg-gray-dark-v2--hover rounded g-transition-0_3 g-text-underline--none--hover g-px-15 g-py-5">
			          </form>
		          </c:when>
```

#### 3. ๊ฒ์๊ธ ์ญ์ 
- **๊ธ ์์ฑ์์ ๋ก๊ทธ์ธ๋ ์ฌ์ฉ์๊ฐ ์ผ์นํ  ๊ฒฝ์ฐ** ์ญ์ ํ๊ธฐ ๋ฒํผ์ด ๋ณด์ด๋๋ก ๊ตฌํ.<br>
- ์ญ์ ํ๊ธฐ ๋ฒํผ์ ๋๋ฅด๋ฉด **๊ธ ์์ฑ ์ ์๋ ฅํ๋ ๋น๋ฐ๋ฒํธ์ ์ผ์นํ ๊ฒฝ์ฐ**์๋ง ์ญ์ ๋๋๋ก ๊ตฌํ. <br>
![delete1](https://user-images.githubusercontent.com/88135219/147480024-59ab33a6-d860-4bdc-b1ba-1f2829e17267.png) 
---

![delete2](https://user-images.githubusercontent.com/88135219/147480073-1954db7e-0226-4a4c-9866-ce82f7449eae.png)
```java
@Override
	public void delete(Long boardNo, String password) {
		// ๋น๋ฐ๋ฒํธ ๊ฒ์ฆ
		Board board = boardRepository.findById(boardNo).orElse(null);
		if(board == null) throw new RuntimeException("๊ธ๋ฒํธ ์ค๋ฅ๋ก ์ญ์ ํ  ์ ์์ต๋๋ค.");
		
		if(board.getPassword().equals(password)) {
			throw new RuntimeException("๋น๋ฐ๋ฒํธ๋ฅผ ๋ค์ ํ์ธํด์ฃผ์ธ์(์ญ์ ์คํจ)");
		}

		boardRepository.delete(board);
	}
```
#### 4. ๋๊ธ ๊ธฐ๋ฅ
- **๋๊ธ ๋ฑ๋กํ๊ธฐ** - ์ํ๋ฆฌํฐ ์ ์ฉ
	- `ํ์`๊ณผ `๊ด๋ฆฌ์`๋ง ๋๊ธ ์์ฑํผ์ด ๋ณด์ด๋๋ก ๊ตฌํ
	- `๋นํ์`์ ๋๊ธ ์์ฑํผ์ด ๋ณด์ด์ง ์๋๋ก ๊ตฌํ
![reply](https://user-images.githubusercontent.com/88135219/147480539-094d00d2-7fa4-4664-b9d0-eda68d5f9497.png)
```java
<!-- Start ๋๊ธ ์๋ ฅ ํผ -->
	<sec:authorize access="hasAnyRole('MEMBER', 'ADMIN')">
       <h3 class="h6 g-color-black g-font-weight-600 text-uppercase g-mb-30">๋๊ธ ์ฐ๊ธฐ</h3>
		  <form name="replyWriteForm" method="post" action="${pageContext.request.contextPath}/reply/insert" enctype="multipart/form-data">
		  	  <input type="hidden" name="boardNo" value="${board.boardNo}" />
	          <div class="g-mb-30">
	            <textarea name="replyContent" class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v4 g-brd-primary--focus g-resize-none rounded-3 g-py-13 g-px-15" rows="4" placeholder="๋๊ธ ๋ด์ฉ์ ์๋ ฅํ์ธ์."></textarea>
	          </div>
	          <button class="btn u-btn-primary g-font-weight-600 g-font-size-12 text-uppercase g-py-12 g-px-25" type="submit">๋๊ธ ๋ฑ๋กํ๊ธฐ</button>
          </form>
    </sec:authorize>
<!-- End ๋๊ธ ์๋ ฅ ํผ -->
 ```
- **๋๊ธ ์ญ์ ํ๊ธฐ** - ์ํ๋ฆฌํฐ ์ ์ฉ
	- **๋๊ธ ์์ฑ์์ ๋ก๊ทธ์ธ ๋ ์ฌ์ฉ์๊ฐ ์ผ์นํ  ๊ฒฝ์ฐ**์ **๊ด๋ฆฌ์๋ก ๋ก๊ทธ์ธ ๋์ด์์ ๊ฒฝ์ฐ**๋ง `์ญ์ ํ๊ธฐ` ๋ฒํผ์ด ๋ณด์ด๋๋ก ๊ตฌํ.

![reply3](https://user-images.githubusercontent.com/88135219/147481031-d40df432-e900-4bbf-9aa7-e316adebbf66.png) <br>
	- **๋ก๊ทธ์ธ์ด ๋์ด์์ง ์์ ๋**(๋นํ์์ธ ๊ฒฝ์ฐ) - `์ญ์ ํ๊ธฐ` ๋ฒํผ์ด ๋ณด์ด์ง ์๋๋ค.
![reply4](https://user-images.githubusercontent.com/88135219/147481057-b66b1afc-a30b-4002-8d96-b833d9e5d52d.png)

----
### ๐ค ํ๋ก์ ํธ ์งํ ์ค ๋ฌธ์ ์ ๊ณผ ํด๊ฒฐ๋ฐฉ์
----
#### ๋ฌธ์ ์ 
- ๊ฒ์ํ์ ์นดํ๊ณ ๋ฆฌ๋ณ๋ก ๋๋์์ง๋ง ๋ค์ค ์นดํ๊ณ ๋ฆฌ๋ก ๋๋์ด ์ธ๋ถ์นดํ๊ณ ๋ฆฌ์ ๋ง๋ ๊ฒ์ํ ํ์ด์ง๊ฐ ๋์ค๊ฒ ๊ตฌํ์ ์ด๋ป๊ฒ ํด์ผํ ์ง ๋ง๋งํ๋ค.
- JPA์์ ๊ธฐ๋ณธ์ผ๋ก ์ ๊ณตํ๋ ๋ฉ์๋์ธ Id๊ฐ์ ํ๋ผ๋ฏธํฐ๋ก SELECTํ  ์ ์๋ findbyID ๋ฉ์๋๋ฅผ ์ด์ฉํ  ์ ์์๋ค.
	- ์ง์ญ ๊ฒ์ํ์ ์ง์ญ ์นดํ๊ณ ๋ฆฌ๊ฐ Id๊ฐ์ด ์๋ `@ManyToOne` `JoinColumn(name = "tagrel_no")` ๋ก ์ค์  ๋์ด์๋ค.
#### ํด๊ฒฐ๋ฐฉ์
- JPQL๋ฌธ๋ฒ์ ์ฌ์ฉํ์ฌ BoardRepository์ ๋ฐ๋ก ์ ์ธํด์ฃผ์๋ค.
```java
@Query(value = "select b from Board b where b.tag.tagrelNo=?1" ) 
	Page<Board> selectByTag(Long tagrelNo, Pageable pageable);
```

----
### โ ํ๋ก์ ํธ ๋ฆฌ๋ทฐ ๋ฐ ๊ฐ์ ๋ฐฉํฅ
----
- ๋ฌธ์์์์ผ๋ก ์ ์ค์ผ์ด์ค ๋ช์ธ์์ ์กํฐ๋นํฐ ๋ค์ด์ด๊ทธ๋จ์ ์ค๊ณํ ํ ์ฝ๋ฉ์ ํ๋ฉด์ ์ด์  ํ๋ก์ ํธ๋ณด๋ค ๋์ฑ ๊ฒฌ๊ณ ํ๊ณ  ๋จ๋จํ๊ฒ ์งํํ  ์ ์์๋ค.
- ์ฒ์ ์ฌ์ฉํด ๋ณธ SpringBoot์ JPA๋ ํธ๋ฆฌํ์ง๋ง ๊ธฐ์ด ๊ฐ๋์ด ์ฒ ์ ํ๊ฒ ์กํ์์ด์ผ ํ๊ณ , ๋ ๊ณต๋ถํด์ผํ  ๊ฒ ๊ฐ๋ค.
- ์ค๋ณต๋๋ ์ฝ๋ ์ต๋ํ ์ ๋ฆฌํ๊ธฐ
- DBํ์ด๋ธ ์ฒ์ ์ค๊ณ์ ๋ชํํ ์ค๊ณ์ ํ์์ฑ
