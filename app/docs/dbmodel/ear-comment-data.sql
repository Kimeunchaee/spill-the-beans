-- 댓글 테스트 값 
insert into comment(comment_no, board_no, member_no, content, isPublic, replyCount, group_no, order_no, class_no, parent_comment_no)
values(1, 3, 9, '어떻게 해결 하셨어요? 저희 옆집도 그러는데 미칠 것 같네요.. 이웃 주민끼리 싸움 크게 나는 꼴 보기 싫어서 제가 조심히 살고 있긴 한데 언제까지 이러고 살아야 할까요.. ㅜㅜ', 2, 0, 1, 1, 0, 0);
     
insert into comment(comment_no, board_no, member_no, content, isPublic, replyCount, group_no, order_no, class_no, parent_comment_no)
values(2, 3, 15, '어휴.. 맘 고생 많으시겠어요... ', 1, 1, 2, 1, 0, 0);

    -- 대댓글 테스트 값
		insert into comment(comment_no, board_no, member_no, content, isPublic, replyCount, group_no, order_no, class_no, parent_comment_no)
		values(5, 3, 3, '그러게요 이사 갈수도 없고 이사를 보낼 수도 없고 힘드네요 ㅠㅠ', 1, 0, 2, 2, 1, 2);
 
insert into comment(comment_no, board_no, member_no, content, isPublic, replyCount, group_no, order_no, class_no, parent_comment_no)
values(3, 3, 14, '예민하면 산에서 살것이지ㅡㅡ 힘내세여', 1, 0, 3, 1, 0, 0);
 
insert into comment(comment_no, board_no, member_no, content, isPublic, replyCount, group_no, order_no, class_no, parent_comment_no)
values(4, 3, 8, '똑같이 겪어봐야 안그럴거에요, 그대로 해보세요', 1, 0, 4, 1, 0, 0);
 


