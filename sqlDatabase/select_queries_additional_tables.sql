select * from classification;

insert into classification (classification_id, classification_label)
values 
(001, 'developed'),
(002, 'developing'),
(003, 'underdeveloped')
;

select * from countries;

insert into countries (country)
values
('Australia'),
('Japan'),
('Sweden'),
('Switzerland'),
('USA'),
('Brazil'),
('Egypt'),
('Greece'),
('India'),
('South Africa'),
('Afghanistan'),
('Bangladesh'),
('Cambodia'),
('Ethiopia'),
('Senegal')
;

select * from countryid;

insert into countryid (country)
values
('Australia'),
('Japan'),
('Sweden'),
('Switzerland'),
('USA'),
('Brazil'),
('Egypt'),
('Greece'),
('India'),
('South Africa'),
('Afghanistan'),
('Bangladesh'),
('Cambodia'),
('Ethiopia'),
('Senegal')
;

select * from countryclass;

insert into countryclass (country_id, classification_id)
values
(001, 001),
(002, 001),
(003, 001),
(004, 001),
(005, 001),
(006, 002),
(007, 002),
(008, 002),
(009, 002),
(010, 002),
(011, 003),
(012, 003),
(013, 003),
(014, 003),
(015, 003)
;

create view information as
select countryclass.country_id, countryid.country, classification.classification_label, classification.classification_id
from countryid
	inner join countryclass
		on countryclass.country_id = countryid.country_id
	inner join classification 
		on countryclass.classification_id = classification.classification_id;

select * from information;
