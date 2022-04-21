
CONNECT TO cs421;

INSERT INTO mothers(hcnum, mname, email, phone, addr, profession, dob, bloodtype)
VALUES ('GUTV60662214', 'Victoria Gutierrez', 'hendrerit.donec.porttitor@icloud.ca', '(342) 350-8896',
        '8867 Nam Avenue', 'teacher', '1996-12-09', 'A'),
       ('DYEC26258963', 'Clementine Dyer', 'cras.convallis.convallis@google.org', '(147) 760-7774', '6744 Odio Ave',
        'driver', '1984-11-01', 'AB'),
       ('SHEL60052196', 'Leo Shepard', 'pretium.et.rutrum@aol.com', '(268) 282-4377', '191-907 Integer St.',
        'professor', '1993-05-24', 'O'),
       ('TODA70211379', 'Alden Todd', 'diam.dictum@protonmail.com', '(546) 931-6126', '5093 Nam St.', 'painter',
        '1976-05-13', 'O-'),
       ('SNYN51675178', 'Nash Snyder', 'nullam.velit@hotmail.com', '(575) 312-4145', '882-5861 Sed\, St.', 'programmer',
        '1971-06-05', 'O+');


INSERT INTO fathers(fid, fname, phone, profession, dob, bloodtype)
VALUES (4513, 'Margarethe Pymm', '(537) 9438600', 'teacher', '1999-03-28', 'A'),
       (1058, 'Gavra Chotty', '(642) 9887365', 'driver', '1988-07-22', 'AB'),
       (5059, 'Elysia Petrichat', '(414) 3609880', 'professor', '1977-06-04', 'O'),
       (4877, 'Maia Burnyeat', '(516) 7012188', 'painter', '1974-09-16', 'O-'),
       (6945, 'Dwight Danat', '(917) 1152678', 'programmer', '1993-10-23', 'O+');

INSERT INTO couples(cid, hcnum, fid)
VALUES (553, 'GUTV60662214', 4513),
       (885, 'DYEC26258963', 1058),
       (833, 'SHEL60052196', 5059),
       (720, 'TODA70211379', 4877),
       (300, 'SNYN51675178', 6945);

INSERT INTO HcInstitute(hcid, iname, email, phone, addr, website)
VALUES (302, 'Lac-Saint-Louis', 'gbassingden0@tiny.cc', '(920) 2170939', '25308 Arrowood Drive',
        'http://ning.com/id/sapien/in/sapien/iaculis/congue.jpg'),
       (658, 'Institut de Physiatrie', 'cpomphrett1@weather.com', '(776) 6415723', '36 Thompson Court',
        'https://europa.eu/congue/etiam/justo/etiam.html'),
       (377, 'Jaskolski-Beier', 'lgeorgeon2@com.com', '(794) 4662914', '71 Gateway Point',
        'https://barnesandnoble.com/justo/morbi/ut/odio/cras/mi.json'),
       (358, 'McGill Clinic', 'klebarr3@bandcamp.com', '(441) 9660682', '2 Longview Court',
        'https://google.com.br/tristique/in/tempus/sit/amet.png'),
       (961, 'Institut national', 'ralbone4@squarespace.com', '(747) 6965414', '759 Kinsman Terrace',
        'http://home.pl/molestie/nibh/in/lectus/pellentesque/at.aspx'),
       (860, 'Leuschke', 'aviney5@goo.ne.jp', '(615) 7049589', '21010 Boyd Lane',
        'https://cargocollective.com/elementum/ligula/vehicula/consequat.html'),
       (909, 'Borer', 'lfernyhough6@army.mil', '(607) 9166347', '1716 Monica Street',
        'https://linkedin.com/sem.jpg'),
       (295, 'Nikolaus-Lowe', 'vmacsorley7@ucsd.edu', '(417) 9284338', '73454 Kinsman Alley',
        'https://springer.com/morbi/vel/lectus/in/quam.jsp'),
       (365, 'Hagenes-Hintz', 'cmiddis8@discovery.com', '(890) 9535326', '3130 Spaight Way',
        'http://about.com/accumsan/felis/ut/at/dolor.png'),
       (408, 'Corkery', 'valldred9@ucoz.com', '(764) 2157342', '12 Hansons Street',
        'https://addthis.com/sapien/varius/ut/blandit/non/interdum.html');

INSERT INTO midwives(practid, hcid, email, wname, phone)
VALUES (2968, 302, 'dbenedito0@goo.ne.jp', 'Marion Girard', '(117) 8787263'),
       (1414, 302, 'gmissenden1@hatena.ne.jp', 'Gertrud Missenden', '(435) 2731535'),
       (3118, 377, 'oselley2@cpanel.net', 'Ophelia Selley', '(934) 2531309'),
       (7966, 358, 'ploody3@wunderground.com', 'Phedra Loody', '(800) 2407876'),
       (4130, 961, 'bpurse4@blogs.com', 'Burr Purse', '(575) 8136691');

INSERT INTO commclinic(hcid)
VALUES (860),
       (909),
       (295),
       (365),
       (408);

INSERT INTO birthcenter(hcid)
VALUES (302),
       (658),
       (377),
       (358),
       (961);

-- DELETE FROM pregnancies;
-- DELETE FROM babies;
-- DELETE FROM tests;
-- DELETE FROM appointments;
-- DELETE FROM notes;
INSERT INTO pregnancies(pregnum, cid, ppractid, bpractid, hcid, numbabies, exptobym, aptduedate, usoundduedate,
                        finalduedate, homebirth)
