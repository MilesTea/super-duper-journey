--1
select g.name, count(s.name) from genres g
join genres_singers gs on g.id = gs.genre_id 
join singers s on gs.singer_id = s.id 
group by g.name
order by count(s.name) desc

--2
select count(s.id) from collections c 
join songs_collections sc on c.id = sc.collection_id 
join songs s on sc.song_id = s.id 
where c.publication_year between 2019 and 2020

--3
select a.name, avg(s.duration) from albums a 
join songs s on a.id = s.album_id 
group by a.name
order by avg(s.duration) desc

--4
select s.name from singers s 
join singers_albums sa on s.id = sa.singer_id
join albums a on sa.album_id = a.id 
where a.publication_year != 2020
group by s.name

--5
select c.name from collections c 
join songs_collections sc on c.id = sc.collection_id 
join songs so on sc.song_id = so.id 
join albums a on so.album_id = a.id
join singers_albums sa on a.id = sa.album_id 
join singers si on sa.singer_id = si.id 
where si.name = 'Zebrahead'
group by c.name

--6 
select a.name from albums a 
join singers_albums sa on a.id = sa.album_id 
join singers s on sa.singer_id = s.id 
join genres_singers gs on s.id = gs.singer_id 
join genres g on gs.genre_id = g.id 
group by a.name
having count(g.id) > 1

--7
select s.name from songs s 
left join songs_collections sc on s.id = sc.song_id
where sc.collection_id is null

--8
select si.name, min(so.duration) from singers si
join singers_albums sa on si.id = sa.singer_id 
join albums a on sa.album_id = a.id 
join songs so on a.id = so.album_id 
group by si.name
having min(so.duration) = (select min(so.duration) from songs so)
order by min(so.duration)

--9
select a.name from albums a 
join songs s on a.id = s.album_id 
group by a.name
having count(s.id) = (
	select count(s.id) from songs s
	join albums a on a.id = s.album_id 
	group by a.id 
	order by count(s.id)
	limit 1
	)
