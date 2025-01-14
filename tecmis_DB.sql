DROP DATABASE IF EXISTS tecmis_DB;
create database tecmis_DB;
use tecmis_DB;

DROP TABLE IF EXISTS admin;
CREATE TABLE IF NOT EXISTS admin (
  ad_id varchar(20) NOT NULL,
  f_name varchar(255) NOT NULL,
  l_name varchar(255) NOT NULL,
  address varchar(255) NOT NULL,
gender varchar(20) NOT NULL,
  dob date NOT NULL,
  email varchar(255) NOT NULL,
  role varchar(20) NOT NULL,
  picture_path varchar(200) NOT NULL,
  PRIMARY KEY (ad_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO admin(ad_id,f_name,l_name,address,gender,dob,email,role,picture_path)
VALUES("AD001","Kavinda","Wijayesena","No 12,Kamburupiya,Matara","Male",'1985-10-12',"kavinda@gmail.com","Admin","");

DROP TABLE IF EXISTS admin_phone;
CREATE TABLE admin_phone(
	ad_id varchar(50) NOT NULL,
    ad_phone varchar(50)NOT NULL,
    FOREIGN KEY(ad_id) REFERENCES admin(ad_id)
);

INSERT INTO admin_phone(ad_id,ad_phone)VALUES
('AD001','0725990770');

DROP TABLE IF EXISTS admin_log;
CREATE TABLE  admin_log(
	ad_id varchar(50) NOT NULL,
    username varchar(50) NOT NULL,
    password varchar(50) NOT NULL,
    FOREIGN KEY(ad_id) REFERENCES admin_log(ad_id)
);

INSERT INTO admin_log(ad_id,username,password)VALUES
('AD001','AD001','admin123');

DROP TABLE IF EXISTS department;
CREATE TABLE IF NOT EXISTS department (
  dep_id varchar(10) NOT NULL,
  dep_name varchar(255) NOT NULL,
  PRIMARY KEY (dep_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO department(dep_id,dep_name)VALUES
('DEPICT','Information Communication Technology'),
('DEPET','Engineering Technology'),
('DEPBST','Biosystem Technology');

DROP TABLE IF EXISTS lecturer;
CREATE TABLE IF NOT EXISTS lecturer (
  lec_id varchar(20) NOT NULL,
  f_name varchar(255) NOT NULL,
  l_name varchar(255) NOT NULL,
  address varchar(255) NOT NULL,
gender varchar(20) NOT NULL,
  dob date NOT NULL,
  email varchar(255) NOT NULL,
  designation varchar(20) NOT NULL,
  dep_id varchar(10) NOT NULL,
  PRIMARY KEY (lec_id),
  FOREIGN KEY(dep_id) REFERENCES department(dep_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO lecturer(lec_id,f_name,l_name,address,gender,dob,email,designation,dep_id)VALUES
("LEC001","Piyumi","Thaksala","No 256,Thangalle road,Matara","Female",'1990-05-02',"piyumiThaksala@gmail.com","Lecturer","DEPICT"),
("LEC002","Tirasha","Senawirathna","No 1, Wellawatha,Colombo","Female",'1989-12-04',"tirasha@gmail.com","Lecturer","DEPBST"),
("LEC003","Dilshan","Bandara","No 123/7, Matara","Male",'1991-02-03',"dilshanbandara@gmail.com","Lecturer","DEPET"),
("LEC004","Ranadiv","Chandrasena","No 401, Thebuwana, Kalutara","Male",'1991-06-03',"ranadiv@gmail.com","Lecturer","DEPICT");

DROP TABLE IF EXISTS lec_phone;
CREATE TABLE lec_phone(
	lec_id varchar(50) NOT NULL,
    lec_phone varchar(50) NOT NULL,
    FOREIGN KEY(lec_id) REFERENCES lecturer(lec_id)
);

INSERT INTO lec_phone(lec_id,lec_phone)VALUES
('LEC001', '0765568940'),
('LEC002', '0710505006'),
('LEC003', '0785645856'),
('LEC004', '0725689741');

DROP TABLE IF EXISTS lec_log;
CREATE TABLE lec_log(
	lec_id varchar(50) NOT NULL,
    username varchar(50) NOT NULL,
    password varchar(50) NOT NULL,
    FOREIGN KEY(lec_id) REFERENCES lecturer(lec_id)
);

INSERT INTO lec_log(lec_id,username,password)VALUES
('LEC001','LEC001','lecturer123'),
('LEC002','LEC002','lecturer456');

DROP TABLES IF EXISTS technicalofficers;
CREATE TABLE IF NOT EXISTS technicalOfficers (
  tecoff_id varchar(20) NOT NULL,
  f_name varchar(255) NOT NULL,
  l_name varchar(255) NOT NULL,
  address varchar(255) NOT NULL,
gender varchar(20) NOT NULL,
  dob date NOT NULL,
  email varchar(255) NOT NULL,
  job_title varchar(20) NOT NULL,
  dep_id varchar(10) NOT NULL,
  PRIMARY KEY (tecoff_id),
  FOREIGN KEY(dep_id) REFERENCES department(dep_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO technicalOfficers(tecoff_id,f_name,l_name,address,gender,dob,email,job_title,dep_id)VALUES
('TECOFF001', 'Chamod Induwara', 'Karunarthna', 'No.52, Galhitiyawa, Munamalgamuwa', 'Male', '1975-05-15', 'chamodIndura@gmail.com','Technicalofficer','DEPICT'),
('TECOFF002', 'Wasantha', 'Adhikari', 'No:25, kelediwulwewa, Eppawala', 'Male', '1979-05-25', 'wasanthaAdhikari@gmail.com','Technicalofficers', 'DEPET'),
('TECOFF003', 'Samudra', 'Ahelepola', 'NO.25/100, main road, Kandy', 'Female', '1965-10-02', 'samudra@gmail.com','Technicalofficers','DEPBST');

DROP TABLE IF EXISTS tecoff_phone;
CREATE TABLE tecoff_phone(
	tecoff_id varchar(50) NOT NULL,
    tecoff_phone varchar(50) NOT NULL,
    FOREIGN KEY(tecoff_id) REFERENCES technicalOfficers(tecoff_id)
);

INSERT INTO tecoff_phone(tecoff_id,tecoff_phone)VALUES
('TECOFF001', '0712356789'),
('TECOFF002', '0754868789'),
('TECOFF003', '0774253159');
	
DROP TABLE IF EXISTS tecoff_log;
CREATE TABLE tecoff_log(
	tecoff_id varchar(50) NOT NULL,
    username varchar(50) NOT NULL,
    password varchar(50) NOT NULL,
    FOREIGN KEY(tecoff_id) REFERENCES technicalOfficers(tecoff_id)
);

INSERT INTO tecoff_log(tecoff_id,username,password)VALUES
('TECOFF001','TECOFF001','tecoff123'),
('TECOFF002','TECOFF002','tecoff456');

DROP TABLE IF EXISTS students;
CREATE TABLE IF NOT EXISTS students (
  st_id varchar(20) NOT NULL,
  f_name varchar(255) NOT NULL,
  l_name varchar(255) NOT NULL,
  address varchar(255) NOT NULL,
gender varchar(20) NOT NULL,
  dob date NOT NULL,
  email varchar(255) NOT NULL,
	dep_id varchar(20) NOT NULL,
  current_level varchar(20) NOT NULL,
  current_sem varchar(10) NOT NULL,
  PRIMARY KEY (st_id),
  FOREIGN KEY(dep_id) REFERENCES department(dep_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO students(st_id,f_name,l_name,address,gender,dob,email,dep_id,current_level,current_sem)VALUES
('TG/2020/001', 'K.M. Sampath', 'Perera', '75,Main road, Galle', 'Male', '2000-08-09', 'sampath@gmail.com','DEPICT', 2, 1),
('TG/2020/002', 'M.M. Asela', 'Gamage', '5B,beach road, Matara', 'Male', '2000-06-05', 'asela@gmail.com', 'DEPICT', 2, 1),
('TG/2020/003', 'A.G, Kelum', 'Bandara', '45,Cristal lane, Gampaha', 'Male', '2000-04-02', 'kelum@gmail.com',  'DEPICT', 2, 1),
('TG/2020/004', 'H.M. Kumara', 'Dilruk', '36,Main road, Colombo', 'Male', '1999-04-04', 'kumaraDilruk@gmail.com',  'DEPICT', 2, 1),
('TG/2020/005', 'Y.M. Sandun', 'Dasanayaka', '12,1st Avenue, Jaffna', 'Male', '1999-07-01', 'sandun@gmail.com',  'DEPICT', 2, 1),
('TG/2020/006', 'A.M. Nethmini', 'Perera', '4B,2nd Avenue, Nuwara Eliya', 'Female', '2000-03-07', 'nethmini@gmail.com',  'DEPICT', 2, 1),
('TG/2020/007', 'G.M. Kamala', 'Disanayaka', '88,Madara road, Kaluthara', 'Female', '2000-01-07', 'kamaladis@gmail.com',  'DEPICT', 2, 1),
('TG/2020/008', 'T.M. Priyadarshan', 'Udugama', '65,Kasal lane, Negombo', 'Female', '2000-04-03', 'priyadharshan@gmail.com',  'DEPICT', 2, 1),
('TG/2020/009', 'H.M. Nadeera', 'Wihanga', '46,5th lane, Kandy', 'Male', '1998-07-02', 'nadeera@gmail.com', 'DEPICT', 2, 1),
('TG/2020/010', 'A.A. Praveen', 'Hewage', '25,8th lane, Kandy', 'Male', '2000-03-07', 'praveen@gmail.com',  'DEPICT', 2, 1);

DROP TABLE IF EXISTS stu_phone;
CREATE TABLE stu_phone(
	stu_id varchar(50) NOT NULL,
    stu_phone varchar(50) NOT NULL,
    FOREIGN KEY(stu_id) REFERENCES students(st_id)
);

INSERT INTO stu_phone(stu_id,stu_phone)VALUES
('TG/2020/001','0754856321'),
('TG/2020/002','0712356845'),
('TG/2020/003','0765684236'),
('TG/2020/004','0751232123'),
('TG/2020/005','0789669369'),
('TG/2020/006','0771595159'),
('TG/2020/007','0751474147'),
('TG/2020/008','0714595875'),
('TG/2020/009','0774587478'),
('TG/2020/010','0762585145');

DROP TABLE IF EXISTS stu_log;
CREATE TABLE stu_log(
	st_id varchar(50) NOT NULL,
    username varchar(50) NOT NULL,
    password varchar(50) NOT NULL,
    FOREIGN KEY(st_id) REFERENCES students(st_id)
);

INSERT INTO stu_log(st_id,username,password)VALUES
('TG/2020/001','TG001','stu123'),
('TG/2020/002','TG002','stu456');

DROP TABLE IF EXISTS stu_pic;
CREATE TABLE stu_pic(
	st_id varchar(50) NOT NULL,
    pic blob,
    FOREIGN KEY(st_id) REFERENCES students(st_id)
    );

DROP TABLE IF EXISTS cou_mod;
CREATE TABLE IF NOT EXISTS cou_mod (
  cou_id varchar(10) NOT NULL,
  cou_name varchar(255) NOT NULL,
  cou_credit tinyint(4) NOT NULL,
  cou_dep_id varchar(10) NOT NULL,
  cou_lec_id varchar(10) NOT NULL,
	current_level int(11) NOT NULL,
    current_sem int(11) NOT NULL,
  cou_type varchar(10) NOT NULL,
 No_of_quiz int(11) NOT NULL,
No_of_ass int(11) NOT NULL,
  PRIMARY KEY (cou_id),
  FOREIGN KEY (cou_dep_id) REFERENCES department(dep_id),
  FOREIGN KEY (cou_lec_id) REFERENCES lecturer(lec_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO cou_mod(cou_id,cou_name,cou_credit,cou_dep_id,cou_lec_id,current_level,current_sem,cou_type,No_of_quiz,No_of_ass)VALUES
('ICT01', 'E-commerce and Implementation', 2, 'DEPICT', 'LEC001', 2, 1, 'T', 3, 0),
('ICT02', 'Oject Oriented Programming', 2, 'DEPICT', 'LEC004', 2, 1, 'T&P', 4, 2),
('ICT03', 'DataStructures', 2, 'DEPICT', 'LEC004', 2, 1, 'T&P', 3, 2),
('ICT04', 'Database Management System', 2, 'DEPICT', 'LEC001', 2, 1, 'T&P', 3, 2);

DROP TABLE IF EXISTS st_cou_mod;
CREATE TABLE IF NOT EXISTS st_cou_mod (
  stmod_id int(11) NOT NULL AUTO_INCREMENT,
  stmod_st_id varchar(20) NOT NULL,
  stmod_cou_id varchar(10) NOT NULL,
  PRIMARY KEY (stmod_id),
  FOREIGN KEY(stmod_st_id) REFERENCES students(st_id),
  FOREIGN KEY(stmod_cou_id) REFERENCES cou_mod(cou_id)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

INSERT INTO st_cou_mod (stmod_id, stmod_st_id,stmod_cou_id) VALUES
(1, 'TG/2020/001', 'ICT01'),
(2, 'TG/2020/001', 'ICT02'),
(3, 'TG/2020/001', 'ICT03'),
(4, 'TG/2020/001', 'ICT04'),

(5, 'TG/2020/002', 'ICT01'),
(6, 'TG/2020/002', 'ICT02'),
(7, 'TG/2020/002', 'ICT03'),
(8, 'TG/2020/002', 'ICT04'),

(9, 'TG/2020/003', 'ICT01'),
(10, 'TG/2020/003', 'ICT02'),
(11, 'TG/2020/003', 'ICT03'),
(12, 'TG/2020/003', 'ICT04'),

(13, 'TG/2020/004', 'ICT01'),
(14, 'TG/2020/004', 'ICT02'),
(15, 'TG/2020/004', 'ICT03'),
(16, 'TG/2020/004', 'ICT04'),

(17, 'TG/2020/005', 'ICT01'),
(18, 'TG/2020/005', 'ICT02'),
(19, 'TG/2020/005', 'ICT03'),
(20, 'TG/2020/005', 'ICT04'),

(21, 'TG/2020/006', 'ICT01'),
(22, 'TG/2020/006', 'ICT02'),
(23, 'TG/2020/006', 'ICT03'),
(24, 'TG/2020/006', 'ICT04'),

(25, 'TG/2020/007', 'ICT01'),
(26, 'TG/2020/007', 'ICT02'),
(27, 'TG/2020/007', 'ICT03'),
(28, 'TG/2020/007', 'ICT04'),

(29, 'TG/2020/008', 'ICT01'),
(30, 'TG/2020/008', 'ICT02'),
(31, 'TG/2020/008', 'ICT03'),
(32, 'TG/2020/008', 'ICT04'),

(33, 'TG/2020/009', 'ICT01'),
(34, 'TG/2020/009', 'ICT02'),
(35, 'TG/2020/009', 'ICT03'),
(36, 'TG/2020/009', 'ICT04'),

(37, 'TG/2020/010', 'ICT01'),
(38, 'TG/2020/010', 'ICT02'),
(39, 'TG/2020/010', 'ICT03'),
(40, 'TG/2020/010', 'ICT04');

DROP TABLE IF EXISTS cou_material;
CREATE TABLE cou_material(
	cou_mat_id varchar(10) primary key not null,
    cou_mat_name varchar(255) not null,
    cou_mat_path varchar(255) not null
    );
    
DROP TABLE IF EXISTS attendance;
CREATE TABLE IF NOT EXISTS attendance (
  at_st_id varchar(20) NOT NULL  ,
  at_date date NOT NULL,
 at_level varchar(4) NOT NULL,
 at_cou_id varchar(10) NOT NULL,
 at_cou_type varchar(4) NOT NULL,
	at_status varchar(10) NOT NULL,
  FOREIGN KEY (at_cou_id) REFERENCES cou_mod(cou_id)
) ENGINE=InnoDB AUTO_INCREMENT=482 DEFAULT CHARSET=utf8;

INSERT INTO attendance(at_st_id,at_date,at_level,at_cou_id,at_cou_type,at_status)VALUES
('TG/2020/001', '2023-01-09',2,'ICT01','T','Present'),
('TG/2020/002', '2023-01-09',2,'ICT01','T','Present'),
('TG/2020/003', '2023-01-09',2,'ICT01','T','Present'),
('TG/2020/004', '2023-01-09',2,'ICT01','T','Present'),
('TG/2020/005', '2023-01-09',2,'ICT01','T','Absent'),
('TG/2020/006', '2023-01-09',2,'ICT01','T','Present'),
('TG/2020/007', '2023-01-09',2,'ICT01','T','Present'),
('TG/2020/008', '2023-01-09',2,'ICT01','T','Present'),
('TG/2020/009', '2023-01-09',2,'ICT01','T','Present'),
('TG/2020/010', '2023-01-09',2,'ICT01','T','Present'),

('TG/2020/001', '2023-01-09',2,'ICT02','T','Present'),
('TG/2020/002', '2023-01-09',2,'ICT02','T','Present'),
('TG/2020/003', '2023-01-09',2,'ICT02','T','Present'),
('TG/2020/004', '2023-01-09',2,'ICT02','T','Present'),
('TG/2020/005', '2023-01-09',2,'ICT02','T','Present'),
('TG/2020/006', '2023-01-09',2,'ICT02','T','Present'),
('TG/2020/007', '2023-01-09',2,'ICT02','T','Present'),
('TG/2020/008', '2023-01-09',2,'ICT02','T','Present'),
('TG/2020/009', '2023-01-09',2,'ICT02','T','Present'),
('TG/2020/010', '2023-01-09',2,'ICT02','T','Present'),

('TG/2020/001', '2023-01-09',2,'ICT03','P','Present'),
('TG/2020/002', '2023-01-09',2,'ICT03','P','Present'),
('TG/2020/003', '2023-01-09',2,'ICT03','P','Present'),
('TG/2020/004', '2023-01-09',2,'ICT03','P','Present'),
('TG/2020/005', '2023-01-09',2,'ICT03','P','Present'),
('TG/2020/006', '2023-01-09',2,'ICT03','P','Present'),
('TG/2020/007', '2023-01-09',2,'ICT03','P','Present'),
('TG/2020/008', '2023-01-09',2,'ICT03','P','Present'),
('TG/2020/009', '2023-01-09',2,'ICT03','P','Present'),
('TG/2020/010', '2023-01-09',2,'ICT03','P','Present'),

('TG/2020/001', '2023-01-09',2,'ICT04','T','Present'),
('TG/2020/002', '2023-01-09',2,'ICT04','T','Present'),
('TG/2020/003', '2023-01-09',2,'ICT04','T','Present'),
('TG/2020/004', '2023-01-09',2,'ICT04','T','Present'),
('TG/2020/005', '2023-01-09',2,'ICT04','T','Present'),
('TG/2020/006', '2023-01-09',2,'ICT04','T','Present'),
('TG/2020/007', '2023-01-09',2,'ICT04','T','Present'),
('TG/2020/008', '2023-01-09',2,'ICT04','T','Present'),
('TG/2020/009', '2023-01-09',2,'ICT04','T','Present'),
('TG/2020/010', '2023-01-09',2,'ICT04','T','Present'),

('TG/2020/001', '2023-01-10',2,'ICT01','T','Present'),
('TG/2020/002', '2023-01-10',2,'ICT01','T','Present'),
('TG/2020/003', '2023-01-10',2,'ICT01','T','Present'),
('TG/2020/004', '2023-01-10',2,'ICT01','T','Present'),
('TG/2020/005', '2023-01-10',2,'ICT01','T','Absent'),
('TG/2020/006', '2023-01-10',2,'ICT01','T','Present'),
('TG/2020/007', '2023-01-10',2,'ICT01','T','Present'),
('TG/2020/008', '2023-01-10',2,'ICT01','T','Present'),
('TG/2020/009', '2023-01-10',2,'ICT01','T','Present'),
('TG/2020/010', '2023-01-10',2,'ICT01','T','Present'),

('TG/2020/001', '2023-01-10',2,'ICT02','P','Present'),
('TG/2020/002', '2023-01-10',2,'ICT02','P','Present'),
('TG/2020/003', '2023-01-10',2,'ICT02','P','Present'),
('TG/2020/004', '2023-01-10',2,'ICT02','P','Present'),
('TG/2020/005', '2023-01-10',2,'ICT02','P','Present'),
('TG/2020/006', '2023-01-10',2,'ICT02','P','Present'),
('TG/2020/007', '2023-01-10',2,'ICT02','P','Present'),
('TG/2020/008', '2023-01-10',2,'ICT02','P','Present'),
('TG/2020/009', '2023-01-10',2,'ICT02','P','Present'),
('TG/2020/010', '2023-01-10',2,'ICT02','P','Present'),

('TG/2020/001', '2023-01-10',2,'ICT03','T','Present'),
('TG/2020/002', '2023-01-10',2,'ICT03','T','Present'),
('TG/2020/003', '2023-01-10',2,'ICT03','T','Present'),
('TG/2020/004', '2023-01-10',2,'ICT03','T','Present'),
('TG/2020/005', '2023-01-10',2,'ICT03','T','Present'),
('TG/2020/006', '2023-01-10',2,'ICT03','T','Present'),
('TG/2020/007', '2023-01-10',2,'ICT03','T','Present'),
('TG/2020/008', '2023-01-10',2,'ICT03','T','Present'),
('TG/2020/009', '2023-01-10',2,'ICT03','T','Present'),
('TG/2020/010', '2023-01-10',2,'ICT03','T','Present'),

('TG/2020/001', '2023-01-10',2,'ICT04','P','Present'),
('TG/2020/002', '2023-01-10',2,'ICT04','P','Present'),
('TG/2020/003', '2023-01-10',2,'ICT04','P','Present'),
('TG/2020/004', '2023-01-10',2,'ICT04','P','Present'),
('TG/2020/005', '2023-01-10',2,'ICT04','P','Present'),
('TG/2020/006', '2023-01-10',2,'ICT04','P','Present'),
('TG/2020/007', '2023-01-10',2,'ICT04','P','Present'),
('TG/2020/008', '2023-01-10',2,'ICT04','P','Present'),
('TG/2020/009', '2023-01-10',2,'ICT04','P','Present'),
('TG/2020/010', '2023-01-10',2,'ICT04','P','Present'),

('TG/2020/001', '2023-01-11',2,'ICT01','T','Present'),
('TG/2020/002', '2023-01-11',2,'ICT01','T','Present'),
('TG/2020/003', '2023-01-11',2,'ICT01','T','Present'),
('TG/2020/004', '2023-01-11',2,'ICT01','T','Present'),
('TG/2020/005', '2023-01-11',2,'ICT01','T','Absent'),
('TG/2020/006', '2023-01-11',2,'ICT01','T','Present'),
('TG/2020/007', '2023-01-11',2,'ICT01','T','Present'),
('TG/2020/008', '2023-01-11',2,'ICT01','T','Present'),
('TG/2020/009', '2023-01-11',2,'ICT01','T','Present'),
('TG/2020/010', '2023-01-11',2,'ICT01','T','Present'),

('TG/2020/001', '2023-01-11',2,'ICT02','T','Present'),
('TG/2020/002', '2023-01-11',2,'ICT02','T','Present'),
('TG/2020/003', '2023-01-11',2,'ICT02','T','Present'),
('TG/2020/004', '2023-01-11',2,'ICT02','T','Present'),
('TG/2020/005', '2023-01-11',2,'ICT02','T','Present'),
('TG/2020/006', '2023-01-11',2,'ICT02','T','Present'),
('TG/2020/007', '2023-01-11',2,'ICT02','T','Present'),
('TG/2020/008', '2023-01-11',2,'ICT02','T','Present'),
('TG/2020/009', '2023-01-11',2,'ICT02','T','Present'),
('TG/2020/010', '2023-01-11',2,'ICT02','T','Present'),

('TG/2020/001', '2023-01-11',2,'ICT03','P','Present'),
('TG/2020/002', '2023-01-11',2,'ICT03','P','Present'),
('TG/2020/003', '2023-01-11',2,'ICT03','P','Present'),
('TG/2020/004', '2023-01-11',2,'ICT03','P','Present'),
('TG/2020/005', '2023-01-11',2,'ICT03','P','Present'),
('TG/2020/006', '2023-01-11',2,'ICT03','P','Present'),
('TG/2020/007', '2023-01-11',2,'ICT03','P','Present'),
('TG/2020/008', '2023-01-11',2,'ICT03','P','Present'),
('TG/2020/009', '2023-01-11',2,'ICT03','P','Present'),
('TG/2020/010', '2023-01-11',2,'ICT03','P','Present'),

('TG/2020/001', '2023-01-11',2,'ICT04','T','Present'),
('TG/2020/002', '2023-01-11',2,'ICT04','T','Present'),
('TG/2020/003', '2023-01-11',2,'ICT04','T','Present'),
('TG/2020/004', '2023-01-11',2,'ICT04','T','Present'),
('TG/2020/005', '2023-01-11',2,'ICT04','T','Present'),
('TG/2020/006', '2023-01-11',2,'ICT04','T','Present'),
('TG/2020/007', '2023-01-11',2,'ICT04','T','Present'),
('TG/2020/008', '2023-01-11',2,'ICT04','T','Present'),
('TG/2020/009', '2023-01-11',2,'ICT04','T','Present'),
('TG/2020/010', '2023-01-11',2,'ICT04','T','Present'),

('TG/2020/001', '2023-01-12',2,'ICT01','T','Present'),
('TG/2020/002', '2023-01-12',2,'ICT01','T','Present'),
('TG/2020/003', '2023-01-12',2,'ICT01','T','Present'),
('TG/2020/004', '2023-01-12',2,'ICT01','T','Present'),
('TG/2020/005', '2023-01-12',2,'ICT01','T','Absent'),
('TG/2020/006', '2023-01-12',2,'ICT01','T','Present'),
('TG/2020/007', '2023-01-12',2,'ICT01','T','Present'),
('TG/2020/008', '2023-01-12',2,'ICT01','T','Present'),
('TG/2020/009', '2023-01-12',2,'ICT01','T','Present'),
('TG/2020/010', '2023-01-12',2,'ICT01','T','Present'),

('TG/2020/001', '2023-01-12',2,'ICT02','P','Present'),
('TG/2020/002', '2023-01-12',2,'ICT02','P','Present'),
('TG/2020/003', '2023-01-12',2,'ICT02','P','Present'),
('TG/2020/004', '2023-01-12',2,'ICT02','P','Present'),
('TG/2020/005', '2023-01-12',2,'ICT02','P','Present'),
('TG/2020/006', '2023-01-12',2,'ICT02','P','Present'),
('TG/2020/007', '2023-01-12',2,'ICT02','P','Present'),
('TG/2020/008', '2023-01-12',2,'ICT02','P','Present'),
('TG/2020/009', '2023-01-12',2,'ICT02','P','Present'),
('TG/2020/010', '2023-01-12',2,'ICT02','P','Present'),

('TG/2020/001', '2023-01-12',2,'ICT03','T','Present'),
('TG/2020/002', '2023-01-12',2,'ICT03','T','Present'),
('TG/2020/003', '2023-01-12',2,'ICT03','T','Present'),
('TG/2020/004', '2023-01-12',2,'ICT03','T','Present'),
('TG/2020/005', '2023-01-12',2,'ICT03','T','Present'),
('TG/2020/006', '2023-01-12',2,'ICT03','T','Present'),
('TG/2020/007', '2023-01-12',2,'ICT03','T','Present'),
('TG/2020/008', '2023-01-12',2,'ICT03','T','Present'),
('TG/2020/009', '2023-01-12',2,'ICT03','T','Present'),
('TG/2020/010', '2023-01-12',2,'ICT03','T','Present'),

('TG/2020/001', '2023-01-12',2,'ICT04','P','Present'),
('TG/2020/002', '2023-01-12',2,'ICT04','P','Present'),
('TG/2020/003', '2023-01-12',2,'ICT04','P','Present'),
('TG/2020/004', '2023-01-12',2,'ICT04','P','Present'),
('TG/2020/005', '2023-01-12',2,'ICT04','P','Present'),
('TG/2020/006', '2023-01-12',2,'ICT04','P','Present'),
('TG/2020/007', '2023-01-12',2,'ICT04','P','Present'),
('TG/2020/008', '2023-01-12',2,'ICT04','P','Present'),
('TG/2020/009', '2023-01-12',2,'ICT04','P','Present'),
('TG/2020/010', '2023-01-12',2,'ICT04','P','Present'),

('TG/2020/001', '2023-01-13',2,'ICT01','T','Present'),
('TG/2020/002', '2023-01-13',2,'ICT01','T','Present'),
('TG/2020/003', '2023-01-13',2,'ICT01','T','Present'),
('TG/2020/004', '2023-01-13',2,'ICT01','T','Present'),
('TG/2020/005', '2023-01-13',2,'ICT01','T','Present'),
('TG/2020/006', '2023-01-13',2,'ICT01','T','Present'),
('TG/2020/007', '2023-01-13',2,'ICT01','T','Present'),
('TG/2020/008', '2023-01-13',2,'ICT01','T','Present'),
('TG/2020/009', '2023-01-13',2,'ICT01','T','Present'),
('TG/2020/010', '2023-01-13',2,'ICT01','T','Present'),

('TG/2020/001', '2023-01-13',2,'ICT02','P','Present'),
('TG/2020/002', '2023-01-13',2,'ICT02','P','Present'),
('TG/2020/003', '2023-01-13',2,'ICT02','P','Present'),
('TG/2020/004', '2023-01-13',2,'ICT02','P','Present'),
('TG/2020/005', '2023-01-13',2,'ICT02','P','Present'),
('TG/2020/006', '2023-01-13',2,'ICT02','P','Present'),
('TG/2020/007', '2023-01-13',2,'ICT02','P','Present'),
('TG/2020/008', '2023-01-13',2,'ICT02','P','Present'),
('TG/2020/009', '2023-01-13',2,'ICT02','P','Present'),
('TG/2020/010', '2023-01-13',2,'ICT02','P','Present'),

('TG/2020/001', '2023-01-13',2,'ICT03','P','Present'),
('TG/2020/002', '2023-01-13',2,'ICT03','P','Present'),
('TG/2020/003', '2023-01-13',2,'ICT03','P','Present'),
('TG/2020/004', '2023-01-13',2,'ICT03','P','Present'),
('TG/2020/005', '2023-01-13',2,'ICT03','P','Present'),
('TG/2020/006', '2023-01-13',2,'ICT03','P','Present'),
('TG/2020/007', '2023-01-13',2,'ICT03','P','Present'),
('TG/2020/008', '2023-01-13',2,'ICT03','P','Present'),
('TG/2020/009', '2023-01-13',2,'ICT03','P','Present'),
('TG/2020/010', '2023-01-13',2,'ICT03','P','Present'),

('TG/2020/001', '2023-01-13',2,'ICT04','P','Present'),
('TG/2020/002', '2023-01-13',2,'ICT04','P','Present'),
('TG/2020/003', '2023-01-13',2,'ICT04','P','Present'),
('TG/2020/004', '2023-01-13',2,'ICT04','P','Present'),
('TG/2020/005', '2023-01-13',2,'ICT04','P','Present'),
('TG/2020/006', '2023-01-13',2,'ICT04','P','Present'),
('TG/2020/007', '2023-01-13',2,'ICT04','P','Present'),
('TG/2020/008', '2023-01-13',2,'ICT04','P','Present'),
('TG/2020/009', '2023-01-13',2,'ICT04','P','Present'),
('TG/2020/010', '2023-01-13',2,'ICT04','P','Present'),

('TG2020/001', '2023-01-16',2,'ICT01','T','Present'),
('TG2020/002', '2023-01-16',2,'ICT01','T','Present'),
('TG2020/003', '2023-01-16',2,'ICT01','T','Present'),
('TG2020/004', '2023-01-16',2,'ICT01','T','Present'),
('TG2020/005', '2023-01-16',2,'ICT01','T','Present'),
('TG2020/006', '2023-01-16',2,'ICT01','T','Present'),
('TG2020/007', '2023-01-16',2,'ICT01','T','Present'),
('TG2020/008', '2023-01-16',2,'ICT01','T','Present'),
('TG2020/009', '2023-01-16',2,'ICT01','T','Present'),
('TG2020/010', '2023-01-16',2,'ICT01','T','Present'),

('TG2020/001', '2023-01-16',2,'ICT02','T','Present'),
('TG2020/002', '2023-01-16',2,'ICT02','T','Present'),
('TG2020/003', '2023-01-16',2,'ICT02','T','Present'),
('TG2020/004', '2023-01-16',2,'ICT02','T','Present'),
('TG2020/005', '2023-01-16',2,'ICT02','T','Present'),
('TG2020/006', '2023-01-16',2,'ICT02','T','Present'),
('TG2020/007', '2023-01-16',2,'ICT02','T','Present'),
('TG2020/008', '2023-01-16',2,'ICT02','T','Present'),
('TG2020/009', '2023-01-16',2,'ICT02','T','Present'),
('TG2020/010', '2023-01-16',2,'ICT02','T','Present'),

('TG2020/001', '2023-01-16',2,'ICT03','P','Present'),
('TG2020/002', '2023-01-16',2,'ICT03','P','Present'),
('TG2020/003', '2023-01-16',2,'ICT03','P','Present'),
('TG2020/004', '2023-01-16',2,'ICT03','P','Present'),
('TG2020/005', '2023-01-16',2,'ICT03','P','Present'),
('TG2020/006', '2023-01-16',2,'ICT03','P','Present'),
('TG2020/007', '2023-01-16',2,'ICT03','P','Present'),
('TG2020/008', '2023-01-16',2,'ICT03','P','Present'),
('TG2020/009', '2023-01-16',2,'ICT03','P','Present'),
('TG2020/010', '2023-01-16',2,'ICT03','P','Present'),

('TG2020/001', '2023-01-16',2,'ICT04','T','Present'),
('TG2020/002', '2023-01-16',2,'ICT04','T','Present'),
('TG2020/003', '2023-01-16',2,'ICT04','T','Present'),
('TG2020/004', '2023-01-16',2,'ICT04','T','Present'),
('TG2020/005', '2023-01-16',2,'ICT04','T','Present'),
('TG2020/006', '2023-01-16',2,'ICT04','T','Present'),
('TG2020/007', '2023-01-16',2,'ICT04','T','Present'),
('TG2020/008', '2023-01-16',2,'ICT04','T','Present'),
('TG2020/009', '2023-01-16',2,'ICT04','T','Present'),
('TG2020/010', '2023-01-16',2,'ICT04','T','Present'),

('TG2020/001', '2023-01-17',2,'ICT01','T','Present'),
('TG2020/002', '2023-01-17',2,'ICT01','T','Present'),
('TG2020/003', '2023-01-17',2,'ICT01','T','Present'),
('TG2020/004', '2023-01-17',2,'ICT01','T','Present'),
('TG2020/005', '2023-01-17',2,'ICT01','T','Present'),
('TG2020/006', '2023-01-17',2,'ICT01','T','Present'),
('TG2020/007', '2023-01-17',2,'ICT01','T','Present'),
('TG2020/008', '2023-01-17',2,'ICT01','T','Present'),
('TG2020/009', '2023-01-17',2,'ICT01','T','Present'),
('TG2020/010', '2023-01-17',2,'ICT01','T','Present'),

('TG2020/001', '2023-01-17',2,'ICT02','P','Present'),
('TG2020/002', '2023-01-17',2,'ICT02','P','Present'),
('TG2020/003', '2023-01-17',2,'ICT02','P','Present'),
('TG2020/004', '2023-01-17',2,'ICT02','P','Present'),
('TG2020/005', '2023-01-17',2,'ICT02','P','Present'),
('TG2020/006', '2023-01-17',2,'ICT02','P','Present'),
('TG2020/007', '2023-01-17',2,'ICT02','P','Present'),
('TG2020/008', '2023-01-17',2,'ICT02','P','Absent'),
('TG2020/009', '2023-01-17',2,'ICT02','P','Present'),
('TG2020/010', '2023-01-17',2,'ICT02','P','Present'),

('TG2020/001', '2023-01-17',2,'ICT03','T','Present'),
('TG2020/002', '2023-01-17',2,'ICT03','T','Present'),
('TG2020/003', '2023-01-17',2,'ICT03','T','Present'),
('TG2020/004', '2023-01-17',2,'ICT03','T','Present'),
('TG2020/005', '2023-01-17',2,'ICT03','T','Present'),
('TG2020/006', '2023-01-17',2,'ICT03','T','Present'),
('TG2020/007', '2023-01-17',2,'ICT03','T','Present'),
('TG2020/008', '2023-01-17',2,'ICT03','T','Present'),
('TG2020/009', '2023-01-17',2,'ICT03','T','Present'),
('TG2020/010', '2023-01-17',2,'ICT03','T','Present'),

('TG2020/001', '2023-01-17',2,'ICT04','P','Present'),
('TG2020/002', '2023-01-17',2,'ICT04','P','Present'),
('TG2020/003', '2023-01-17',2,'ICT04','P','Present'),
('TG2020/004', '2023-01-17',2,'ICT04','P','Present'),
('TG2020/005', '2023-01-17',2,'ICT04','P','Present'),
('TG2020/006', '2023-01-17',2,'ICT04','P','Present'),
('TG2020/007', '2023-01-17',2,'ICT04','P','Present'),
('TG2020/008', '2023-01-17',2,'ICT04','P','Present'),
('TG2020/009', '2023-01-17',2,'ICT04','P','Present'),
('TG2020/010', '2023-01-17',2,'ICT04','P','Present'),

('TG2020/001', '2023-01-18',2,'ICT01','T','Present'),
('TG2020/002', '2023-01-18',2,'ICT01','T','Present'),
('TG2020/003', '2023-01-18',2,'ICT01','T','Present'),
('TG2020/004', '2023-01-18',2,'ICT01','T','Present'),
('TG2020/005', '2023-01-18',2,'ICT01','T','Present'),
('TG2020/006', '2023-01-18',2,'ICT01','T','Present'),
('TG2020/007', '2023-01-18',2,'ICT01','T','Present'),
('TG2020/008', '2023-01-18',2,'ICT01','T','Present'),
('TG2020/009', '2023-01-18',2,'ICT01','T','Present'),
('TG2020/010', '2023-01-18',2,'ICT01','T','Present'),

('TG2020/001', '2023-01-18',2,'ICT02','T','Present'),
('TG2020/002', '2023-01-18',2,'ICT02','T','Present'),
('TG2020/003', '2023-01-18',2,'ICT02','T','Present'),
('TG2020/004', '2023-01-18',2,'ICT02','T','Present'),
('TG2020/005', '2023-01-18',2,'ICT02','T','Present'),
('TG2020/006', '2023-01-18',2,'ICT02','T','Present'),
('TG2020/007', '2023-01-18',2,'ICT02','T','Present'),
('TG2020/008', '2023-01-18',2,'ICT02','T','Absent'),
('TG2020/009', '2023-01-18',2,'ICT02','T','Present'),
('TG2020/010', '2023-01-18',2,'ICT02','T','Present'),

('TG2020/001', '2023-01-18',2,'ICT03','P','Present'),
('TG2020/002', '2023-01-18',2,'ICT03','P','Present'),
('TG2020/003', '2023-01-18',2,'ICT03','P','Present'),
('TG2020/004', '2023-01-18',2,'ICT03','P','Present'),
('TG2020/005', '2023-01-18',2,'ICT03','P','Present'),
('TG2020/006', '2023-01-18',2,'ICT03','P','Present'),
('TG2020/007', '2023-01-18',2,'ICT03','P','Present'),
('TG2020/008', '2023-01-18',2,'ICT03','P','Present'),
('TG2020/009', '2023-01-18',2,'ICT03','P','Present'),
('TG2020/010', '2023-01-18',2,'ICT03','P','Present'),

('TG2020/001', '2023-01-18',2,'ICT04','T','Present'),
('TG2020/002', '2023-01-18',2,'ICT04','T','Present'),
('TG2020/003', '2023-01-18',2,'ICT04','T','Present'),
('TG2020/004', '2023-01-18',2,'ICT04','T','Present'),
('TG2020/005', '2023-01-18',2,'ICT04','T','Present'),
('TG2020/006', '2023-01-18',2,'ICT04','T','Present'),
('TG2020/007', '2023-01-18',2,'ICT04','T','Present'),
('TG2020/008', '2023-01-18',2,'ICT04','T','Present'),
('TG2020/009', '2023-01-18',2,'ICT04','T','Present'),
('TG2020/010', '2023-01-18',2,'ICT04','T','Present'),

('TG2020/001', '2023-01-19',2,'ICT01','T','Present'),
('TG2020/002', '2023-01-19',2,'ICT01','T','Present'),
('TG2020/003', '2023-01-19',2,'ICT01','T','Present'),
('TG2020/004', '2023-01-19',2,'ICT01','T','Present'),
('TG2020/005', '2023-01-19',2,'ICT01','T','Present'),
('TG2020/006', '2023-01-19',2,'ICT01','T','Present'),
('TG2020/007', '2023-01-19',2,'ICT01','T','Present'),
('TG2020/008', '2023-01-19',2,'ICT01','T','Present'),
('TG2020/009', '2023-01-19',2,'ICT01','T','Present'),
('TG2020/010', '2023-01-19',2,'ICT01','T','Present'),

('TG2020/001', '2023-01-19',2,'ICT02','P','Present'),
('TG2020/002', '2023-01-19',2,'ICT02','P','Present'),
('TG2020/003', '2023-01-19',2,'ICT02','P','Present'),
('TG2020/004', '2023-01-19',2,'ICT02','P','Present'),
('TG2020/005', '2023-01-19',2,'ICT02','P','Present'),
('TG2020/006', '2023-01-19',2,'ICT02','P','Present'),
('TG2020/007', '2023-01-19',2,'ICT02','P','Present'),
('TG2020/008', '2023-01-19',2,'ICT02','P','Absent'),
('TG2020/009', '2023-01-19',2,'ICT02','P','Present'),
('TG2020/010', '2023-01-19',2,'ICT02','P','Present'),

('TG2020/001', '2023-01-19',2,'ICT03','T','Present'),
('TG2020/002', '2023-01-19',2,'ICT03','T','Present'),
('TG2020/003', '2023-01-19',2,'ICT03','T','Present'),
('TG2020/004', '2023-01-19',2,'ICT03','T','Present'),
('TG2020/005', '2023-01-19',2,'ICT03','T','Present'),
('TG2020/006', '2023-01-19',2,'ICT03','T','Present'),
('TG2020/007', '2023-01-19',2,'ICT03','T','Present'),
('TG2020/008', '2023-01-19',2,'ICT03','T','Present'),
('TG2020/009', '2023-01-19',2,'ICT03','T','Present'),
('TG2020/010', '2023-01-19',2,'ICT03','T','Present'),

('TG2020/001', '2023-01-19',2,'ICT04','P','Present'),
('TG2020/002', '2023-01-19',2,'ICT04','P','Present'),
('TG2020/003', '2023-01-19',2,'ICT04','P','Present'),
('TG2020/004', '2023-01-19',2,'ICT04','P','Present'),
('TG2020/005', '2023-01-19',2,'ICT04','P','Present'),
('TG2020/006', '2023-01-19',2,'ICT04','P','Present'),
('TG2020/007', '2023-01-19',2,'ICT04','P','Present'),
('TG2020/008', '2023-01-19',2,'ICT04','P','Present'),
('TG2020/009', '2023-01-19',2,'ICT04','P','Present'),
('TG2020/010', '2023-01-19',2,'ICT04','P','Present'),

('TG2020/001', '2023-01-20',2,'ICT01','T','Present'),
('TG2020/002', '2023-01-20',2,'ICT01','T','Present'),
('TG2020/003', '2023-01-20',2,'ICT01','T','Present'),
('TG2020/004', '2023-01-20',2,'ICT01','T','Present'),
('TG2020/005', '2023-01-20',2,'ICT01','T','Present'),
('TG2020/006', '2023-01-20',2,'ICT01','T','Present'),
('TG2020/007', '2023-01-20',2,'ICT01','T','Present'),
('TG2020/008', '2023-01-20',2,'ICT01','T','Present'),
('TG2020/009', '2023-01-20',2,'ICT01','T','Present'),
('TG2020/010', '2023-01-20',2,'ICT01','T','Present'),

('TG2020/001', '2023-01-20',2,'ICT02','P','Present'),
('TG2020/002', '2023-01-20',2,'ICT02','P','Present'),
('TG2020/003', '2023-01-20',2,'ICT02','P','Present'),
('TG2020/004', '2023-01-20',2,'ICT02','P','Present'),
('TG2020/005', '2023-01-20',2,'ICT02','P','Present'),
('TG2020/006', '2023-01-20',2,'ICT02','P','Present'),
('TG2020/007', '2023-01-20',2,'ICT02','P','Present'),
('TG2020/008', '2023-01-20',2,'ICT02','P','Absent'),
('TG2020/009', '2023-01-20',2,'ICT02','P','Present'),
('TG2020/010', '2023-01-20',2,'ICT02','P','Present'),

('TG2020/001', '2023-01-20',2,'ICT03','P','Present'),
('TG2020/002', '2023-01-20',2,'ICT03','P','Present'),
('TG2020/003', '2023-01-20',2,'ICT03','P','Present'),
('TG2020/004', '2023-01-20',2,'ICT03','P','Present'),
('TG2020/005', '2023-01-20',2,'ICT03','P','Present'),
('TG2020/006', '2023-01-20',2,'ICT03','P','Present'),
('TG2020/007', '2023-01-20',2,'ICT03','P','Present'),
('TG2020/008', '2023-01-20',2,'ICT03','P','Present'),
('TG2020/009', '2023-01-20',2,'ICT03','P','Present'),
('TG2020/010', '2023-01-20',2,'ICT03','P','Present'),

('TG2020/001', '2023-01-20',2,'ICT04','P','Present'),
('TG2020/002', '2023-01-20',2,'ICT04','P','Present'),
('TG2020/003', '2023-01-20',2,'ICT04','P','Present'),
('TG2020/004', '2023-01-20',2,'ICT04','P','Present'),
('TG2020/005', '2023-01-20',2,'ICT04','P','Present'),
('TG2020/006', '2023-01-20',2,'ICT04','P','Present'),
('TG2020/007', '2023-01-20',2,'ICT04','P','Present'),
('TG2020/008', '2023-01-20',2,'ICT04','P','Present'),
('TG2020/009', '2023-01-20',2,'ICT04','P','Present'),
('TG2020/010', '2023-01-20',2,'ICT04','P','Present'),

('TG2020/001', '2023-01-23',2,'ICT01','T','Present'),
('TG2020/002', '2023-01-23',2,'ICT01','T','Present'),
('TG2020/003', '2023-01-23',2,'ICT01','T','Present'),
('TG2020/004', '2023-01-23',2,'ICT01','T','Present'),
('TG2020/005', '2023-01-23',2,'ICT01','T','Present'),
('TG2020/006', '2023-01-23',2,'ICT01','T','Present'),
('TG2020/007', '2023-01-23',2,'ICT01','T','Present'),
('TG2020/008', '2023-01-23',2,'ICT01','T','Present'),
('TG2020/009', '2023-01-23',2,'ICT01','T','Present'),
('TG2020/010', '2023-01-23',2,'ICT01','T','Present'),

('TG2020/001', '2023-01-23',2,'ICT02','T','Present'),
('TG2020/002', '2023-01-23',2,'ICT02','T','Present'),
('TG2020/003', '2023-01-23',2,'ICT02','T','Present'),
('TG2020/004', '2023-01-23',2,'ICT02','T','Present'),
('TG2020/005', '2023-01-23',2,'ICT02','T','Present'),
('TG2020/006', '2023-01-23',2,'ICT02','T','Present'),
('TG2020/007', '2023-01-23',2,'ICT02','T','Present'),
('TG2020/008', '2023-01-23',2,'ICT02','T','Present'),
('TG2020/009', '2023-01-23',2,'ICT02','T','Present'),
('TG2020/010', '2023-01-23',2,'ICT02','T','Present'),

('TG2020/001', '2023-01-23',2,'ICT03','P','Present'),
('TG2020/002', '2023-01-23',2,'ICT03','P','Present'),
('TG2020/003', '2023-01-23',2,'ICT03','P','Present'),
('TG2020/004', '2023-01-23',2,'ICT03','P','Present'),
('TG2020/005', '2023-01-23',2,'ICT03','P','Present'),
('TG2020/006', '2023-01-23',2,'ICT03','P','Present'),
('TG2020/007', '2023-01-23',2,'ICT03','P','Present'),
('TG2020/008', '2023-01-23',2,'ICT03','P','Present'),
('TG2020/009', '2023-01-23',2,'ICT03','P','Present'),
('TG2020/010', '2023-01-23',2,'ICT03','P','Present'),

('TG2020/001', '2023-01-23',2,'ICT04','T','Present'),
('TG2020/002', '2023-01-23',2,'ICT04','T','Present'),
('TG2020/003', '2023-01-23',2,'ICT04','T','Present'),
('TG2020/004', '2023-01-23',2,'ICT04','T','Present'),
('TG2020/005', '2023-01-23',2,'ICT04','T','Present'),
('TG2020/006', '2023-01-23',2,'ICT04','T','Present'),
('TG2020/007', '2023-01-23',2,'ICT04','T','Present'),
('TG2020/008', '2023-01-23',2,'ICT04','T','Present'),
('TG2020/009', '2023-01-23',2,'ICT04','T','Present'),
('TG2020/010', '2023-01-23',2,'ICT04','T','Present'),

('TG2020/001', '2023-01-24',2,'ICT01','T','Present'),
('TG2020/002', '2023-01-24',2,'ICT01','T','Present'),
('TG2020/003', '2023-01-24',2,'ICT01','T','Present'),
('TG2020/004', '2023-01-24',2,'ICT01','T','Present'),
('TG2020/005', '2023-01-24',2,'ICT01','T','Present'),
('TG2020/006', '2023-01-24',2,'ICT01','T','Present'),
('TG2020/007', '2023-01-24',2,'ICT01','T','Present'),
('TG2020/008', '2023-01-24',2,'ICT01','T','Present'),
('TG2020/009', '2023-01-24',2,'ICT01','T','Present'),
('TG2020/010', '2023-01-24',2,'ICT01','T','Present'),

('TG2020/001', '2023-01-24',2,'ICT02','P','Present'),
('TG2020/002', '2023-01-24',2,'ICT02','P','Present'),
('TG2020/003', '2023-01-24',2,'ICT02','P','Present'),
('TG2020/004', '2023-01-24',2,'ICT02','P','Present'),
('TG2020/005', '2023-01-24',2,'ICT02','P','Present'),
('TG2020/006', '2023-01-24',2,'ICT02','P','Present'),
('TG2020/007', '2023-01-24',2,'ICT02','P','Present'),
('TG2020/008', '2023-01-24',2,'ICT02','P','Present'),
('TG2020/009', '2023-01-24',2,'ICT02','P','Present'),
('TG2020/010', '2023-01-24',2,'ICT02','P','Present'),

('TG2020/001', '2023-01-24',2,'ICT03','T','Present'),
('TG2020/002', '2023-01-24',2,'ICT03','T','Present'),
('TG2020/003', '2023-01-24',2,'ICT03','T','Present'),
('TG2020/004', '2023-01-24',2,'ICT03','T','Present'),
('TG2020/005', '2023-01-24',2,'ICT03','T','Present'),
('TG2020/006', '2023-01-24',2,'ICT03','T','Present'),
('TG2020/007', '2023-01-24',2,'ICT03','T','Present'),
('TG2020/008', '2023-01-24',2,'ICT03','T','Present'),
('TG2020/009', '2023-01-24',2,'ICT03','T','Present'),
('TG2020/010', '2023-01-24',2,'ICT03','T','Present'),

('TG2020/001', '2023-01-24',2,'ICT04','P','Present'),
('TG2020/002', '2023-01-24',2,'ICT04','P','Present'),
('TG2020/003', '2023-01-24',2,'ICT04','P','Present'),
('TG2020/004', '2023-01-24',2,'ICT04','P','Present'),
('TG2020/005', '2023-01-24',2,'ICT04','P','Present'),
('TG2020/006', '2023-01-24',2,'ICT04','P','Present'),
('TG2020/007', '2023-01-24',2,'ICT04','P','Present'),
('TG2020/008', '2023-01-24',2,'ICT04','P','Present'),
('TG2020/009', '2023-01-24',2,'ICT04','P','Present'),
('TG2020/010', '2023-01-24',2,'ICT04','P','Present'),

('TG2020/001', '2023-01-25',2,'ICT01','T','Present'),
('TG2020/002', '2023-01-25',2,'ICT01','T','Present'),
('TG2020/003', '2023-01-25',2,'ICT01','T','Present'),
('TG2020/004', '2023-01-25',2,'ICT01','T','Present'),
('TG2020/005', '2023-01-25',2,'ICT01','T','Present'),
('TG2020/006', '2023-01-25',2,'ICT01','T','Present'),
('TG2020/007', '2023-01-25',2,'ICT01','T','Present'),
('TG2020/008', '2023-01-25',2,'ICT01','T','Present'),
('TG2020/009', '2023-01-25',2,'ICT01','T','Present'),
('TG2020/010', '2023-01-25',2,'ICT01','T','Present'),

('TG2020/001', '2023-01-25',2,'ICT02','T','Present'),
('TG2020/002', '2023-01-25',2,'ICT02','T','Present'),
('TG2020/003', '2023-01-25',2,'ICT02','T','Present'),
('TG2020/004', '2023-01-25',2,'ICT02','T','Present'),
('TG2020/005', '2023-01-25',2,'ICT02','T','Present'),
('TG2020/006', '2023-01-25',2,'ICT02','T','Present'),
('TG2020/007', '2023-01-25',2,'ICT02','T','Present'),
('TG2020/008', '2023-01-25',2,'ICT02','T','Present'),
('TG2020/009', '2023-01-25',2,'ICT02','T','Present'),
('TG2020/010', '2023-01-25',2,'ICT02','T','Present'),

('TG2020/001', '2023-01-25',2,'ICT03','P','Present'),
('TG2020/002', '2023-01-25',2,'ICT03','P','Present'),
('TG2020/003', '2023-01-25',2,'ICT03','P','Present'),
('TG2020/004', '2023-01-25',2,'ICT03','P','Present'),
('TG2020/005', '2023-01-25',2,'ICT03','P','Present'),
('TG2020/006', '2023-01-25',2,'ICT03','P','Present'),
('TG2020/007', '2023-01-25',2,'ICT03','P','Present'),
('TG2020/008', '2023-01-25',2,'ICT03','P','Present'),
('TG2020/009', '2023-01-25',2,'ICT03','P','Present'),
('TG2020/010', '2023-01-25',2,'ICT03','P','Present'),

('TG2020/001', '2023-01-25',2,'ICT04','T','Present'),
('TG2020/002', '2023-01-25',2,'ICT04','T','Present'),
('TG2020/003', '2023-01-25',2,'ICT04','T','Present'),
('TG2020/004', '2023-01-25',2,'ICT04','T','Present'),
('TG2020/005', '2023-01-25',2,'ICT04','T','Present'),
('TG2020/006', '2023-01-25',2,'ICT04','T','Present'),
('TG2020/007', '2023-01-25',2,'ICT04','T','Present'),
('TG2020/008', '2023-01-25',2,'ICT04','T','Present'),
('TG2020/009', '2023-01-25',2,'ICT04','T','Present'),
('TG2020/010', '2023-01-25',2,'ICT04','T','Present'),

('TG2020/001', '2023-01-26',2,'ICT01','T','Present'),
('TG2020/002', '2023-01-26',2,'ICT01','T','Present'),
('TG2020/003', '2023-01-26',2,'ICT01','T','Present'),
('TG2020/004', '2023-01-26',2,'ICT01','T','Present'),
('TG2020/005', '2023-01-26',2,'ICT01','T','Present'),
('TG2020/006', '2023-01-26',2,'ICT01','T','Present'),
('TG2020/007', '2023-01-26',2,'ICT01','T','Present'),
('TG2020/008', '2023-01-26',2,'ICT01','T','Present'),
('TG2020/009', '2023-01-26',2,'ICT01','T','Present'),
('TG2020/010', '2023-01-26',2,'ICT01','T','Present'),

('TG2020/001', '2023-01-26',2,'ICT02','P','Present'),
('TG2020/002', '2023-01-26',2,'ICT02','P','Present'),
('TG2020/003', '2023-01-26',2,'ICT02','P','Present'),
('TG2020/004', '2023-01-26',2,'ICT02','P','Present'),
('TG2020/005', '2023-01-26',2,'ICT02','P','Present'),
('TG2020/006', '2023-01-26',2,'ICT02','P','Present'),
('TG2020/007', '2023-01-26',2,'ICT02','P','Present'),
('TG2020/008', '2023-01-26',2,'ICT02','P','Present'),
('TG2020/009', '2023-01-26',2,'ICT02','P','Present'),
('TG2020/010', '2023-01-26',2,'ICT02','P','Present'),

('TG2020/001', '2023-01-26',2,'ICT03','T','Present'),
('TG2020/002', '2023-01-26',2,'ICT03','T','Present'),
('TG2020/003', '2023-01-26',2,'ICT03','T','Present'),
('TG2020/004', '2023-01-26',2,'ICT03','T','Present'),
('TG2020/005', '2023-01-26',2,'ICT03','T','Present'),
('TG2020/006', '2023-01-26',2,'ICT03','T','Present'),
('TG2020/007', '2023-01-26',2,'ICT03','T','Present'),
('TG2020/008', '2023-01-26',2,'ICT03','T','Present'),
('TG2020/009', '2023-01-26',2,'ICT03','T','Present'),
('TG2020/010', '2023-01-26',2,'ICT03','T','Present'),

('TG2020/001', '2023-01-26',2,'ICT04','P','Present'),
('TG2020/002', '2023-01-26',2,'ICT04','P','Present'),
('TG2020/003', '2023-01-26',2,'ICT04','P','Present'),
('TG2020/004', '2023-01-26',2,'ICT04','P','Present'),
('TG2020/005', '2023-01-26',2,'ICT04','P','Present'),
('TG2020/006', '2023-01-26',2,'ICT04','P','Present'),
('TG2020/007', '2023-01-26',2,'ICT04','P','Present'),
('TG2020/008', '2023-01-26',2,'ICT04','P','Present'),
('TG2020/009', '2023-01-26',2,'ICT04','P','Present'),
('TG2020/010', '2023-01-26',2,'ICT04','P','Present'),

('TG2020/001', '2023-01-27',2,'ICT01','T','Present'),
('TG2020/002', '2023-01-27',2,'ICT01','T','Present'),
('TG2020/003', '2023-01-27',2,'ICT01','T','Present'),
('TG2020/004', '2023-01-27',2,'ICT01','T','Present'),
('TG2020/005', '2023-01-27',2,'ICT01','T','Present'),
('TG2020/006', '2023-01-27',2,'ICT01','T','Present'),
('TG2020/007', '2023-01-27',2,'ICT01','T','Present'),
('TG2020/008', '2023-01-27',2,'ICT01','T','Present'),
('TG2020/009', '2023-01-27',2,'ICT01','T','Present'),
('TG2020/010', '2023-01-27',2,'ICT01','T','Present'),

('TG2020/001', '2023-01-27',2,'ICT02','P','Present'),
('TG2020/002', '2023-01-27',2,'ICT02','P','Present'),
('TG2020/003', '2023-01-27',2,'ICT02','P','Present'),
('TG2020/004', '2023-01-27',2,'ICT02','P','Present'),
('TG2020/005', '2023-01-27',2,'ICT02','P','Present'),
('TG2020/006', '2023-01-27',2,'ICT02','P','Absent'),
('TG2020/007', '2023-01-27',2,'ICT02','P','Present'),
('TG2020/008', '2023-01-27',2,'ICT02','P','Present'),
('TG2020/009', '2023-01-27',2,'ICT02','P','Present'),
('TG2020/010', '2023-01-27',2,'ICT02','P','Present'),

('TG2020/001', '2023-01-27',2,'ICT03','P','Present'),
('TG2020/002', '2023-01-27',2,'ICT03','P','Present'),
('TG2020/003', '2023-01-27',2,'ICT03','P','Present'),
('TG2020/004', '2023-01-27',2,'ICT03','P','Present'),
('TG2020/005', '2023-01-27',2,'ICT03','P','Present'),
('TG2020/006', '2023-01-27',2,'ICT03','P','Absent'),
('TG2020/007', '2023-01-27',2,'ICT03','P','Present'),
('TG2020/008', '2023-01-27',2,'ICT03','P','Present'),
('TG2020/009', '2023-01-27',2,'ICT03','P','Present'),
('TG2020/010', '2023-01-27',2,'ICT03','P','Present'),

('TG2020/001', '2023-01-27',2,'ICT04','P','Present'),
('TG2020/002', '2023-01-27',2,'ICT04','P','Present'),
('TG2020/003', '2023-01-27',2,'ICT04','P','Present'),
('TG2020/004', '2023-01-27',2,'ICT04','P','Present'),
('TG2020/005', '2023-01-27',2,'ICT04','P','Present'),
('TG2020/006', '2023-01-27',2,'ICT04','P','Present'),
('TG2020/007', '2023-01-27',2,'ICT04','P','Present'),
('TG2020/008', '2023-01-27',2,'ICT04','P','Present'),
('TG2020/009', '2023-01-27',2,'ICT04','P','Present'),
('TG2020/010', '2023-01-27',2,'ICT04','P','Present');

DROP TABLE IF EXISTS exam_marks;
CREATE TABLE IF NOT EXISTS exam_marks (
  exm_id int(11) NOT NULL AUTO_INCREMENT,
  exm_st_id varchar(20) NOT NULL,
  exm_cou_id varchar(10) NOT NULL,
  exm_type varchar(10) NOT NULL,
  exm_score int(10) NOT NULL,
  PRIMARY KEY (exm_id),
  FOREIGN KEY (exm_st_id) REFERENCES students(st_id),
  FOREIGN KEY (exm_cou_id) REFERENCES cou_mod(cou_id)
) ENGINE=InnoDB AUTO_INCREMENT=494 DEFAULT CHARSET=utf8;


INSERT INTO exam_marks(exm_st_id,exm_cou_id,exm_type,exm_score)VALUES
('TG/2020/001','ICT01','Q1',100),
('TG/2020/002','ICT01','Q1',90),
('TG/2020/003','ICT01','Q1',100),
('TG/2020/004','ICT01','Q1',80),
('TG/2020/005','ICT01','Q1',90),
('TG/2020/006','ICT01','Q1',50),
('TG/2020/007','ICT01','Q1',70),
('TG/2020/008','ICT01','Q1',85),
('TG/2020/009','ICT01','Q1',90),
('TG/2020/010','ICT01','Q1',100),

('TG/2020/001','ICT01','Q2',40),
('TG/2020/002','ICT01','Q2',60),
('TG/2020/003','ICT01','Q2',90),
('TG/2020/004','ICT01','Q2',70),
('TG/2020/005','ICT01','Q2',70),
('TG/2020/006','ICT01','Q2',80),
('TG/2020/007','ICT01','Q2',80),
('TG/2020/008','ICT01','Q2',100),
('TG/2020/009','ICT01','Q2',90),
('TG/2020/010','ICT01','Q2',80),

('TG/2020/001','ICT01','Q3',70),
('TG/2020/002','ICT01','Q3',100),
('TG/2020/003','ICT01','Q3',60),
('TG/2020/004','ICT01','Q3',80),
('TG/2020/005','ICT01','Q3',100),
('TG/2020/006','ICT01','Q3',50),
('TG/2020/007','ICT01','Q3',60),
('TG/2020/008','ICT01','Q3',90),
('TG/2020/009','ICT01','Q3',100),
('TG/2020/010','ICT01','Q3',80),

('TG/2020/001','ICT02','Q1',60),
('TG/2020/002','ICT02','Q1',100),
('TG/2020/003','ICT02','Q1',100),
('TG/2020/004','ICT02','Q1',80),
('TG/2020/005','ICT02','Q1',70),
('TG/2020/006','ICT02','Q1',90),
('TG/2020/007','ICT02','Q1',100),
('TG/2020/008','ICT02','Q1',50),
('TG/2020/009','ICT02','Q1',90),
('TG/2020/010','ICT02','Q1',40),

('TG/2020/001','ICT02','Q2',80),
('TG/2020/002','ICT02','Q2',80),
('TG/2020/003','ICT02','Q2',60),
('TG/2020/004','ICT02','Q2',100),
('TG/2020/005','ICT02','Q2',100),
('TG/2020/006','ICT02','Q2',90),
('TG/2020/007','ICT02','Q2',60),
('TG/2020/008','ICT02','Q2',100),
('TG/2020/009','ICT02','Q2',90),
('TG/2020/010','ICT02','Q2',80),

('TG/2020/001','ICT02','Q3',80),
('TG/2020/002','ICT02','Q3',100),
('TG/2020/003','ICT02','Q3',60),
('TG/2020/004','ICT02','Q3',90),
('TG/2020/005','ICT02','Q3',50),
('TG/2020/006','ICT02','Q3',100),
('TG/2020/007','ICT02','Q3',70),
('TG/2020/008','ICT02','Q3',60),
('TG/2020/009','ICT02','Q3',80),
('TG/2020/010','ICT02','Q3',90),

('TG/2020/001','ICT02','Q4',100),
('TG/2020/002','ICT02','Q4',100),
('TG/2020/003','ICT02','Q4',100),
('TG/2020/004','ICT02','Q4',80),
('TG/2020/005','ICT02','Q4',70),
('TG/2020/006','ICT02','Q4',90),
('TG/2020/007','ICT02','Q4',100),
('TG/2020/008','ICT02','Q4',50),
('TG/2020/009','ICT02','Q4',90),
('TG/2020/010','ICT02','Q4',90),

('TG/2020/001','ICT03','Q1',50),
('TG/2020/002','ICT03','Q1',40),
('TG/2020/003','ICT03','Q1',30),
('TG/2020/004','ICT03','Q1',70),
('TG/2020/005','ICT03','Q1',80),
('TG/2020/006','ICT03','Q1',90),
('TG/2020/007','ICT03','Q1',70),
('TG/2020/008','ICT03','Q1',70),
('TG/2020/009','ICT03','Q1',60),
('TG/2020/010','ICT03','Q1',50),

('TG/2020/001','ICT03','Q2',100),
('TG/2020/002','ICT03','Q2',80),
('TG/2020/003','ICT03','Q2',80),
('TG/2020/004','ICT03','Q2',60),
('TG/2020/005','ICT03','Q2',50),
('TG/2020/006','ICT03','Q2',100),
('TG/2020/007','ICT03','Q2',90),
('TG/2020/008','ICT03','Q2',80),
('TG/2020/009','ICT03','Q2',60),
('TG/2020/010','ICT03','Q2',80),

('TG/2020/001','ICT03','Q3',90),
('TG/2020/002','ICT03','Q3',70),
('TG/2020/003','ICT03','Q3',60),
('TG/2020/004','ICT03','Q3',50),
('TG/2020/005','ICT03','Q3',80),
('TG/2020/006','ICT03','Q3',90),
('TG/2020/007','ICT03','Q3',60),
('TG/2020/008','ICT03','Q3',70),
('TG/2020/009','ICT03','Q3',100),
('TG/2020/010','ICT03','Q3',70),

('TG/2020/001','ICT04','Q1',100),
('TG/2020/002','ICT04','Q1',80),
('TG/2020/003','ICT04','Q1',70),
('TG/2020/004','ICT04','Q1',90),
('TG/2020/005','ICT04','Q1',80),
('TG/2020/006','ICT04','Q1',80),
('TG/2020/007','ICT04','Q1',50),
('TG/2020/008','ICT04','Q1',70),
('TG/2020/009','ICT04','Q1',50),
('TG/2020/010','ICT04','Q1',80),

('TG/2020/001','ICT04','Q2',100),
('TG/2020/002','ICT04','Q2',85),
('TG/2020/003','ICT04','Q2',90),
('TG/2020/004','ICT04','Q2',40),
('TG/2020/005','ICT04','Q2',90),
('TG/2020/006','ICT04','Q2',50),
('TG/2020/007','ICT04','Q2',100),
('TG/2020/008','ICT04','Q2',80),
('TG/2020/009','ICT04','Q2',70),
('TG/2020/010','ICT04','Q2',90),

('TG/2020/001','ICT04','Q3',70),
('TG/2020/002','ICT04','Q3',70),
('TG/2020/003','ICT04','Q3',70),
('TG/2020/004','ICT04','Q3',70),
('TG/2020/005','ICT04','Q3',60),
('TG/2020/006','ICT04','Q3',100),
('TG/2020/007','ICT04','Q3',90),
('TG/2020/008','ICT04','Q3',80),
('TG/2020/009','ICT04','Q3',100),
('TG/2020/010','ICT04','Q3',85),

('TG/2020/001','ICT02','A1',50),
('TG/2020/002','ICT02','A1',40),
('TG/2020/003','ICT02','A1',30),
('TG/2020/004','ICT02','A1',56),
('TG/2020/005','ICT02','A1',41),
('TG/2020/006','ICT02','A1',35),
('TG/2020/007','ICT02','A1',55),
('TG/2020/008','ICT02','A1',65),
('TG/2020/009','ICT02','A1',40),
('TG/2020/010','ICT02','A1',80),

('TG/2020/001','ICT02','A2',75),
('TG/2020/002','ICT02','A2',85),
('TG/2020/003','ICT02','A2',75),
('TG/2020/004','ICT02','A2',85),
('TG/2020/005','ICT02','A2',55),
('TG/2020/006','ICT02','A2',50),
('TG/2020/007','ICT02','A2',95),
('TG/2020/008','ICT02','A2',82),
('TG/2020/009','ICT02','A2',70),
('TG/2020/010','ICT02','A2',83),

('TG/2020/001','ICT03','A1',70),
('TG/2020/002','ICT03','A1',80),
('TG/2020/003','ICT03','A1',75),
('TG/2020/004','ICT03','A1',80),
('TG/2020/005','ICT03','A1',90),
('TG/2020/006','ICT03','A1',100),
('TG/2020/007','ICT03','A1',97),
('TG/2020/008','ICT03','A1',80),
('TG/2020/009','ICT03','A1',100),
('TG/2020/010','ICT03','A1',80),

('TG/2020/001','ICT03','A2',75),
('TG/2020/002','ICT03','A2',85),
('TG/2020/003','ICT03','A2',70),
('TG/2020/004','ICT03','A2',85),
('TG/2020/005','ICT03','A2',75),
('TG/2020/006','ICT03','A2',60),
('TG/2020/007','ICT03','A2',98),
('TG/2020/008','ICT03','A2',81),
('TG/2020/009','ICT03','A2',70),
('TG/2020/010','ICT03','A2',75),

('TG/2020/001','ICT04','A1',70),
('TG/2020/002','ICT04','A1',80),
('TG/2020/003','ICT04','A1',75),
('TG/2020/004','ICT04','A1',80),
('TG/2020/005','ICT04','A1',90),
('TG/2020/006','ICT04','A1',100),
('TG/2020/007','ICT04','A1',97),
('TG/2020/008','ICT04','A1',80),
('TG/2020/009','ICT04','A1',100),
('TG/2020/010','ICT04','A1',80),

('TG/2020/001','ICT04','A2',60),
('TG/2020/002','ICT04','A2',40),
('TG/2020/003','ICT04','A2',55),
('TG/2020/004','ICT04','A2',90),
('TG/2020/005','ICT04','A2',100),
('TG/2020/006','ICT04','A2',80),
('TG/2020/007','ICT04','A2',92),
('TG/2020/008','ICT04','A2',85),
('TG/2020/009','ICT04','A2',95),
('TG/2020/010','ICT04','A2',82),

('TG/2020/001','ICT01','MID',70),
('TG/2020/002','ICT01','MID',80),
('TG/2020/003','ICT01','MID',75),
('TG/2020/004','ICT01','MID',80),
('TG/2020/005','ICT01','MID',90),
('TG/2020/006','ICT01','MID',100),
('TG/2020/007','ICT01','MID',97),
('TG/2020/008','ICT01','MID',80),
('TG/2020/009','ICT01','MID',100),
('TG/2020/010','ICT01','MID',80),

('TG/2020/001','ICT02','MID',45),
('TG/2020/002','ICT02','MID',55),
('TG/2020/003','ICT02','MID',50),
('TG/2020/004','ICT02','MID',40),
('TG/2020/005','ICT02','MID',51),
('TG/2020/006','ICT02','MID',43),
('TG/2020/007','ICT02','MID',49),
('TG/2020/008','ICT02','MID',50),
('TG/2020/009','ICT02','MID',36),
('TG/2020/010','ICT02','MID',37),

('TG/2020/001','ICT01','FT',70),
('TG/2020/002','ICT01','FT',80),
('TG/2020/003','ICT01','FT',75),
('TG/2020/004','ICT01','FT',80),
('TG/2020/005','ICT01','FT',90),
('TG/2020/006','ICT01','FT',100),
('TG/2020/007','ICT01','FT',97),
('TG/2020/008','ICT01','FT',80),
('TG/2020/009','ICT01','FT',100),
('TG/2020/010','ICT01','FT',80),

('TG/2020/001','ICT02','FT',40),
('TG/2020/002','ICT02','FT',50),
('TG/2020/003','ICT02','FT',45),
('TG/2020/004','ICT02','FT',60),
('TG/2020/005','ICT02','FT',72),
('TG/2020/006','ICT02','FT',75),
('TG/2020/007','ICT02','FT',43),
('TG/2020/008','ICT02','FT',50),
('TG/2020/009','ICT02','FT',40),
('TG/2020/010','ICT02','FT',40),

('TG/2020/001','ICT02','FP',40),
('TG/2020/002','ICT02','FP',42),
('TG/2020/003','ICT02','FP',39),
('TG/2020/004','ICT02','FP',36),
('TG/2020/005','ICT02','FP',41),
('TG/2020/006','ICT02','FP',55),
('TG/2020/007','ICT02','FP',67),
('TG/2020/008','ICT02','FP',61),
('TG/2020/009','ICT02','FP',52),
('TG/2020/010','ICT02','FP',50),

('TG/2020/001','ICT03','FT',40),
('TG/2020/002','ICT03','FT',50),
('TG/2020/003','ICT03','FT',55),
('TG/2020/004','ICT03','FT',45),
('TG/2020/005','ICT03','FT',35),
('TG/2020/006','ICT03','FT',45),
('TG/2020/007','ICT03','FT',41),
('TG/2020/008','ICT03','FT',42),
('TG/2020/009','ICT03','FT',47),
('TG/2020/010','ICT03','FT',50),

('TG/2020/001','ICT03','FP',40),
('TG/2020/002','ICT03','FP',55),
('TG/2020/003','ICT03','FP',37),
('TG/2020/004','ICT03','FP',41),
('TG/2020/005','ICT03','FP',52),
('TG/2020/006','ICT03','FP',23),
('TG/2020/007','ICT03','FP',25),
('TG/2020/008','ICT03','FP',50),
('TG/2020/009','ICT03','FP',30),
('TG/2020/010','ICT03','FP',37),

('TG/2020/001','ICT04','FT',35),
('TG/2020/002','ICT04','FT',47),
('TG/2020/003','ICT04','FT',51),
('TG/2020/004','ICT04','FT',50),
('TG/2020/005','ICT04','FT',40),
('TG/2020/006','ICT04','FT',37),
('TG/2020/007','ICT04','FT',64),
('TG/2020/008','ICT04','FT',61),
('TG/2020/009','ICT04','FT',49),
('TG/2020/010','ICT04','FT',38),

('TG/2020/001','ICT04','FP',40),
('TG/2020/002','ICT04','FP',50),
('TG/2020/003','ICT04','FP',65),
('TG/2020/004','ICT04','FP',40),
('TG/2020/005','ICT04','FP',56),
('TG/2020/006','ICT04','FP',36),
('TG/2020/007','ICT04','FP',52),
('TG/2020/008','ICT04','FP',78),
('TG/2020/009','ICT04','FP',53),
('TG/2020/010','ICT04','FP',45);

DROP VIEW IF EXISTS quiz_view;
CREATE VIEW quiz_view AS
SELECT exm_cou_id, exm_st_id,
       SUM(highest_score + second_highest_score) as total_score,
       ROUND(0.1 * SUM(highest_score + second_highest_score)) AS quiz_score
FROM (
  SELECT exm_cou_id, exm_st_id,
         MAX(exm_score) as highest_score,
         (SELECT MAX(exm_score)
          FROM exam_marks em2
          WHERE em2.exm_cou_id = em1.exm_cou_id
          AND em2.exm_st_id = em1.exm_st_id
          AND em2.exm_type LIKE 'Q%'
          AND em2.exm_score < (SELECT MAX(em3.exm_score)
                               FROM exam_marks em3
                               WHERE em3.exm_type LIKE 'Q%'
                               AND em3.exm_st_id = em1.exm_st_id
                               AND em3.exm_cou_id = em1.exm_cou_id)) as second_highest_score
  FROM exam_marks em1
  WHERE exm_type LIKE 'Q%'
  GROUP BY exm_cou_id, exm_st_id
) AS t
GROUP BY exm_cou_id, exm_st_id;

select * from quiz_view;

DROP VIEW IF EXISTS assess_view;
CREATE VIEW assess_view as
SELECT exm_cou_id, exm_st_id,
       SUM(highest_score + second_highest_score) as total_score,
       ROUND(0.2 * SUM(highest_score + second_highest_score)) AS assess_score
FROM (
  SELECT exm_cou_id, exm_st_id,
         MAX(exm_score) as highest_score,
         (SELECT MAX(exm_score)
          FROM exam_marks em2
          WHERE em2.exm_cou_id = em1.exm_cou_id
          AND em2.exm_st_id = em1.exm_st_id
          AND em2.exm_type LIKE 'A%'
          AND em2.exm_score < (SELECT MAX(em3.exm_score)
                               FROM exam_marks em3
                               WHERE em3.exm_type LIKE 'A%'
                               AND em3.exm_st_id = em1.exm_st_id
                               AND em3.exm_cou_id = em1.exm_cou_id)) as second_highest_score
  FROM exam_marks em1
  WHERE exm_type LIKE 'A%'
  GROUP BY exm_cou_id, exm_st_id
) AS t
GROUP BY exm_cou_id, exm_st_id;

select * from assess_view;

DROP VIEW IF EXISTS mid_view;
CREATE VIEW mid_view as
SELECT exm_st_id, exm_cou_id, 
ROUND(0.2 * exm_score) AS mid_score 
FROM exam_marks
WHERE exm_type = 'MID'
GROUP BY exm_st_id, exm_cou_id;

select * from mid_view;

DROP VIEW IF EXISTS ft_ict01;
CREATE VIEW ft_ict01 as
SELECT exm_st_id, exm_cou_id, 
ROUND(0.4 * exm_score) AS ft_ict01_score 
FROM exam_marks
WHERE exm_type = 'FT' AND exm_cou_id='ICT01'
GROUP BY exm_st_id, exm_cou_id;

select * from ft_ict01;

DROP VIEW IF EXISTS finalmarks_ict01;
CREATE VIEW finalmarks_ict01 AS
SELECT q.exm_st_id, q.exm_cou_id, q.quiz_score,m.mid_score, f.ft_ict01_score,
       (q.quiz_score+m.mid_score + f.ft_ict01_score) AS final_marks_ict01
FROM quiz_view q
JOIN mid_view m ON q.exm_st_id = m.exm_st_id AND q.exm_cou_id = m.exm_cou_id
JOIN ft_ict01 f ON q.exm_st_id = f.exm_st_id AND q.exm_cou_id = f.exm_cou_id
WHERE q.exm_cou_id = 'ICT01';

select * from finalmarks_ict01;

DROP VIEW IF EXISTS ftfp_ict02;
CREATE VIEW ftfp_ict02 as
SELECT exm_st_id, exm_cou_id, SUM(ROUND(FT*0.5) + ROUND(FP*0.3)) as ftfp_ict02_score
FROM (
    SELECT exm_st_id, exm_cou_id,
           CASE WHEN exm_type = 'FT' THEN exm_score ELSE 0 END as FT,
           CASE WHEN exm_type = 'FP' THEN exm_score ELSE 0 END as FP
    FROM exam_marks
    WHERE exm_type IN ('FT', 'FP') AND exm_cou_id='ICT02'
) subquery
GROUP BY exm_st_id, exm_cou_id;

select * from ftfp_ict02;

DROP VIEW IF EXISTS finalmarks_ict02;
CREATE VIEW finalmarks_ict02 AS
SELECT q.exm_st_id, q.exm_cou_id, q.quiz_score, a.assess_score, m.mid_score, f.ftfp_ict02_score,
       (q.quiz_score + a.assess_score + m.mid_score + f.ftfp_ict02_score) AS final_marks_ict02
FROM quiz_view q
JOIN assess_view a ON q.exm_st_id = a.exm_st_id AND q.exm_cou_id = a.exm_cou_id
JOIN mid_view m ON q.exm_st_id = m.exm_st_id AND q.exm_cou_id = m.exm_cou_id
JOIN ftfp_ict02 f ON q.exm_st_id = f.exm_st_id AND q.exm_cou_id = f.exm_cou_id
WHERE q.exm_cou_id = 'ICT02';

select * from finalmarks_ict02;

DROP VIEW IF EXISTS ftfp_ict03;
CREATE VIEW ftfp_ict03 as
SELECT exm_st_id, exm_cou_id, SUM(ROUND(FT*0.4) + ROUND(FP*0.3)) as ftfp_ict03_score
FROM (
    SELECT exm_st_id, exm_cou_id,
           CASE WHEN exm_type = 'FT' THEN exm_score ELSE 0 END as FT,
           CASE WHEN exm_type = 'FP' THEN exm_score ELSE 0 END as FP
    FROM exam_marks
    WHERE exm_type IN ('FT', 'FP') AND exm_cou_id='ICT03'
) subquery
GROUP BY exm_st_id, exm_cou_id;

select * from ftfp_ict03;

DROP VIEW IF EXISTS finalmarks_ict03;
CREATE VIEW finalmarks_ict03 AS
SELECT q.exm_st_id, q.exm_cou_id, q.quiz_score, a.assess_score,f.ftfp_ict03_score,
       (q.quiz_score + a.assess_score + f.ftfp_ict03_score) AS final_marks_ict03
FROM quiz_view q
JOIN assess_view a ON q.exm_st_id = a.exm_st_id AND q.exm_cou_id = a.exm_cou_id
JOIN ftfp_ict03 f ON q.exm_st_id = f.exm_st_id AND q.exm_cou_id = f.exm_cou_id
WHERE q.exm_cou_id = 'ICT03';

select * from finalmarks_ict03;

DROP VIEW IF EXISTS ftfp_ict04;
CREATE VIEW ftfp_ict04 as
SELECT exm_st_id, exm_cou_id, SUM(ROUND(FT*0.3) + ROUND(FP*0.4)) as ftfp_ict04_score
FROM (
    SELECT exm_st_id, exm_cou_id,
           CASE WHEN exm_type = 'FT' THEN exm_score ELSE 0 END as FT,
           CASE WHEN exm_type = 'FP' THEN exm_score ELSE 0 END as FP
    FROM exam_marks
    WHERE exm_type IN ('FT', 'FP') AND exm_cou_id='ICT04'
) subquery
GROUP BY exm_st_id, exm_cou_id;

select * from ftfp_ict04;

DROP VIEW IF EXISTS finalmarks_ict04;
CREATE VIEW finalmarks_ict04 AS
SELECT q.exm_st_id, q.exm_cou_id, q.quiz_score, a.assess_score,f.ftfp_ict04_score,
       (q.quiz_score + a.assess_score + f.ftfp_ict04_score) AS final_marks_ict04
FROM quiz_view q
JOIN assess_view a ON q.exm_st_id = a.exm_st_id AND q.exm_cou_id = a.exm_cou_id
JOIN ftfp_ict04 f ON q.exm_st_id = f.exm_st_id AND q.exm_cou_id = f.exm_cou_id
WHERE q.exm_cou_id = 'ICT04';

select * from finalmarks_ict04;

CREATE INDEX idx_exm_st_id ON exam_marks (exm_st_id);

CREATE TABLE marks_01 AS
SELECT exm_st_id, final_marks_ict01
FROM finalmarks_ict01;

CREATE TABLE marks_02 AS
SELECT exm_st_id, final_marks_ict02
FROM finalmarks_ict02;

CREATE TABLE marks_03 AS
SELECT exm_st_id, final_marks_ict03
FROM finalmarks_ict03;

CREATE TABLE marks_04 AS
SELECT exm_st_id, final_marks_ict04
FROM finalmarks_ict04;

DROP TABLE IF EXISTS final_summary;
CREATE TABLE final_summary AS
SELECT t1.exm_st_id, t1.final_marks_ict01 ,t2.final_marks_ict02 ,t3.final_marks_ict03 , t4.final_marks_ict04
FROM marks_01 t1
JOIN marks_02 t2 ON t1.exm_st_id = t2.exm_st_id
JOIN marks_03 t3 ON t1.exm_st_id = t3.exm_st_id
JOIN marks_04 t4 ON t1.exm_st_id = t4.exm_st_id;

SELECT * FROM final_summary;

DROP TABLE IF EXISTS gpaGrades;
CREATE TABLE gpaGrades(
	st_id varchar(50) not null,
    SGPA varchar(50) not null,
    Grade varchar(50) not null,
    CGPA varchar(50) not null,
    FOREIGN KEY(st_id) REFERENCES students(st_id)
    );

DROP TABLE IF EXISTS medical;
CREATE TABLE IF NOT EXISTS medical(
  med_id int(11) NOT NULL AUTO_INCREMENT,
  med_start_day  date NOT NULL,
  med_end_day date NOT NULL,
  med_st_id varchar(20) NOT NULL,
  med_cou_id varchar(10) NOT NULL,
  med_condition varchar(20) NOT NULL,
  PRIMARY KEY (med_id),
  FOREIGN KEY (med_st_id) REFERENCES students(st_id),
  FOREIGN KEY (med_cou_id) REFERENCES cou_mod(cou_id)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO medical(med_id,med_start_day,med_end_day,med_st_id,med_cou_id,med_condition)VALUES
(1,'2023-01-09','2023-01-12','TG/2020/005','ICT01','Approved'),
(2,'2023-01-17','2023-01-20','TG/2020/008','ICT02','Rejected');

DROP TABLE IF EXISTS notice;
CREATE TABLE IF NOT EXISTS notice (
  notice_id varchar(10) NOT NULL,
  Subject varchar(50) DEFAULT NULL,
  Content varchar(200) DEFAULT NULL,
  DATE varchar(20) DEFAULT NULL,
  PRIMARY KEY (Notice_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO notice(notice_id,Subject,Content,Date)VALUES
('N001', 'Spring Carnival', 'don’t miss the annual Spring Carnival on April 15th! There will be games, food, and prizes for everyone. See you there!', '2023-03-10'),
('N002', 'Scholarship Application', 'Applications for the John Smith Scholarship are now open. Visit our website for more information and to apply. Deadline is April 30th.', '2023-03-15'),
('N003', 'New Parking Policy', 'Starting next week, all students and faculty must display a parking permit in order to park on campus. Permits can be purchased at the Parking Office.', '2023-03-20'),
('N004', 'Job Opportunity', 'The Department of Biology is seeking a research assistant to work on an exciting new project. Interested candidates should submit a resume and cover letter to Prof. Johnson.', '2023-03-25'),
('N005', 'Guest Lecture', 'join us on April 10th for a guest lecture by Dr. Jane Smith on the topic of "The Psychology of Decision Making". All are welcome to attend.', '2023-03-28'),
('N006', 'Campus Closure', 'Due to inclement weather, the campus will be closed on March 31st. All classes and activities are cancelled.', '2023-03-30'),
('N007', 'Revised Exam Schedule', 'The exam schedule for the spring 2023 semester has been revised. Please check your email for the updated schedule.', '2023-04-02'),
('N008', 'Research Study Participants Needed', 'The Department of Psychology is seeking participants for a research study on memory. Participants will be compensated for their time. Contact Prof. Lee for more information.', '2023-04-05'),
('N009', 'Cancelled Event', 'The spring concert, scheduled for April 20th, has been cancelled due to unforeseen circumstances. We apologize for the inconvenience.', '2023-04-10'),
('N010', 'Graduation Ceremony', 'Congratulations to the Class of 2023! The graduation ceremony will be held on May 15th at 10am. Please visit our website for more information.', '2023-04-15');

DROP TABLE IF EXISTS time_table;
CREATE TABLE IF NOT EXISTS time_table (
  Time_Table_id int(11) NOT NULL AUTO_INCREMENT,
  Department_ID varchar(10) NOT NULL,
  Level varchar(11) NOT NULL,
  Semester varchar(5) NOT NULL,
  Date varchar(10) NOT NULL,
  Course_id varchar(60) NOT NULL,
  Start_time varchar(20) NOT NULL,
  End_time varchar(20) NOT NULL,
  Location varchar(20) NOT NULL,
  Type varchar(10) NOT NULL,
  PRIMARY KEY (Time_Table_id)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

INSERT INTO time_table(Time_Table_ID,Department_ID,Level,Semester,Date,Course_id,Start_time,End_time,Location,Type)VALUES
(1, 'DEPICT','L2','S1','Monday','ICT01','9.00','10.00','Lab11','T'),
(2, 'DEPICT','L2','S1','Monday','ICT02','10.00','12.00','Lab12','P'),
(3, 'DEPICT','L2','S1','Monday','ICT03','13.00','15.00','Lab11','T'),
(4, 'DEPICT','L2','S1','Monday','ICT04','15.00','17.00','Lab12','P'),
(5, 'DEPICT','L2','S1','Tuesday','ICT01','9.00','10.00','Lab11','T'),
(6, 'DEPICT','L2','S1','Tuesday','ICT02','10.00','12.00','Lab12','T'),
(7, 'DEPICT','L2','S1','Tuesday','ICT03','13.00','15.00','Lab11','P'),
(8, 'DEPICT','L2','S1','Tuesday','ICT04','15.00','17.00','Lab12','T'),
(9,'DEPICT','L2','S1','Wednesday','ICT01','9.00','10.00','Lab11','T'),
(10,'DEPICT','L2','S1','Wedneday','ICT02','10.00','12.00','Lab12','P'),
(11,'DEPICT','L2','S1','Wedneday','ICT03','13.00','15.00','Lab11','T'),
(12,'DEPICT','L2','S1','Wedneday','ICT04','15.00','17.00','Lab12','P'),
(13, 'DEPICT','L2','S1','Thursday','ICT01','9.00','10.00','Lab11','T'),
(14, 'DEPICT','L2','S1','Thursday','ICT02','10.00','12.00','Lab12','T'),
(15, 'DEPICT','L2','S1','Thursday','ICT03','13.00','15.00','Lab11','P'),
(16, 'DEPICT','L2','S1','Thursday','ICT04','15.00','17.00','Lab12','T'),
(17, 'DEPICT','L2','S1','Friday','ICT01','9.00','10.00','Lab11','T'),
(18, 'DEPICT','L2','S1','Friday','ICT02','10.00','12.00','Lab12','P'),
(19, 'DEPICT','L2','S1','Friday','ICT03','13.00','15.00','Lab11','P'),
(20, 'DEPICT','L2','S1','Friday','ICT04','15.00','17.00','Lab12','P'),
(21, 'DEPBST','L2','S1','Monday','BST09','8.00','10.00','Lab04','T'),
(22, 'DEPBST','L2','S1','Monday','BST10','11.00','12.00','NBLLT','P'),
(23, 'DEPBST','L2','S1','Monday','BST11','13.00','15.00','Lab04','T'),
(24, 'DEPBST','L2','S1','Monday','BST12','15.00','17.00','NBLLT','P'),
(25, 'DEPBST','L2','S1','Tuesday','BST09','8.00','10.00','Lab04','T'),
(26, 'DEPBST','L2','S1','Tuesday','BST10','11.00','12.00','NBLLT','T'),
(27, 'DEPBST','L2','S1','Tuesday','BST11','13.00','15.00','Lab04','P'),
(28, 'DEPBST','L2','S1','Tuesday','BST12','15.00','17.00','NBLLT','T'),
(29,'DEPBST','L2','S1','Wednesday','BST09','8.00','10.00','Lab04','T'),
(30,'DEPBST','L2','S1','Wedneday','BST10','11.00','12.00','NBLLT','P'),
(31,'DEPBST','L2','S1','Wedneday','BST11','13.00','15.00','Lab04','T'),
(32,'DEPBST','L2','S1','Wedneday','BST12','15.00','17.00','NBLLT','P'),
(33, 'DEPBST','L2','S1','Thursday','BST09','8.00','10.00','Lab04','T'),
(34, 'DEPBST','L2','S1','Thursday','BST10','11.00','12.00','NBLLT','T'),
(35, 'DEPBST','L2','S1','Thursday','BST11','13.00','15.00','Lab04','P'),
(36, 'DEPBST','L2','S1','Thursday','BST12','15.00','17.00','NBLLT','T'),
(37, 'DEPBST','L2','S1','Friday','BST09','8.00','10.00','Lab04','T'),
(38, 'DEPBST','L2','S1','Friday','BST10','11.00','12.00','NBLLT','T'),
(39, 'DEPBST','L2','S1','Friday','BST11','13.00','15.00','Lab04','P'),
(40, 'DEPBST','L2','S1','Friday','BST12','15.00','17.00','NBLLT','T'),
(41, 'DEPET','L2','S1','Monday','ET01','9.00','10.00','Lab06','T'),
(42, 'DEPET','L2','S1','Monday','ET02','10.00','12.00','Lab08','P'),
(43, 'DEPET','L2','S1','Monday','ET03','13.00','15.00','Lab06','T'),
(44, 'DEPET','L2','S1','Monday','ET04','15.00','17.00','Lab08','P'),
(45, 'DEPET','L2','S1','Tuesday','ET01','9.00','10.00','Lab06','T'),
(46, 'DEPET','L2','S1','Tuesday','ET02','10.00','12.00','Lab08','T'),
(47, 'DEPET','L2','S1','Tuesday','ET03','13.00','15.00','Lab06','P'),
(48, 'DEPET','L2','S1','Tuesday','ET04','15.00','17.00','Lab08','T'),
(49,'DEPET','L2','S1','Wednesday','ET01','9.00','10.00','Lab06','T'),
(50,'DEPET','L2','S1','Wedneday','ET02','10.00','12.00','Lab08','P'),
(51,'DEPET','L2','S1','Wedneday','ET03','13.00','15.00','Lab06','T'),
(52,'DEPET','L2','S1','Wedneday','ET04','15.00','17.00','Lab08','P'),
(53, 'DEPET','L2','S1','Thursday','ET01','9.00','10.00','Lab06','T'),
(54, 'DEPET','L2','S1','Thursday','ET02','10.00','12.00','Lab08','T'),
(55, 'DEPET','L2','S1','Thursday','ET03','13.00','15.00','Lab06','P'),
(56, 'DEPET','L2','S1','Thursday','ET04','15.00','17.00','Lab08','T'),
(57, 'DEPET','L2','S1','Friday','ET01','9.00','10.00','Lab06','T'),
(58, 'DEPET','L2','S1','Friday','ET02','10.00','12.00','Lab08','T'),
(59, 'DEPET','L2','S1','Friday','ET03','13.00','15.00','Lab06','P'),
(60, 'DEPET','L2','S1','Friday','ET04','15.00','17.00','Lab08','T');

DROP TABLE IF EXISTS logged_user;
CREATE TABLE logged_user(
    user_name varchar(50) not null,
    password varchar(50) not null
);

DROP VIEW IF EXISTS attendance_summary;
CREATE VIEW attendance_summary AS
SELECT 
    at_st_id, 
    at_level, 
    at_cou_id, 
    at_cou_type,
    COUNT(*) as total_session,
    SUM(CASE WHEN at_status = 'Present' THEN 1 ELSE 0 END) as present_days,
    SUM(CASE WHEN at_status = 'Absent' THEN 1 ELSE 0 END) as absent_days,
    ROUND((SUM(CASE WHEN at_status = 'Present' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) as attendance_percentage
FROM 
    attendance
WHERE 
	at_date between '2023-01-09' AND '2023-01-27'
GROUP BY 
    at_st_id, 
    at_level, 
    at_cou_id, 
    at_cou_type;

SELECT * FROM attendance_summary;

DROP VIEW IF EXISTS ca_summary;
CREATE VIEW ca_summary AS
SELECT exm_st_id AS st_id, exm_cou_id AS cou_id,AVG(exm_score) AS CA_average,
       CASE WHEN AVG(exm_score) >= 50 THEN 'Pass' ELSE 'Fail' END AS CA_status
FROM exam_marks
WHERE exm_type LIKE 'Q%'
GROUP BY exm_st_id,exm_cou_id;

SELECT * FROM ca_summary;

DROP VIEW IF EXISTS eligibility_checking;
CREATE VIEW eligibility_checking AS
SELECT 
    a.at_st_id AS st_id,
    c.cou_id as cou_id,
    c.ca_average AS ca_average,
    a.attendance_percentage AS attendance_percentage,
    CASE 
        WHEN c.ca_status = 'Pass' AND a.attendance_percentage >= 80 THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS eligibility_status
FROM 
    students,attendance_summary a
JOIN 
    ca_summary c ON a.at_st_id = c.st_id;
    
  SELECT * FROM eligibility_checking;
