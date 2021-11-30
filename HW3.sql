create table if not exists genres (
	id serial primary key,
	name varchar(40) not null unique
);
create table if not exists singers (
	id serial primary key,
	name varchar(40) not null unique
);
create table if not exists genres_singers (
	genre_id integer references genres(id),
	singer_id integer references singers(id),
	constraint genres_singers_pk primary key (genre_id, singer_id)
);
create table if not exists albums (
	id serial primary key,
	name varchar(40) not null,
	publication_year integer not null
);
create table if not exists singers_albums (
	singer_id integer references singers(id),
	album_id integer references albums(id),
	constraint singers_albums_pk primary key (singer_id, album_id)
);
create table if not exists songs (
	id serial primary key,
	name varchar(40) not null,
	duration time not null, 
	album_id integer references albums(id)
);
create table if not exists collections (
	id serial primary key,
	name varchar(40) not null,
	publication_year integer not null
);
create table if not exists songs_collections (
	song_id integer references songs(id),
	collection_id integer references collections(id),
	constraint songs_collections_pk primary key (song_id, collection_id)
);
