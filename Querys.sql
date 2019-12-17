-- 1)Получить список и общее число туристов, занимающихся в клубе, 
-- SELECT *, count(id) FROM tour_club.Tourist;
-- в указанной секции, группе, 
-- SELECT t.*, count(t.id) FROM tour_club.Tourist t
-- INNER JOIN tour_club.tourist_to_group ttg ON ttg.tourist_id = t.id
-- INNER JOIN tour_club.Groups g ON g.id = ttg.group_id
-- WHERE g.id = 1; -- group number 1 OR g.section_id = 1 - section number 1
-- по половому признаку, 
-- SELECT t.*, count(t.id) FROM tour_club.Tourist t
-- WHERE t.sex = 'male';
--  года в возрасте.
-- SELECT t.*, count(t.id) FROM tour_club.Tourist t
-- WHERE t.age <= 25;

-- 2)Получить список и общее число тpенеpов указанной секции по всем секциям, по половому признаку, 
-- по возрасту, по pазмеpу заработной платы, специализации

-- SELECT t.*, COUNT(t.id) FROM tour_club.Trainers t
-- INNER JOIN tour_club.Groups g ON g.trainer_id = t.id -- all sections
-- WHERE g.section_id = 1; -- only for first section
-- ORDER BY t.age -- sort by age
-- ORDER BY t.salary -- sort by salary
-- ORDER BY t.specilization -- sort by specilization

-- 3)Получить перечень и общее число соревнований, в которых принимали участие спортсмены
--  из указанной секци по всем секциям

-- SELECT *, COUNT(c.id) FROM tour_club.Competention c 
-- JOIN tour_club.participation_to_competention ptc ON ptc.compentention_id = c.id
-- JOIN tour_club.Tourist t ON t.id = ptc.tourist_id
-- JOIN tour_club.tourist_to_group ttg ON ttg.tourist_id = ptc.tourist_id
-- JOIN tour_club.Groups g ON g.id = ttg.group_id
-- WHERE t.sportsman = 1
-- AND
-- g.section_id = 1 -- where section = 1
-- without and return all section

-- 4)Получить список тpенеpов, которые проводили тренировки в указанной группе
-- SELECT * FROM tour_club.Trainers t
-- JOIN tour_club.Groups g ON g.trainer_id = t.id
-- WHERE g.id = 1; -- return list trainers for first group
-- а указанный период времени
-- JOIN tour_club.Timetable tt ON tt.group_id = g.id
-- WHERE tt.start_at = 2019-06-03 AND tt.end_at = 2019-06-04;


-- 6)Получить перечень руководителей секций полностью, по pазмеpу заработной платы, 
-- по году рождения, возрасту, годом поступления на работу.
-- SELECT * FROM tour_club.Heads
-- ORDER BY age; -- dob, salary, started_at

-- 7)Получить нагрузки тpенеpов (вид занятий, количество часов), ее объем по определенным видам занятий
--  и общую нагрузку за указанный период времени для данного тpенеpу или указанной секции.

-- SELECT s.name_section, TIMEDIFF(tt.start_at, tt.end_at) FROM tour_club.Timetable tt
-- JOIN tour_club.Section s ON s.id = tt.section_id
-- JOIN tour_club.Groups g ON g.id = tt.group_id
-- WHERE g.trainer_id = 1 OR s.id = 2;-- for trainer 1 or section number 2

-- 8)Получить перечень и общее число маpшpутов, по которым ходили туристы из указанной секции, 
-- в указанный период времени, по которым водили свои группы данный инстpуктоp,
-- по которым прошли указанное количество групп.

-- SELECT r.*, count(r.id) FROM tour_club.Routes r
-- JOIN tour_club.Hikes h ON h.route_id = r.id
-- JOIN tour_club.Timetable tt ON tt.hikes_id = h.id
-- WHERE tt.start_at = your_date AND tt.end_at = your_date; -- where your_date (date from and to)
-- AND h.instructor_id = 1 --- where first instructor

-- 12. Получить список туристов с указанной секции, группы, ходили в походы со своим тренером в качестве инстpуктоpа.

-- SELECT * FROM tour_club.Groups g
-- JOIN tour_club.Hikes h ON h.instructor_id = g.trainer_id
-- JOIN tour_club.Section s ON s.id = g.section_id
-- WHERE s.id = 1; -- return tourist list, which go on hikes with their trainker in role instructor, from first section

-- 13. Получить список туристов с некоторой секции, группы, которые ходили по всем маpшpутам, по указанным маpшpутам. 

-- SELECT * FROM tour_club.Tourist t
-- JOIN tour_club.tourist_to_group ttg ON ttg.tourist_id = t.id
-- JOIN tour_club.Groups g ON g.id = ttg.group_id
-- JOIN tour_club.participant_to_hikes pth ON pth.tourist_id = t.id
-- WHERE g.section_id = 1; -- OR g.id = 1 -- first section or first group
-- WHERE pth.hikes_id = 1 -- select tourist which was on first hike
-- WHERE pth.hikes_id IN (SELECT id FROM tour_club.Hikes); -- select tourist which was on all hikes
