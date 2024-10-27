SELECT 
    FilteredJobs.id AS `Jobs__id`,
    FilteredJobs.name AS `Jobs__name`,
    FilteredJobs.media_id AS `Jobs__media_id`,
    FilteredJobs.job_category_id AS `Jobs__job_category_id`,
    FilteredJobs.job_type_id AS `Jobs__job_type_id`,
    FilteredJobs.description AS `Jobs__description`,
    FilteredJobs.detail AS `Jobs__detail`,
    FilteredJobs.business_skill AS `Jobs__business_skill`,
    FilteredJobs.knowledge AS `Jobs__knowledge`,
    FilteredJobs.location AS `Jobs__location`,
    FilteredJobs.activity AS `Jobs__activity`,
    FilteredJobs.academic_degree_doctor AS `Jobs__academic_degree_doctor`,
    FilteredJobs.academic_degree_master AS `Jobs__academic_degree_master`,
    FilteredJobs.academic_degree_professional AS `Jobs__academic_degree_professional`,
    FilteredJobs.academic_degree_bachelor AS `Jobs__academic_degree_bachelor`,
    FilteredJobs.salary_statistic_group AS `Jobs__salary_statistic_group`,
    FilteredJobs.salary_range_first_year AS `Jobs__salary_range_first_year`,
    FilteredJobs.salary_range_average AS `Jobs__salary_range_average`,
    FilteredJobs.salary_range_remarks AS `Jobs__salary_range_remarks`,
    FilteredJobs.restriction AS `Jobs__restriction`,
    FilteredJobs.estimated_total_workers AS `Jobs__estimated_total_workers`,
    FilteredJobs.remarks AS `Jobs__remarks`,
    FilteredJobs.url AS `Jobs__url`,
    FilteredJobs.seo_description AS `Jobs__seo_description`,
    FilteredJobs.seo_keywords AS `Jobs__seo_keywords`,
    FilteredJobs.sort_order AS `Jobs__sort_order`,
    FilteredJobs.publish_status AS `Jobs__publish_status`,
    JobCategories.name AS `JobCategories__name`,
    JobTypes.name AS `JobTypes__name`
FROM 
    (
        SELECT 
            Jobs.id, Jobs.name, Jobs.media_id, Jobs.job_category_id, Jobs.job_type_id, 
            Jobs.description, Jobs.detail, Jobs.business_skill, Jobs.knowledge, Jobs.location, 
            Jobs.activity, Jobs.academic_degree_doctor, Jobs.academic_degree_master, 
            Jobs.academic_degree_professional, Jobs.academic_degree_bachelor, 
            Jobs.salary_statistic_group, Jobs.salary_range_first_year, Jobs.salary_range_average, 
            Jobs.salary_range_remarks, Jobs.restriction, Jobs.estimated_total_workers, Jobs.remarks, 
            Jobs.url, Jobs.seo_description, Jobs.seo_keywords, Jobs.sort_order, Jobs.publish_status
        FROM 
            jobs Jobs
        WHERE 
            (JobCategories.name LIKE '%キャビンアテンダント%'
            OR JobTypes.name LIKE '%キャビンアテンダント%'
            OR Jobs.name LIKE '%キャビンアテンダント%'
            OR Jobs.description LIKE '%キャビンアテンダント%'
            OR Jobs.detail LIKE '%キャビンアテンダント%'
            OR Jobs.business_skill LIKE '%キャビンアテンダント%'
            OR Jobs.knowledge LIKE '%キャビンアテンダント%'
            OR Jobs.location LIKE '%キャビンアテンダント%'
            OR Jobs.activity LIKE '%キャビンアテンダント%'
            OR Jobs.salary_statistic_group LIKE '%キャビンアテンダント%'
            OR Jobs.salary_range_remarks LIKE '%キャビンアテンダント%'
            OR Jobs.restriction LIKE '%キャビンアテンダント%'
            OR Jobs.remarks LIKE '%キャビンアテンダント%'
            OR Personalities.name LIKE '%キャビンアテンダント%'
            OR PracticalSkills.name LIKE '%キャビンアテンダント%'
            OR BasicAbilities.name LIKE '%キャビンアテンダント%'
            OR Tools.name LIKE '%キャビンアテンダント%'
            OR CareerPaths.name LIKE '%キャビンアテンダント%'
            OR RecQualifications.name LIKE '%キャビンアテンダント%'
            OR ReqQualifications.name LIKE '%キャビンアテンダント%')
            AND Jobs.publish_status = 1
            AND Jobs.deleted IS NULL
        LIMIT 50
    ) AS FilteredJobs
INNER JOIN job_categories JobCategories ON JobCategories.id = FilteredJobs.job_category_id AND JobCategories.deleted IS NULL
INNER JOIN job_types JobTypes ON JobTypes.id = FilteredJobs.job_type_id AND JobTypes.deleted IS NULL
LEFT JOIN jobs_personalities JobsPersonalities ON FilteredJobs.id = JobsPersonalities.job_id
LEFT JOIN personalities Personalities ON Personalities.id = JobsPersonalities.personality_id AND Personalities.deleted IS NULL
LEFT JOIN jobs_practical_skills JobsPracticalSkills ON FilteredJobs.id = JobsPracticalSkills.job_id
LEFT JOIN practical_skills PracticalSkills ON PracticalSkills.id = JobsPracticalSkills.practical_skill_id AND PracticalSkills.deleted IS NULL
LEFT JOIN jobs_basic_abilities JobsBasicAbilities ON FilteredJobs.id = JobsBasicAbilities.job_id
LEFT JOIN basic_abilities BasicAbilities ON BasicAbilities.id = JobsBasicAbilities.basic_ability_id AND BasicAbilities.deleted IS NULL
LEFT JOIN jobs_tools JobsTools ON FilteredJobs.id = JobsTools.job_id
LEFT JOIN affiliates Tools ON Tools.type = 1 AND Tools.id = JobsTools.affiliate_id AND Tools.deleted IS NULL
LEFT JOIN jobs_career_paths JobsCareerPaths ON FilteredJobs.id = JobsCareerPaths.job_id
LEFT JOIN affiliates CareerPaths ON CareerPaths.type = 3 AND CareerPaths.id = JobsCareerPaths.affiliate_id AND CareerPaths.deleted IS NULL
LEFT JOIN jobs_rec_qualifications JobsRecQualifications ON FilteredJobs.id = JobsRecQualifications.job_id
LEFT JOIN affiliates RecQualifications ON RecQualifications.type = 2 AND RecQualifications.id = JobsRecQualifications.affiliate_id AND RecQualifications.deleted IS NULL
LEFT JOIN jobs_req_qualifications JobsReqQualifications ON FilteredJobs.id = JobsReqQualifications.job_id
LEFT JOIN affiliates ReqQualifications ON ReqQualifications.type = 2 AND ReqQualifications.id = JobsReqQualifications.affiliate_id AND ReqQualifications.deleted IS NULL
INNER JOIN job_categories JobCategories ON JobCategories.id = FilteredJobs.job_category_id AND JobCategories.deleted IS NULL
INNER JOIN job_types JobTypes ON JobTypes.id = FilteredJobs.job_type_id AND JobTypes.deleted IS NULL
ORDER BY 
    FilteredJobs.sort_order DESC, FilteredJobs.id DESC;
