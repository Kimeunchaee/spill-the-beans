# spill-the-beans 임금님 귀는 당나귀 귀👂

[이혜연](https://github.com/lee-hyeyeon)
[조솔](https://github.com/jo-sol)
[김은채](https://github.com/Kimeunchaee)
</br>

## 프로젝트 소개
1. 주제: 임금님 귀는 당나귀 귀👂</br>
2. 목표: 주위 사람들에게 털어 놓을 수 없는, 털어 놓지 못해 답답한 사람들을 위해</br>
자신만의 비밀이나 속마음을 어딘가에 쏟을 수 있도록 도와주는 사소하면서 웃기고 슬픈 TMI를 익명으로 공유할 수 있는 프로젝트</br>

## 프로젝트 기간
1. 2021.12.06 ~ 2021.12.22 (약 2 주)

----------------------------------------------------------------------------------------------------

## 1일차(2021-12-06,월)
- 프로젝트 주제 선정 및 세팅
	- 공용 깃허브 생성
    - .gitignore 설정
    - gradle eclipse 설정
    - 테이블 설정
    - DB 설정
        - 로컬 MySQL 서버에 접속
            > mysql -u root -p
        - MySQL 사용자 추가
            > CREATE USER 'ear'@'localhost' IDENTIFIED BY '1111';
        - MySQL 데이터베이스 생성
            > CREATE DATABASE eardb
              DEFAULT CHARACTER SET utf8
              DEFAULT COLLATE utf8_general_ci;
        - MySQL 사용자에게 데이터베이스 사용 권한 부여
            > GRANT ALL ON eardb.* TO 'ear'@'localhost';
        - MySQL 사용자 목록 조회
            > select user from mysql.user;

- 프로젝트 시작
    - DB 모델링
        - 테이블 생성
    - npm install
    - Tomcat 서버 생성
        - 클라이언트/서버 프로젝트 준비
    - DTO 생성
        - BoardDTO
        - CategoryDTO
        - CommnetDTO
        - MemberDTO
    - JSP 적용
        - auth
        - footer
        - header
        - home
        - template1

- 회의 내용
    - 도메인 추가
    - 테이블 추가

## 2일차(2021-12-08, 수)
- 파트 분배
    - 혜연: 게시판
    - 솔: 유저
    - 은채: 댓글
    - 공용: 카테고리, 로그인

- DBMS(데이터베이스 관리 시스템: database management system)
    - DQL, DML 작성
    - BoardDao.xml
    - CategoryDao.xml
    - CommentDao.xml
    - MemberDao.xml

- Data SQL
    - board-data.sql
    - category-data.sql
    - comment-data.sql
    - member-data.sql

- 서블릿(Spring WebMVC Framework 적용)
    - AuthController
    - BoardController
    - CommentController
    - HomeController
    - MemberController

- 서블릿 프로그래밍
    - JSP 프로그래밍(통합)
        - board
        - comment
        - member

## 3일차(2021-12-10, 금)
- 프로젝트 회의
    - 관리자/유저 로그인 관련
        - 사용자 인증: 로그인
        - 사용자 인증: 내 정보 보기
        - 사용자 인증: 로그인 정보 활용
        - 사용자 인증: 로그인 여부에 따라 메뉴 출력 제어

- Data SQL
    - 관리자 추가
    - member-data.sql 수정

## 4일차(2021-12-13, 월)
- 템플릿 적용
    - 메인 페이지 : 소개, 로고, 배경 구현
    - 헤더 : 메뉴 구현, 로그인 여부에 따라 메뉴 출력 제어(비회원, 회원, 관리자)
    - 로그인, 로그아웃
    - 로그인 실패 페이지 구현 미완성

- UI 틀 잡기 완성

## 5일차(2021-12-14, 화)
- 로그인 실패 페이지 구현 완료

- 회원 가입 폼 구현
    - 닉네임 중복검사 구현 완료
    - 이메일 중복검사 구현 완료

- ID/PW 찾기 구현
    - 이메일 찾기 폼 구현 완료
    - 비밀번호 찾기 폼 구현 완료

- 마이페이지 구현
    - 마이페이지 상세 구현 완료

## 6일차(2021-12-16, 목)
- 회원 마이페이지
    - 회원 마이페이지 구현 완료
    - 마이페이지 수정 구현 완료
        - 비밀번호 수정 구현 완료
    - 탈퇴 구현 완료
        - 탈퇴 성공 시 메시지 팝업 구현 완료
        - 탈퇴 성공 시 jsp에서 refresh를 활용하여 페이지 이동 구현 완료
        - 탈퇴 실패 시 메시지 팝업 구현 완료

- 회원 가입 폼 구현
    - 회원 가입 완료 시 메시지 팝업 구현 완료

- 관리자 페이지
    - 회원 목록 메시지 팝업 구현 완료
    - 회원 목록 메시지 팝업에서 페이징 구현 완료

## 7일차(2021-12-17, 금)
- 관리자용 회원 관리
    - 회원 상세보기 페이지 구현 완료
    - 회원 탈퇴 시키기 구현 완료
        - 회원 상태에 따른 상세페이지 구현 완료
        - 탈퇴 완료 메세지 팝업 구현 완료

- 뒤로가기 버튼 구현
    - history.back(); 을 사용하여 뒤로 가기 버튼 구현 완료

- 게시판 목록
    - 게시판 목록 바로 가기 링크 연결
    - 게시판 목록 검색 기능 구현 완료
        - BoardController --> search() 추가
        - BoardDao.xml --> findByKeyword 추가
        - 전체 검색 기능
        - 제목 검색 기능
        - 작성자 검색 기능
    - 게시판 목록 비어있을 때, 검색 목록 비어있을 때 구현 완료
    - 홈 버튼 추가
        - fortawesome npm install

- Board 테스트 값 수정

- Board 테이블 수정

## 8일차(2021-12-18, 토)
- 게시판 목록
    - 비회원일때 목록만 조회 가능

- 게시판 상세
    - 게시판 상세 CSS 구현 완료

- 게시판 수정
    - 게시판 수정 기능 구현 완료
    - 게시판 수정 css 구현 완료

- 게시판 삭제
    - 게시판 삭제 팝업 구현 완료
    - 게시판 삭제 기능 구현 완료
    - 게시판 삭제 css 구현 완료

- 댓글
    - 댓글 목록 css 구현 완료
    - 비밀 댓글 아이콘 변경
    - 비밀 댓글 출력 내용 변경

## 9일차(2021-12-19, 일)
- 게시판 등록
    - 게시판 등록 기능 구현 완료
    - 게시판 등록 CSS 구현 완료
    - 게시판 등록 팝업 구현 완료
    - 게시판 등록 시 제목이나 내용이 비어있을 때 알림창 팝업 구현 완료
    - 게시판 내용 등록 시 글자 수 출력 완료

- 등록 취소 버튼 구현
    - location.hash = ''; 구현 완료

- 게시판 좋아요
    - BoardLike 테이블 추가
    - BoardLikeDTO 추가
    - BoardDao.xml 수정
    - BoardController에 like 추가
    - BoardController에 unlike 추가
    - 좋아요 기능 구현 완료
    - 좋아요 취소 기능 구현 완료
    - 좋아요 중복 방지 기능 구현 완료
    - 좋아요 유무에 따른 아이콘 변경 구현 완료

- 게시판 상세
    - 게시판 내용 스크롤 기능 살리고 스크롤 숨기기

- 게시판 댓글
    - CommentController 수정
        - update 메서드 수정 완료
        - updateFormPopUp 메서드 추가 완료
    - 댓글 등록
        - 기능, CSS 구현 완료
    - 댓글 삭제
        - 기능, CSS 구현 완료
    - 댓글 수정
        - 기능 구현 중
        - 팝업 메세지 구현 완료
            - RedirectAttributes 사용해서 파라미터 넘기기
            - @RequestParam 사용해서 파라미터 받기
        - 팝업 CSS 구현 완료
        - 팝업에서 취소 버튼 구현 완료
            - onclick="history.back();" 활용
        - 팝업에서 radio 버튼으로 공개 / 비밀 체크 활용할 수 있도록 구현 완료

## 10일차(2021-12-20, 월)

- TO-DO
    - 대댓글 CRUD
    - 댓글 수정 팝업에서 엑스 누르면 홈으로 가는 거 수정하기