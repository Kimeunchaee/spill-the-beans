-- 회원
DROP TABLE IF EXISTS member RESTRICT;

-- 댓글
DROP TABLE IF EXISTS comment RESTRICT;

-- 카테고리
DROP TABLE IF EXISTS category RESTRICT;

-- 게시판
DROP TABLE IF EXISTS board RESTRICT;

-- 레벨
DROP TABLE IF EXISTS level RESTRICT;

-- 파일
DROP TABLE IF EXISTS file RESTRICT;

-- 회원
CREATE TABLE member (
  member_no  INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
  nickname   VARCHAR(50)  NOT NULL COMMENT '닉네임', -- 닉네임
  email      VARCHAR(40)  NOT NULL COMMENT '이메일', -- 이메일
  password   VARCHAR(100) NOT NULL COMMENT '비밀번호', -- 비밀번호
  created_dt DATE         NOT NULL DEFAULT curdate() COMMENT '가입일', -- 가입일
  active     INTEGER      NOT NULL DEFAULT 1 COMMENT '탈퇴여부' -- 탈퇴여부
)
COMMENT '회원';

-- 회원
ALTER TABLE member
  ADD CONSTRAINT PK_member -- 회원 기본키
    PRIMARY KEY (
      member_no -- 회원번호
    );

ALTER TABLE member
  MODIFY COLUMN member_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '회원번호';

-- 댓글
CREATE TABLE comment (
  comment_no INTEGER      NOT NULL COMMENT '댓글번호', -- 댓글번호
  member_no  INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
  board_no   INTEGER      NOT NULL COMMENT '게시글번호', -- 게시글번호
  content    VARCHAR(255) NOT NULL COMMENT '내용', -- 내용
  created_dt DATE         NOT NULL DEFAULT curdate() COMMENT '등록일', -- 등록일
  isPublic   INTEGER      NOT NULL DEFAULT 1 COMMENT '공개여부', -- 공개여부
  replyCount INTEGER      NOT NULL COMMENT '리댓 수' -- 리댓 수
)
COMMENT '댓글';

-- 댓글
ALTER TABLE comment
  ADD CONSTRAINT PK_comment -- 댓글 기본키
    PRIMARY KEY (
      comment_no -- 댓글번호
    );

ALTER TABLE comment
  MODIFY COLUMN comment_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '댓글번호';

-- 카테고리
CREATE TABLE category (
  category_no INTEGER      NOT NULL COMMENT '카테고리 번호', -- 카테고리 번호
  label       VARCHAR(255) NOT NULL COMMENT '카데고리 이름' -- 카데고리 이름
)
COMMENT '카테고리';

-- 카테고리
ALTER TABLE category
  ADD CONSTRAINT PK_category -- 카테고리 기본키
    PRIMARY KEY (
      category_no -- 카테고리 번호
    );

ALTER TABLE category
  MODIFY COLUMN category_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '카테고리 번호';

-- 게시판
CREATE TABLE board (
  board_no     INTEGER      NOT NULL COMMENT '게시글번호', -- 게시글번호
  member_no    INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
  category_no  INTEGER      NOT NULL COMMENT '카테고리 번호', -- 카테고리 번호
  title        VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
  content      VARCHAR(255) NOT NULL COMMENT '내용', -- 내용
  viewCount    INTEGER      NOT NULL COMMENT '조회수', -- 조회수
  created_dt   DATE         NOT NULL DEFAULT curdate() COMMENT '등록일', -- 등록일
  likeCount    INTEGER      NOT NULL COMMENT '좋아요 수', -- 좋아요 수
  commentCount INTEGER      NOT NULL COMMENT '댓글 수' -- 댓글 수
)
COMMENT '게시판';

-- 게시판
ALTER TABLE board
  ADD CONSTRAINT PK_board -- 게시판 기본키
    PRIMARY KEY (
      board_no -- 게시글번호
    );

ALTER TABLE board
  MODIFY COLUMN board_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '게시글번호';

-- 레벨
CREATE TABLE level (
  no   INTEGER      NOT NULL COMMENT '레벨 번호', -- 레벨 번호
  name VARCHAR(255) NOT NULL COMMENT '레벨 이름' -- 레벨 이름
)
COMMENT '레벨';

-- 레벨
ALTER TABLE level
  ADD CONSTRAINT PK_level -- 레벨 기본키
    PRIMARY KEY (
      no -- 레벨 번호
    );

-- 파일
CREATE TABLE file (
  no       INTEGER            NOT NULL COMMENT '파일 번호', -- 파일 번호
  name     VARCHAR(255)       NOT NULL COMMENT '파일 이름', -- 파일 이름
  board_no <데이터 타입 없음> NULL     COMMENT '게시글 번호' -- 게시글 번호
)
COMMENT '파일';

-- 파일
ALTER TABLE file
  ADD CONSTRAINT PK_file -- 파일 기본키
    PRIMARY KEY (
      no -- 파일 번호
    );

-- 댓글
ALTER TABLE comment
  ADD CONSTRAINT FK_board_TO_comment -- 게시판 -> 댓글
    FOREIGN KEY (
      board_no -- 게시글번호
    )
    REFERENCES board ( -- 게시판
      board_no -- 게시글번호
    );

-- 댓글
ALTER TABLE comment
  ADD CONSTRAINT FK_member_TO_comment -- 회원 -> 댓글
    FOREIGN KEY (
      member_no -- 회원번호
    )
    REFERENCES member ( -- 회원
      member_no -- 회원번호
    );

-- 게시판
ALTER TABLE board
  ADD CONSTRAINT FK_member_TO_board -- 회원 -> 게시판
    FOREIGN KEY (
      member_no -- 회원번호
    )
    REFERENCES member ( -- 회원
      member_no -- 회원번호
    );

-- 게시판
ALTER TABLE board
  ADD CONSTRAINT FK_category_TO_board -- 카테고리 -> 게시판
    FOREIGN KEY (
      category_no -- 카테고리 번호
    )
    REFERENCES category ( -- 카테고리
      category_no -- 카테고리 번호
    );