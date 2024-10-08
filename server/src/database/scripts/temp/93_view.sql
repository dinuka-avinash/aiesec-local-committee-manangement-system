USE LC_KANDY;

--oGV
CREATE VIEW OGVApplicantDetailsInBrief AS
SELECT 
    o.id,
    o.firstName,
    o.lastName,
    o.status,
    o.phone,
    o.campaignId,
    m.preferredName AS memberInCharge
FROM 
    ogv_applicants o
LEFT JOIN 
    member m ON o.memberInChargeId = m.id;


CREATE VIEW OGVDetailsForSendReminders AS
SELECT 
    o.id,
    o.firstName,
    o.lastName,
    o.phone,
    o.campaignId,
    m.preferredName AS memberName,
    m.email AS memberEmail
FROM 
    ogv_applicants o
LEFT JOIN 
    member m ON o.memberInChargeId = m.id
WHERE
    o.status = 'Pre-Signup';

--oGT
CREATE VIEW OGTApplicantDetailsInBrief AS
SELECT 
    o.id,
    o.firstName,
    o.lastName,
    o.status,
    o.phone,
    o.campaignId,
    m.preferredName AS memberInCharge
FROM 
    ogt_applicants o
LEFT JOIN 
    member m ON o.memberInChargeId = m.id;

CREATE VIEW OGTDetailsForSendReminders AS
SELECT 
    o.id,
    o.firstName,
    o.lastName,
    o.phone,
    o.campaignId,
    m.preferredName AS memberName,
    m.email AS memberEmail
FROM 
    ogt_applicants o
LEFT JOIN 
    member m ON o.memberInChargeId = m.id
WHERE
    o.status = 'Pre-Signup';