VALUES (1, 553, 2968, 1414, 302, 2, '2022-03-01', '2022-03-22', '2022-03-21', '2022-03-21', 'TRUE'),
       (1, 885, 1414, 3118, 658, 1, '2022-07-01', '2022-07-24', '2022-07-25', '2022-07-24', 'FALSE'),
       (1, 833, 3118, 4130, 377, 1, '2022-07-01', '2022-07-06', '2022-07-06', '2022-07-06', 'FALSE'),
       (2, 885, 7966, 2968, 358, 1, '2021-12-01', '2021-12-25', '2021-12-27', '2021-12-25', 'TRUE'),
       (1, 300, 4130, 7966, 961, 2, '2021-12-01', '2021-12-27', '2022-01-01', '2022-01-01', 'FALSE');

-- DELETE FROM babies;
-- DELETE FROM tests;
INSERT INTO babies(babyid, pregnum, cid, bname, bloodtype, dob, birthtime, gender)
VALUES (2725, 1, 553, 'Elbert Hillen', 'A', NULL, '4:21 AM', 'Female'),
       (5745, 1, 885, 'Orville Ranby', 'AB', '2022-03-24', '11:17 PM', 'Male'),
       (2361, 1, 833, 'Gaylord Mitroshinov', 'O', '2022-07-06', '1:40 PM', 'Female'),
       (3758, 1, 300, 'Devondra Witten', 'O-', '2022-01-01', '12:51 AM', 'Female'),
       (6406, 1, 553, 'Inger Pinar', 'O+', NULL, '10:05 PM', 'Female'),
       (4243, 2, 885, 'Kasey Childes', 'A-', NULL, '1:23 PM', 'Male');

INSERT INTO infosessions(sessionid, practid, sdate, stime, langauge)
VALUES (812, 2968, '2021-07-02', '04:56', 'Korean'),
       (413, 1414, '2021-05-01', '17:17', 'French'),
       (776, 3118, '2021-05-18', '07:37', 'English'),
       (944, 7966, '2021-11-03', '19:02', 'Albanian'),
       (993, 4130, '2022-02-10', '03:32', 'Mandarin');

INSERT INTO InfoSessionRegistration(cid, sessionid, attended)
VALUES (553, 812, TRUE),
       (885, 413, TRUE),
       (833, 776, TRUE),
       (720, 944, TRUE),
       (300, 993, TRUE);

INSERT INTO technicians(techid, tname, phone)
VALUES (5294, 'Fair Kohnen', '(810) 2606454'),
       (6319, 'Karlan Blatherwick', '(621) 9268470'),
       (3888, 'Mikkel Allchorne', '(921) 5072153'),
       (8134, 'Sharai Weatherhead', '(694) 2206772'),
       (3980, 'Daphna Graine', '(394) 6313209');

INSERT INTO tests(testid, ttype, results, techid, testdate, prescdate, sampldate, practid, pregnum, cid, babyid)
VALUES (4980, 'blood iron', 'interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et', 5294,
        '2022-01-24', '2022-01-18', '2022-01-18', 2968, 1, 553, 2725),
       (5218, 'urine', 'justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin',
        6319, '2021-05-23', '2021-05-21', '2021-05-21', 1414, 1, 885, 5745),
       (5346, 'blood iron', 'donec semper sapien a libero nam dui proin leo odio porttitor id consequat in', 3888,
        '2021-09-30', '2021-09-07', '2021-09-07', 3118, 1, 833, 2361),
       (8143, 'blood iron', 'enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum', 8134,
        '2021-07-18', '2021-07-17', '2021-07-17', 4130, 1, 300, 3758),
       (2881, 'urine', 'rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis', 3980, '2021-03-16',
        '2021-03-08', '2021-03-08', 2968, 1, 553, 6406),
       (6836, 'blood iron', 'felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet', 5294, '2022-03-01',
        '2022-02-18', '2022-02-18', 1414, 2, 885, 4243),
       (4451, 'aspirin', 'dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum', 6319,
        '2021-07-23', '2021-07-21', '2021-07-21', 2968, 1, 553, 2725),
       (6119, 'blood iron', 'rutrum ac lobortis vel dapibus at diam nam tristique tortor eu pede', 3888, '2022-11-29',
        '2021-11-27', '2021-11-27', 7966, 2, 885, 5745),
       (1419, 'aspirin', 'sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien',
        8134, '2021-11-25', '2021-11-24', '2021-11-24', 3118, 1, 833, 2361),
       (8118, 'urine', 'felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec',
        3980, '2021-04-24', '2021-04-18', '2021-04-18', 4130, 1, 300, 3758);

INSERT INTO appointments(aptid, aptdate, apttime, pregnum, cid, practid, hcid)
VALUES (259, '2022-03-24', '08:22', 1, 553, 2968, 302),
       (806, '2022-02-11', '19:02', 1, 885, 1414, 658),
       (235, '2021-06-01', '01:43', 1, 833, 3118, 377),
       (624, '2021-04-16', '21:48', 1, 300, 4130, 358),
       (102, '2022-03-22', '23:32', 1, 553, 2968, 961),
       (900, '2021-08-28', '03:31', 2, 885, 1414, 302),
       (844, '2021-05-23', '15:37', 1, 553, 2968, 658),
       (293, '2021-07-06', '00:55', 1, 885, 7966, 377),
       (570, '2021-05-16', '01:40', 1, 833, 3118, 358),
       (637, '2021-05-09', '01:22', 1, 300, 4130, 961);

INSERT INTO notes(aptid, tstamp)
VALUES (259, '08:22'),
       (806, '19:02'),
       (235, '01:43'),
       (624, '21:48'),
       (102, '23:32'),
       (900, '03:31'),
       (844, '15:37'),
       (293, '00:55'),
       (570, '01:40'),
       (637, '01:22');