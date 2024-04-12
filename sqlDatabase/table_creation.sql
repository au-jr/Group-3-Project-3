drop table classification cascade;
drop table countries cascade;
drop table countryclass cascade;
drop table countryid cascade;
drop table population cascade;
drop table avginc cascade;
drop table gdpUSD cascade;
drop table co2total cascade;
drop table co2percap cascade;

create table classification(
	classification_id int primary key,
	classification_label varchar(15) NOT NULL
);

create table countries(
	country varchar(50) primary key
);

create table countryid(
	country_id serial primary key,
	country varchar(50) NOT NULL,
	foreign key (country) references countries(country)
);

create table countryclass(
	country_id int,
	foreign key (country_id) references countryid(country_id),
	classification_id int NOT NULL,
	foreign key (classification_id) references classification(classification_id)
);

create table population(
	country varchar(50) NOT NULL,
	foreign key (country) references countries(country),
	population_2000 bigint NOT NULL,
	population_2001 bigint NOT NULL,
	population_2002 bigint NOT NULL,
	population_2003 bigint NOT NULL,
	population_2004 bigint NOT NULL,
	population_2005 bigint NOT NULL,
	population_2006 bigint NOT NULL,
	population_2007 bigint NOT NULL,
	population_2008 bigint NOT NULL,
	population_2009 bigint NOT NULL,
	population_2010 bigint NOT NULL,
	population_2011 bigint NOT NULL,
	population_2012 bigint NOT NULL,
	population_2013 bigint NOT NULL,
	population_2014 bigint NOT NULL,
	population_2015 bigint NOT NULL,
	population_2016 bigint NOT NULL,
	population_2017 bigint NOT NULL,
	population_2018 bigint NOT NULL,
	population_2019 bigint NOT NULL
);

create table avginc(
	country varchar(50) NOT NULL,
	foreign key (country) references countries(country),
	daily_income_2000 decimal NOT NULL,
	daily_income_2001 decimal NOT NULL,
	daily_income_2002 decimal NOT NULL,
	daily_income_2003 decimal NOT NULL,
	daily_income_2004 decimal NOT NULL,
	daily_income_2005 decimal NOT NULL,
	daily_income_2006 decimal NOT NULL,
	daily_income_2007 decimal NOT NULL,
	daily_income_2008 decimal NOT NULL,
	daily_income_2009 decimal NOT NULL,
	daily_income_2010 decimal NOT NULL,
	daily_income_2011 decimal NOT NULL,
	daily_income_2012 decimal NOT NULL,
	daily_income_2013 decimal NOT NULL,
	daily_income_2014 decimal NOT NULL,
	daily_income_2015 decimal NOT NULL,
	daily_income_2016 decimal NOT NULL,
	daily_income_2017 decimal NOT NULL,
	daily_income_2018 decimal NOT NULL,
	daily_income_2019 decimal NOT NULL
);

create table gdpUSD(
	country varchar(50) NOT NULL,
	foreign key (country) references countries(country),
	gdp_2000 bigint NOT NULL,
	gdp_2001 bigint NOT NULL,
	gdp_2002 bigint NOT NULL,
	gdp_2003 bigint NOT NULL,
	gdp_2004 bigint NOT NULL,
	gdp_2005 bigint NOT NULL,
	gdp_2006 bigint NOT NULL,
	gdp_2007 bigint NOT NULL,
	gdp_2008 bigint NOT NULL,
	gdp_2009 bigint NOT NULL,
	gdp_2010 bigint NOT NULL,
	gdp_2011 bigint NOT NULL,
	gdp_2012 bigint NOT NULL,
	gdp_2013 bigint NOT NULL,
	gdp_2014 bigint NOT NULL,
	gdp_2015 bigint NOT NULL,
	gdp_2016 bigint NOT NULL,
	gdp_2017 bigint NOT NULL,
	gdp_2018 bigint NOT NULL,
	gdp_2019 bigint NOT NULL
);

create table co2total (
	country varchar(50) NOT NULL,
	foreign key (country) references countries(country),
	co2_mnt_2000 decimal NOT NULL,
	co2_mnt_2001 decimal NOT NULL,
	co2_mnt_2002 decimal NOT NULL,
	co2_mnt_2003 decimal NOT NULL,
	co2_mnt_2004 decimal NOT NULL,
	co2_mnt_2005 decimal NOT NULL,
	co2_mnt_2006 decimal NOT NULL,
	co2_mnt_2007 decimal NOT NULL,
	co2_mnt_2008 decimal NOT NULL,
	co2_mnt_2009 decimal NOT NULL,
	co2_mnt_2010 decimal NOT NULL,
	co2_mnt_2011 decimal NOT NULL,
	co2_mnt_2012 decimal NOT NULL,
	co2_mnt_2013 decimal NOT NULL,
	co2_mnt_2014 decimal NOT NULL,
	co2_mnt_2015 decimal NOT NULL,
	co2_mnt_2016 decimal NOT NULL,
	co2_mnt_2017 decimal NOT NULL,
	co2_mnt_2018 decimal NOT NULL,
	co2_mnt_2019 decimal NOT NULL	
);

create table co2percap (
	country varchar(50) NOT NULL,
	foreign key (country) references countries(country),
	co2_pc_tns_2000 decimal NOT NULL,
	co2_pc_tns_2001 decimal  NOT NULL,
	co2_pc_tns_2002 decimal NOT NULL,
	co2_pc_tns_2003 decimal NOT NULL,
	co2_pc_tns_2004 decimal NOT NULL,
	co2_pc_tns_2005 decimal NOT NULL,
	co2_pc_tns_2006 decimal NOT NULL,
	co2_pc_tns_2007 decimal NOT NULL,
	co2_pc_tns_2008 decimal NOT NULL,
	co2_pc_tns_2009 decimal NOT NULL,
	co2_pc_tns_2010 decimal NOT NULL,
	co2_pc_tns_2011 decimal NOT NULL,
	co2_pc_tns_2012 decimal NOT NULL,
	co2_pc_tns_2013 decimal NOT NULL,
	co2_pc_tns_2014 decimal NOT NULL,
	co2_pc_tns_2015 decimal NOT NULL,
	co2_pc_tns_2016 decimal NOT NULL,
	co2_pc_tns_2017 decimal NOT NULL,
	co2_pc_tns_2018 decimal NOT NULL,
	co2_pc_tns_2019 decimal NOT NULL	
);