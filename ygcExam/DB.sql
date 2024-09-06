DROP DATABASE IF EXISTS `ygcExam`;
CREATE DATABASE `ygcExam`;
USE `ygcExam`;

# article 테이블 생성
CREATE TABLE article(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    title CHAR(100) NOT NULL,
    `body` TEXT NOT NULL
);


# article 테스트 데이터 생성
INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목1',
`body` = '내용1';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목2',
`body` = '내용2';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목3',
`body` = '내용3';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목4',
`body` = '내용4';

# board 테이블 생성
CREATE TABLE board(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    `code` CHAR(50) NOT NULL UNIQUE COMMENT 'notice(공지사항), free(자유), QnA(질의응답) ...',
    `name` CHAR(20) NOT NULL UNIQUE COMMENT '게시판 이름',
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '삭제 여부 (0=삭제 전, 1=삭제 후)',
    delDate DATETIME COMMENT '삭제 날짜'
);

ALTER TABLE article ADD COLUMN boardId INT(10) UNSIGNED NOT NULL;

# board 테스트 데이터 생성
INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'NOTICE',
`name` = '공지사항';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'FREE',
`name` = '자유';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'QnA',
`name` = '질의응답';

UPDATE article
SET boardId = 1
WHERE id IN (1,2);

UPDATE article
SET boardId = 2
WHERE id = 3;

UPDATE article
SET boardId = 3
WHERE id = 4;

CREATE TABLE faq(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `code` CHAR(50) NOT NULL UNIQUE COMMENT 'member(회원)',
    `name` CHAR(50) NOT NULL UNIQUE COMMENT '질문 카테고리',
    title CHAR(200) NOT NULL,
    `body` TEXT NOT NULL
);

## FAQ 테스트데이터 생성
INSERT INTO faq
SET title = '1. 회원가입 절차가 어떻게 되나요?',
`code` = 'member',
`name` = '회원',
`body` = '웹사이트나 앱에서 "회원가입" 버튼을 클릭하고, 이메일 주소 또는 휴대폰 번호로 계정을 생성합니다. 이후, 기본 정보(이름, 비밀번호 등)를 입력하고 본인 인증을 완료하면 가입이 완료됩니다.';


INSERT INTO faq
SET title = '2. 비밀번호를 잊어버렸어요. 어떻게 해야 하나요?',
`code` = 'member',
`name` = '회원',
`body` = '로그인 페이지에서 "비밀번호 찾기" 버튼을 클릭하고, 등록된 이메일 또는 휴대폰 번호를 입력하면 비밀번호 재설정 링크가 전송됩니다. 이를 통해 새로운 비밀번호를 설정할 수 있습니다.';

INSERT INTO faq
SET title = '3. 회원정보를 수정하고 싶어요.'
`body` = '로그인 후, 마이페이지 또는 프로필 관리 페이지에서 이름, 비밀번호, 연락처 등의 정보를 수정할 수 있습니다.';

INSERT INTO faq
SET title = '4. 회원 탈퇴는 어떻게 하나요?',
`code` = 'member',
`name` = '회원',
`body` = '마이페이지의 "계정 관리" 섹션에서 "회원 탈퇴" 버튼을 클릭하고, 안내에 따라 탈퇴를 완료할 수 있습니다. 탈퇴 시 모든 개인 정보와 활동 기록이 삭제됩니다.';

INSERT INTO faq
SET title = '5. 탈퇴 후 재가입이 가능한가요?',
`code` = 'member',
`name` = '회원',
`body` = '탈퇴 후 재가입은 가능하지만, 일정 기간 동안 동일한 이메일 주소로는 재가입이 제한될 수 있습니다.';