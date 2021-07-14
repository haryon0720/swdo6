--���� ���̺�
create table user_table(
    user_id     varchar2(30)    primary key
    ,user_pw    varchar2(30)    not null
    ,user_nm    varchar2(30)    not null
    ,user_email varchar2(30)    not null
    ,user_phone varchar2(30)   not null
);

--���� ���̺�
create table request_table(
    request_no        number          primary key,    --�۹�ȣ
    user_id     varchar2(30)    not null,       --�ۼ���
    request_title     varchar2(100)   not null,       --������
    request_indate    date            default sysdate, --�ۼ���
    request_hits      number          default 0,      --��ȸ��
    request_content   varchar2(3000)  not null,       --�۳���
    constraint request_table_fk foreign key(user_id)
    references user_table(user_id) on delete cascade
);
create sequence request_sequence;

--����(��ȭ) ���̺�
create table board_table(
    board_no        number      primary key
    ,board_title    varchar2(300)       not null
    ,user_id        varchar2(30)    not null
    ,board_content  varchar2(3000)      not null
    ,board_type     char(1)             default 0
    ,board_indate    date       not null
    ,constraint board_table_fk foreign key(user_id)
    references user_table(user_id)
);
create sequence board_sequence;

--���ϱ� ���̺�(���� ���� �� �ʿ���)
create table like_table(
    like_no     number   primary key,
    board_no    number      not null,
    user_id     varchar2(30)    not null,
    like_check  number  default 0,
    constraint like_fk1 foreign key (board_no)
    REFERENCES board_table(board_no) on delete cascade,
    constraint like_fk2 foreign key (user_id)
    REFERENCES user_table(user_id) on delete cascade
);
create sequence like_sequence;


--�ð��� ���ٸ� ��� ���̺�
--create table reply_tb(
--    reply_no    number    primary key,
--    user_id     varchar2(30)    not null,
--    reply_context   varchar2(3000)  not null,
--    reply_indate    date            default sysdate,
--    board_no        number      not null,
--    constraint reply_fk3 foreign key (user_id) 
--    REFERENCES user_tb2(user_id),
--    constraint reply_fk4 foreign key (board_no)
--    REFERENCES board_tb2(board_no) on delete cascade
--);
