CREATE PROCEDURE GetMemberRegisterResources()
BEGIN
SELECT id as 'key', title as 'value' from district;
SELECT f.id as 'key', 
CONCAT('(', f.abbreviation, ') ', f.title) as 'value',
JSON_ARRAYAGG(JSON_OBJECT('key',d.id,'value', CONCAT('(',d.abbreviation,') ', d.title))) as 'departments'
FROM valid_pair AS v, front_office AS f, department AS d
WHERE f.id = v.office_id AND d.id = v.department_id
GROUP BY f.id, f.title, f.abbreviation;
SELECT id as 'key', CONCAT('(',abbreviation,') ', title) as 'value' from back_office;
SELECT id as 'key', CONCAT('(',abbreviation,') ', title) as 'value' from role;
END;

CREATE PROCEDURE GetAllTerms()
BEGIN
SELECT 
    title,
    DATE_FORMAT(start_date, "%Y-%m-%d") as startDate,
    DATE_FORMAT(end_date, "%Y-%m-%d") as endDate,
    DATE_FORMAT(newbie_recruitment_date, "%Y-%m-%d") as newbieRecruitmentDate
FROM term;
END;

CREATE PROCEDURE GetAllMembers()
BEGIN
SELECT 
    m.id,
    m.preferred_name,
    m.front_office_id,
    f.abbreviation AS front_office_abbreviation,
    m.department_id,
    d.abbreviation AS department_abbreviation,
    m.role_id, 
    r.abbreviation AS role_abbreviation,
    m.photo_link,
    m.aiesec_email
    FROM member AS m
    LEFT JOIN front_office AS f
    ON f.id = m.front_office_id
    LEFT JOIN department AS d
    ON d.id = m.department_id
    LEFT JOIN role as r
    ON r.id = m.role_id;
END;

CREATE PROCEDURE GetMember(IN id INT(5))
BEGIN
SELECT
    *
FROM
    member
WHERE
    id = id;
END;