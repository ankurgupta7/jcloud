delimiter //
DROP PROCEDURE IF EXISTS ShowAllUsers //
CREATE PROCEDURE ShowAllUsers()
BEGIN
SELECT u.Name as Name, g.name as Gender, u.age as Age, a.name as Location
FROM users u, gender g, area a
WHERE u.gender = g.id and u.area = a.id;
END//

DROP PROCEDURE IF EXISTS ShowUserLikes //
CREATE PROCEDURE ShowUserLikes(IN id int)
BEGIN
SELECT t.Name, t.id
FROM users u, likes l, track t
WHERE u.id = l.user_id and l.track_id = t.id and u.id = id;
END//

DROP PROCEDURE IF EXISTS ShowUserListeningHistory//
CREATE PROCEDURE ShowUserListeningHistory(IN id int)
BEGIN
SELECT distinct t.Name, t.id
FROM users u, listening_history l, track t
WHERE u.id = l.user_id and l.track_id = t.id and u.id = id;
END//

DROP PROCEDURE IF EXISTS ShowSongsBought//
CREATE PROCEDURE ShowSongsBought(IN id int)
BEGIN
SELECT distinct t.Name, t.id
FROM users u, ownership o, track t
WHERE u.id = o.user_id and o.track_id = t.id and u.id = id and o.type='BOUGHT';
END//

DROP PROCEDURE IF EXISTS ShowSongsRent//
CREATE PROCEDURE ShowSongsRent(IN id int)
BEGIN
SELECT distinct t.Name, t.id
FROM users u, ownership o, track t
WHERE u.id = o.user_id and o.track_id = t.id and u.id = id and o.type='RENT';
END//

DROP PROCEDURE IF EXISTS ShowTotalSpent//
CREATE PROCEDURE ShowTotalSpent(IN id int)
BEGIN
SELECT IFNULL(SUM(t.price),0) as 'Total $ Spent'
FROM users u, transaction t
WHERE u.id = t.user_id and u.id = id;
END//

DROP PROCEDURE IF EXISTS ShowTotalSpentAll//
CREATE PROCEDURE ShowTotalSpentAll()
BEGIN 
SELECT IFNULL(SUM(t.price),0) as 'Total $ Spent' 
FROM users u, transaction t
 WHERE u.id = t.user_id; END//

DROP PROCEDURE IF EXISTS ShowAvgSpentAll//
CREATE PROCEDURE ShowAvgSpentAll()
BEGIN
SELECT IFNULL(round(Avg(t.price),2),0.00) as 'Avgl $ Spent'
FROM users u, transaction t
WHERE u.id = t.user_id;
END//

DROP PROCEDURE IF EXISTS ShowUserPlaylist//
CREATE PROCEDURE ShowUserPlaylist(IN id int)
BEGIN
SELECT distinct p.list_id
FROM users u, user_playlist p
WHERE u.id = p.user_id and u.id = id;
END//

DROP PROCEDURE IF EXISTS ShowUserFollows//
CREATE PROCEDURE ShowUserFollows(IN id int)
BEGIN
SELECT distinct a.name
FROM users u, follows f, artist a
WHERE u.id = f.user_id and f.artist_id = a.id and u.id = id;
END//



DROP PROCEDURE IF EXISTS ShowUserPlaylist//
CREATE PROCEDURE ShowUserPlaylist(IN userid int, IN LLIM int, IN ULIM int)
BEGIN

select p.list_id, t.name as title, t.length 
from user_playlist p 
LEFT JOIN track t
ON p.track_id = t.id
where p.user_id=userid
ORDER BY p.list_id
-- and p.list_id=playlistid
-- LIMIT ULIM OFFSET LLIM;
-- LIMIT  @LLIM, @ULIM
;

END//

-- all transcations with user names and title names
DROP PROCEDURE IF EXISTS ShowTransactions//
CREATE PROCEDURE ShowTransactions()
BEGIN


select tran.tid as transaction_id, tran.track_id, t.name as title, tran.user_id, u.name as user, tran.payment_method , tran.price
from transaction tran  left join users u on tran.user_id=u.id
left join track t on t.id = tran.track_id
;

END//


-- list songs by each artist with his info

DROP PROCEDURE IF EXISTS ShowArtistInfo//
CREATE PROCEDURE ShowArtistInfo(IN aid INT)
BEGIN

select art.id as artist_id, art.name as artist_name, art.begin_date as artist_begin_date, art.end_date as artist_end_date,
atype.name as artist_type, area.name as area, g.name as gender_t
from (
		select a.id, a.name, CONCAT(a.begin_date_day, '/', a.begin_date_month , '/', a.begin_date_year) as begin_date, CONCAT(a.end_date_day, '/', a.end_date_month , '/', a.end_date_year) as end_date, a.type, a.gender, a.area
		from artist as a 
		where a.id=aid 	) as art, 
area, artist_type as atype, gender as g
where atype.id=art.type 
and g.id = art.gender
and area.id=art.area
;
END//


DROP PROCEDURE IF EXISTS ShowArtistInfoName//
CREATE PROCEDURE ShowArtistInfoName(IN aname VARCHAR(100))
BEGIN

select art.id as artist_id, art.name as artist_name, art.begin_date as artist_begin_date, art.end_date as artist_end_date,
atype.name as artist_type, area.name as area, g.name as gender_t
from (
		select a.id, a.name, CONCAT(a.begin_date_day, '/', a.begin_date_month , '/', a.begin_date_year) as begin_date, CONCAT(a.end_date_day, '/', a.end_date_month , '/', a.end_date_year) as end_date, a.type, a.gender, a.area
		from artist as a 
		where a.name=aname 	) as art, 
area, artist_type as atype, gender as g
where atype.id=art.type 
and g.id = art.gender
and area.id=art.area
;
END//




delimiter ;


-- call ShowUserPlaylist(1,1,100);

-- call ShowTransactions();
call ShowArtistInfoName('John Mayer');
