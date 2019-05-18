drop database if exists nthexam;

create database nthexam;
use nthexam;

create table user (
	id VARCHAR(50) NOT NULL,
	name VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	PRIMARY KEY (id)
);

insert into user (id, name, email) values ("5c7cedfdfc13ae0512000000", "Bartram Muriel", "bmuriel0@bloomberg.com");
insert into user (id, name, email) values ("5c7cedfdfc13ae0512000001", "Steward Minty", "sminty1@icio.us");
insert into user (id, name, email) values ("5c7cedfdfc13ae0512000002", "Pooh Proschek", "pproschek2@sakura.ne.jp");
insert into user (id, name, email) values ("5c7cedfdfc13ae0512000003", "Brigid Dreghorn", "bdreghorn3@pbs.org");
insert into user (id, name, email) values ("5c7cedfdfc13ae0512000004", "Hortensia Barten", "hbarten4@chron.com");

create table exam (
	id VARCHAR(50) NOT NULL,
	exam VARCHAR(50) NOT NULL,
	PRIMARY KEY (id)
);
insert into exam (id, exam) values ("5c7cef88fc13ae1ef9000000", "GATE");
insert into exam (id, exam) values ("5c7cef88fc13ae1ef9000001", "CAT");
insert into exam (id, exam) values ("5c7cef88fc13ae1ef9000002", "SAT");
insert into exam (id, exam) values ("5c7cef88fc13ae1ef9000003", "GRE");
insert into exam (id, exam) values ("5c7cef88fc13ae1ef9000004", "JEE");

CREATE TABLE userexam (
  id VARCHAR(50) NOT NULL,
  user_id VARCHAR(50) ,
  exam_id VARCHAR(50) 
);
ALTER TABLE userexam ADD FOREIGN KEY (user_id) REFERENCES user(id);
ALTER TABLE userexam ADD FOREIGN KEY (exam_id) REFERENCES exam(id);

insert into userexam (id, user_id, exam_id) values ("5c7cef88fc13ae1ef9100000", "5c7cedfdfc13ae0512000000", "5c7cef88fc13ae1ef9000000");
insert into userexam (id, user_id, exam_id) values ("5c7cef88fc13ae1ef9100001", "5c7cedfdfc13ae0512000001", "5c7cef88fc13ae1ef9000002");
insert into userexam (id, user_id, exam_id) values ("5c7cef88fc13ae1ef9100002", "5c7cedfdfc13ae0512000002", "5c7cef88fc13ae1ef9000001");
insert into userexam (id, user_id, exam_id) values ("5c7cef88fc13ae1ef9100003", "5c7cedfdfc13ae0512000003", "5c7cef88fc13ae1ef9000003");
insert into userexam (id, user_id, exam_id) values ("5c7cef88fc13ae1ef9100004", "5c7cedfdfc13ae0512000004", "5c7cef88fc13ae1ef9000000");
insert into userexam (id, user_id, exam_id) values ("5c7cef88fc13ae1ef9100005", "5c7cedfdfc13ae0512000000", "5c7cef88fc13ae1ef9000001");
insert into userexam (id, user_id, exam_id) values ("5c7cef88fc13ae1ef9100006", "5c7cedfdfc13ae0512000001", "5c7cef88fc13ae1ef9000002");
insert into userexam (id, user_id, exam_id) values ("5c7cef88fc13ae1ef9100007", "5c7cedfdfc13ae0512000000", "5c7cef88fc13ae1ef9000004");
insert into userexam (id, user_id, exam_id) values ("5c7cef88fc13ae1ef9100008", "5c7cedfdfc13ae0512000003", "5c7cef88fc13ae1ef9000001");
insert into userexam (id, user_id, exam_id) values ("5c7cef88fc13ae1ef9100009", "5c7cedfdfc13ae0512000000", "5c7cef88fc13ae1ef9000004");

create table question (
	id VARCHAR(50) NOT NULL,
	description TEXT,
	answer VARCHAR(1),
	exam_id VARCHAR(50) NOT NULL,
	PRIMARY KEY (id)
);

ALTER TABLE question ADD FOREIGN KEY (exam_id) REFERENCES exam(id);

