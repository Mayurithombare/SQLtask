
select * from customer
select * from watch_specs
select * from watch



---join 3 table
select * from customer as c
inner join watch_specs as ws
on c.watch_specs_id = ws.watch_specs_id
inner join watch as w
on ws.watch_specs_id = w.watch_specs_id



---join table and use WHERE clause
select * from customer as c
inner join watch_specs as ws
on c.watch_specs_id = ws.watch_specs_id
where cust_id = '16'



---Execute having , group by , order by
---Questions :-show brand along with the product_name whose price is more than 100000
select brand,product_name,price from watch
group by brand,product_name,price
having price > 100000
order by brand



---join tables and execute having and group by function together 
---Question : show the gender_type that have the rolex brand watches  
select   brand , gender_type from watch_specs as ws
inner join customer as c
on c.watch_specs_id = ws.watch_specs_id
group by  brand , gender_type
having brand = 'Rolex' 



---Window function (RANK)
---rank of distinct brand whose stock between 10 and 20
select brand ,stock , rank()
over (partition by brand order by stock desc)
	 from watch
where stock between 10 and 20



---window function (row number)
---calculate number of rows of distinct product_name
select product_name , row_number()
over(partition by product_name)
from watch



---window function (dense_rank)
---dense_rank of distinct brand whose stock between 1 and 10
select brand ,stock , dense_rank()
over (partition by brand order by stock desc)
	 from watch
where stock between 10 and 20



---subquery with where clause
select * from watch where watch_specs_id in (select distinct watch_specs_id from watch where price > 100000)

	
	
---subquery with from clause
---give the rows where movement_type = Automatic or Mechanical
select * from customer as c 
inner join (select * from watch_specs where movement_type ='Automatic' or movement_type ='Mechanical')as ws
on c.watch_specs_id = ws.watch_specs_id
	


---subquery (order by)
select product_id,product_name,(select brand from watch_specs as ws where w.watch_specs_id = ws.watch_specs_id)
from watch as w
order by product_id

---create the table using select query
create table cust_region as
select pincode,city,state,region from customer 

select * from cust_region

select * from cust_region where pincode = '90001'

--to find the total count no. of values
select count (crystal_material) from watch_specs

---to find the distinct no of values
select count (distinct crystal_material) from watch_specs

---find unique count of values from the data
select product_name , count(product_name) from watch 
group by product_name
having count(product_name)=1

---find counts of particular distinct
select product_name , count(product_name) from watch 
group by product_name


---to find no of rows from watch_specs
select count (crystal_material) from watch_specs

---to find distinct values from watch
select count (distinct crystal_material)  from watch_specs

---to find unique values
select crystal_material , count(crystal_material) from watch_specs
group by crystal_material
having count(crystal_material)=1

