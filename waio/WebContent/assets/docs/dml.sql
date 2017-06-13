
create table fees(

id int (18),
training_type char(100),
fees int(18),
updated date

);

alter table fees add primary key (id);

create table paid_fees (

id int (18),
fees_id int(18),
profile_id int(18),
fees int(18),
created date

);

alter table paid_fees add primary key (id);

ALTER TABLE paid_fees
ADD FOREIGN KEY (fees_id)
REFERENCES fees(id);


ALTER TABLE paid_fees
ADD FOREIGN KEY (profile_id)
REFERENCES profile(id);

insert into fees (id, training_type ,fees, updated) values (1,'Corprate Java',20000, current_timestamp); 

insert into paid_fees (id, fees_id,profile_id, fees, created) values (1,1,1,1000, current_timestamp); 

insert into paid_fees (id, fees_id,profile_id, fees, created) values (2,1,1,5000, current_timestamp); 






