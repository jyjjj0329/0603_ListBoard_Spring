# 0603_ListBoard_Spring

## 개요
검색기능, 페이징 등을 넣은 CRUD가 가능한 기본 게시판입니다.
![listBoard_mainPage](https://user-images.githubusercontent.com/60992445/84010378-868d4e80-a9af-11ea-852d-5e70b8086ac8.png)

### 테이블
##### board 테이블
이름|타입|제약조건|활용이유
------|---|---
idx|number|primary key|번호
title|varchar2(40)|not null|제목
content|varchar2(1000)|not null|본문
writer|varchar2(20)|not null|작가
ref|number|default 0|조회수
reg_date|date|default sysdate|작성일
 
 ### 사용 기술
-------------------------------------------------------------------------
 <div>
<img width="220" src = "https://user-images.githubusercontent.com/60992445/83321103-601d3400-a288-11ea-816f-8817f19d4910.png">
<img width="220" src = "https://user-images.githubusercontent.com/60992445/83321165-a2df0c00-a288-11ea-8219-d906b31c00a3.jpg">
<img width="220" src = "https://user-images.githubusercontent.com/60992445/83321181-c43ff800-a288-11ea-9235-391c6ff715dc.png">
<img width="220" src = "https://user-images.githubusercontent.com/60992445/83321186-ca35d900-a288-11ea-9e8c-9a3422344f9f.png">
</div>

