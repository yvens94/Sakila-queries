
#Which actors have the first name ‘Scarlett’
select *
from actor where  first_name ="scarlett";

#Which actors have the last name ‘Johansson’
select *
from actor where  last_name ="johansson";

#How many distinct actors last names are there?
select count(distinct ( last_name)) as NumberOfDiffLastName
from actor;

#Which last names are not repeated?
select E.last_name, E.numbLastname
from
	(select last_name, count(last_name) as numbLastname
		from actor
		group by last_name) E
where numbLastname = 1;

#Which last names appear more than once?
select E.last_name, E.numbLastname
from
	(select last_name, count(last_name) as numbLastname
		from actor
		group by last_name) E
where numbLastname <>1
order by numbLastname;

#Which actor has appeared in the most films?

select actor_id, E.numbID, last_name, first_name
from
	(select count(fi.actor_id) as numbID, fi.actor_id, act.first_name, act.last_name
		from film_actor fi join actor act on fi.actor_id =act.actor_id
		group by actor_id)E
order by numbID desc;




select  film_id
from film_actor
where actor_id = 27;

select actor.actor_id, actor.first_name, actor.last_name,
       count(actor_id) as film_count
from actor join film_actor using (actor_id)
group by actor_id
order by film_count desc
limit 1;

select inventory.store_id, film.film_id, film.title #(inventory.inventory_id)   
from film join inventory on film.film_id=inventory.film_id

where title = "academy dinosaur" and store_id = 1;

#Insert a record to represent Mary Smith renting ‘Academy Dinosaur’ from Mike Hillyer at Store 1 today .
insert into rental(rental_date, inventory_id, customer_id, staff_id, last_update)
	values(now(), 1, 1,1,now());
    
#When is ‘Academy Dinosaur’ due?
select R.rental_id,R.inventory_id, I.film_id, f.title, R.return_date
from rental AS R 
	join inventory I on R.inventory_id = I.inventory_id

	Join film as F on I.film_id = F. film_id

Where title = 'academy dinosaur' and store_id = 1;
	



#What is that average running time of all the films in the sakila DB?
Select avg(length) as avg_l
from film;

Select avg(Fi.length) as avg_l, CAT.name
from film Fi
join film_category Fi_CAT using (film_id)
join category CAT using (category_id)
group by CAT.name
order by avg_l desc;

select * from film natural join inventory ;


select distinct(film_actor.actor_id), actor.first_name, actor.Last_name
from actor join film_actor using (actor_id)
where film_actor.actor_id  in (  
					select film_actor.actor_id 
                    from  film_actor
                    join film_category  using (film_id)
					join category using (category_id)
                    where category.name= "action"
					)				


                    ;


select distinct (actor.actor_id), actor.first_name, actor.Last_name,category.name
from actor 
join film_actor using (actor_id)
join film_category  using (film_id)
join category  using (category_id)
where name = "action"
order by actor_id



        















select inventory.store_id, film.film_id, count(inventory.inventory_id) as number_avail,  film.title  from film join inventory on film.film_id=inventory.film_id  where title = "academy dinosaur" and store_id = 1 #group by title LIMIT 0, 1000
