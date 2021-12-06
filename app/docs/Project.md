# spill-the-beans 임금님 귀는 당나귀 귀👂

푸쉬 내용: "날짜 push 내용"</br>
에러 내용: "날짜 error 내용"</br>

## 프로젝트 도메인
1. 회원가입
   > 닉네임
   > 이메일
   > 비밀번호
2. 마이 페이지
   > 닉네임, 비밀번호 수정
   > 내가 작성한 글 목록
   > 좋아요 한 글 목록 보기
3. 관리자
   > 회원 관리
   > 게시글 관리
4. 게시판 탭/카테고리/말머리 중 택1
   > "일" "학업" "일상"
5. 게시판 - CRUD
   - 카테고리
6. 댓글 - CRUD
   > 비밀 댓글, 공개 댓글
   > 리댓(여러개)
7. 게시글 좋아요

## 프로젝트 보류 기능
1. 회원 레벨 등급 - 자동 등업
2. 첨부 파일 업로드

## 프로젝트 테이블
1. 멤버(관리자 포함)
   - int no
   - String nickname
   - String email
   - String password
   - Date registeredDate
   - int active

2. 게시판 - CRUD
   - int no
   - String title
   - string content
   - int viewCount
   - Date registeredDate
   - Member writer
   - int like
   - int commentCount (댓글 수)
   - int categoryNo

3. 게시판 카테고리
   - int no
   - String label

4. 댓글 - CRUD
   - int no
   - String content
   - Member writer
   - Date registeredDate
   - boolean isPublic (true - public / false - private)
   - int replyCount (리댓 수)
   - Board Board