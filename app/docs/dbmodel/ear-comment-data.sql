-- 댓글 테스트 값 
insert into comment(comment_no, board_no, member_no, content, isPublic, replyCount, group_no, order_no, class_no, parent_comment_no)
values(1, 1, 2, '비밀댓글이지롱', 2, 0, 1, 1, 0, 0);
     
insert into comment(comment_no, board_no, member_no, content, isPublic, replyCount, group_no, order_no, class_no, parent_comment_no)
values(2, 1, 3, '상어는 내친구 하하하', 1, 1, 2, 1, 0, 0);

    -- 대댓글 테스트 값
		insert into comment(comment_no, board_no, member_no, content, isPublic, replyCount, group_no, order_no, class_no, parent_comment_no)
		values(5, 1, 11, '사자도 내 친구', 1, 0, 2, 2, 1, 2);
 
insert into comment(comment_no, board_no, member_no, content, isPublic, replyCount, group_no, order_no, class_no, parent_comment_no)
values(3, 1, 4, '비밀 비밀', 2, 0, 3, 1, 0, 0);
 
insert into comment(comment_no, board_no, member_no, content, isPublic, replyCount, group_no, order_no, class_no, parent_comment_no)
values(4, 1, 5, '고등어 자반 맛있는데,,,', 1, 0, 4, 1, 0, 0);
 


