-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT
cf_id,
sum(backers_count)
FROM campaign
WHERE outcome = 'live'
GROUP BY 1
ORDER BY 2 DESC;





-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT
cf_id,
count(baker_id)
FROM backers
GROUP BY 1
ORDER BY 2 DESC;

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
DROP TABLE contacts_campaign
CREATE TABLE contacts_campaign
AS
SELECT
first_name,
last_name,
email,
campaign.goal - campaign.pledged as "Remaining Goal Amount"

FROM contacts
JOIN  campaign ON contacts.contact_id = campaign.contact_id
WHERE campaign.outcome = 'live'
ORDER BY 4 DESC
-- Check the table
SELECT * FROM contacts_campaign

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

CREATE TABLE email_backers_remaining_goal_amount
AS
SELECT
email,
last_name,
backers.cf_id as "cf_id",
company_name,
description,
end_date,
campaign.goal - campaign.pledged as "Left of Goal"
FROM backers
JOIN campaign ON backers.cf_id = campaign.cf_id
ORDER BY 1 DESC
-- Check the table
SELECT * FROM email_backers_remaining_goal_amount

