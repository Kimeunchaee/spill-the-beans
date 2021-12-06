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
- 회의 내용
    - 도메인 추가
    - 테이블 추가

