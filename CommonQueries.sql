
--to get everything from a table
SELECT * FROM tech;

--#1
--What are all projects that use JavaScript?
--Javascript id is 3
--select all project id's associated with tech id 3

SELECT
  tech_id, project_id
FROM
  project_uses_tech
WHERE
  tech_id = 3;

--result: none

--#2
--What are all technologies used by the Personal Website?
--Personal Website id is 4
--select all tech id's associated with project id 4

SELECT
  project_id,tech_id
FROM
  project_uses_tech
WHERE
  project_id = 4;

--result: 1, 2 (HTML, CSS)

--#3
--Perform a left outer join from the tech table to the project_uses_tech table - which techs has no associated project?

SELECT
  *
FROM
  tech
LEFT OUTER JOIN
  project_uses_tech
ON
  project_uses_tech.tech_id = tech.id

-- 8	Ruby
-- 3	JavaScript
-- 7	Java
-- 12	Pickle	10	12
-- 11	File IO	10	11
-- 10	Objects	8	10
-- 10	Objects	9	10
-- 9	Bootstrap	3	9
-- 6	PyGame	9	6
-- 5	Turtle Graphics	11	5
-- 4	Python	8	4
-- 4	Python	9	4
-- 4	Python	10	4
-- 4	Python	11	4
-- 2	CSS	1	2
-- 2	CSS	2	2
-- 2	CSS	3	2
-- 2	CSS	4	2
-- 2	CSS	5	2
-- 2	CSS	6	2
-- 1	HTML	1	1
-- 1	HTML	2	1
-- 1	HTML	3	1
-- 1	HTML	4	1
-- 1	HTML	5	1
-- 1	HTML	6	1

--#4
--Based on the previous query, get the count of the number of techs used by each project.

SELECT
  tech.name, count(project_uses_tech)
FROM
  tech
LEFT OUTER JOIN
  project_uses_tech
ON
  project_uses_tech.tech_id = tech.id
GROUP BY
  tech.id

-- Ruby	0
-- JavaScript	0
-- Java	0
-- PyGame	1
-- Pickle	1
-- File IO	1
-- Turtle Graphics	1
-- Bootstrap	1
-- Objects	2
-- Python	4
-- HTML	6
-- CSS	6

--#5
--Perform a left outer join from the project table to the project_users_tech table - which projects has no associated tech?
SELECT
  name, count(tech_id)
FROM
  project
LEFT OUTER JOIN
  project_uses_tech
ON
  project_uses_tech.project_id = project.id
GROUP BY
  project.name

-- Catch the Monster Game	3
-- Mozilla Front Page	3
-- Phone Book	3
-- Personal Website	2
-- Turtle Graphics Exercises	2
-- Modal Dialog	2
-- RPG Hero Game	2
-- Medium Blog Layout	2
-- School Bus	2
-- CSS Tricks Blog Layout	2
-- Whiteboard Exercises	0