insert into question (id, description, answer, exam_id) values ("5c7d018cfc13ae1bb000000a", "Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.", "C", "5c7cef88fc13ae1ef9000000");
insert into question (id, description, answer, exam_id) values ("5c7d018cfc13ae1bb000000b", "Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.", "D", "5c7cef88fc13ae1ef9000001");
insert into question (id, description, answer, exam_id) values ("5c7d018cfc13ae1bb000000c", "Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.", "B", "5c7cef88fc13ae1ef9000001");
insert into question (id, description, answer, exam_id) values ("5c7d018cfc13ae1bb000000d", "Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo.", "A", "5c7cef88fc13ae1ef9000002");
insert into question (id, description, answer, exam_id) values ("5c7d018cfc13ae1bb000000e", "Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo.", "B", "5c7cef88fc13ae1ef9000002");
insert into question (id, description, answer, exam_id) values ("5c7d018cfc13ae1bb000000f", "Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo.", "D", "5c7cef88fc13ae1ef9000002");
insert into question (id, description, answer, exam_id) values ("5c7d018cfc13ae1bb000000g", "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque.", "C", "5c7cef88fc13ae1ef9000003");
insert into question (id, description, answer, exam_id) values ("5c7d018cfc13ae1bb000000h", "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque.", "B", "5c7cef88fc13ae1ef9000003");
insert into question (id, description, answer, exam_id) values ("5c7d018cfc13ae1bb000000i", "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque.", "A", "5c7cef88fc13ae1ef9000003");
insert into question (id, description, answer, exam_id) values ("5c7d018cfc13ae1bb000000j", "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque.", "D", "5c7cef88fc13ae1ef9000003");
insert into question (id, description, answer, exam_id) values ("5c7d018cfc13ae1bb000000k", "Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.", "D", "5c7cef88fc13ae1ef9000004");
insert into question (id, description, answer, exam_id) values ("5c7d018cfc13ae1bb000000l", "Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.", "B", "5c7cef88fc13ae1ef9000004");

create table userquestion (
	id VARCHAR(50) NOT NULL,
	user_id VARCHAR(50) NOT NULL,
	question_id VARCHAR(50) NOT NULL
);
ALTER TABLE userquestion ADD FOREIGN KEY (user_id) REFERENCES user(id);
ALTER TABLE userquestion ADD FOREIGN KEY (question_id) REFERENCES question(id);

insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae00001e", "5c7cedfdfc13ae0512000003", "5c7d018cfc13ae1bb000000f");
insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae00001f", "5c7cedfdfc13ae0512000004", "5c7d018cfc13ae1bb000000e");
insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae000020", "5c7cedfdfc13ae0512000000", "5c7d018cfc13ae1bb000000d");
insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae000021", "5c7cedfdfc13ae0512000003", "5c7d018cfc13ae1bb000000c");
insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae000022", "5c7cedfdfc13ae0512000004", "5c7d018cfc13ae1bb000000b");
insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae000023", "5c7cedfdfc13ae0512000004", "5c7d018cfc13ae1bb000000a");

insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae000024", "5c7cedfdfc13ae0512000003", "5c7d018cfc13ae1bb000000l");
insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae000025", "5c7cedfdfc13ae0512000003", "5c7d018cfc13ae1bb000000k");
insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae000026", "5c7cedfdfc13ae0512000004", "5c7d018cfc13ae1bb000000j");
insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae000027", "5c7cedfdfc13ae0512000004", "5c7d018cfc13ae1bb000000i");
insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae000028", "5c7cedfdfc13ae0512000002", "5c7d018cfc13ae1bb000000h");
insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae000029", "5c7cedfdfc13ae0512000003", "5c7d018cfc13ae1bb000000g");

insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae00002a", "5c7cedfdfc13ae0512000004", "5c7d018cfc13ae1bb000000f");
insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae00002b", "5c7cedfdfc13ae0512000001", "5c7d018cfc13ae1bb000000e");
insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae00002c", "5c7cedfdfc13ae0512000003", "5c7d018cfc13ae1bb000000d");
insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae00002d", "5c7cedfdfc13ae0512000004", "5c7d018cfc13ae1bb000000c");
insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae00002e", "5c7cedfdfc13ae0512000004", "5c7d018cfc13ae1bb000000b");
insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae00002f", "5c7cedfdfc13ae0512000000", "5c7d018cfc13ae1bb000000a");

insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae000030", "5c7cedfdfc13ae0512000004", "5c7d018cfc13ae1bb000000l");
insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae000031", "5c7cedfdfc13ae0512000004", "5c7d018cfc13ae1bb000000k");
insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae000032", "5c7cedfdfc13ae0512000004", "5c7d018cfc13ae1bb000000j");
insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae000033", "5c7cedfdfc13ae0512000001", "5c7d018cfc13ae1bb000000i");
insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae000034", "5c7cedfdfc13ae0512000004", "5c7d018cfc13ae1bb000000h");
insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae000035", "5c7cedfdfc13ae0512000003", "5c7d018cfc13ae1bb000000g");

insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae000036", "5c7cedfdfc13ae0512000002", "5c7d018cfc13ae1bb000000f");
insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae000037", "5c7cedfdfc13ae0512000003", "5c7d018cfc13ae1bb000000e");
insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae000038", "5c7cedfdfc13ae0512000004", "5c7d018cfc13ae1bb000000d");
insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae000039", "5c7cedfdfc13ae0512000004", "5c7d018cfc13ae1bb000000c");
insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae00003a", "5c7cedfdfc13ae0512000004", "5c7d018cfc13ae1bb000000b");
insert into userquestion (id, user_id, question_id) values ("5c7d0bb6fc13ae1fae00003b", "5c7cedfdfc13ae0512000004", "5c7d018cfc13ae1bb000000a");


