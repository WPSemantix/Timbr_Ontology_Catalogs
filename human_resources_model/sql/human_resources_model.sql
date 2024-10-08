CREATE OR REPLACE PROPERTY `country` string;
CREATE OR REPLACE PROPERTY `pay_date` date;
CREATE OR REPLACE PROPERTY `review_id` integer;
CREATE OR REPLACE PROPERTY `performance_score` integer;
CREATE OR REPLACE PROPERTY `city` string;
CREATE OR REPLACE PROPERTY `deductions` decimal;
CREATE OR REPLACE PROPERTY `salary` decimal;
CREATE OR REPLACE PROPERTY `scheduled_date` date;
CREATE OR REPLACE PROPERTY `location_id` integer;
CREATE OR REPLACE PROPERTY `training_subject` string;
CREATE OR REPLACE PROPERTY `net_pay` decimal;
CREATE OR REPLACE PROPERTY `manager_id` integer;
CREATE OR REPLACE PROPERTY `training_id` integer;
CREATE OR REPLACE PROPERTY `effective_date` date;
CREATE OR REPLACE PROPERTY `state` string;
CREATE OR REPLACE PROPERTY `first_name` string;
CREATE OR REPLACE PROPERTY `email` string;
CREATE OR REPLACE PROPERTY `amount` decimal;
CREATE OR REPLACE PROPERTY `address` string;
CREATE OR REPLACE PROPERTY `comments` string;
CREATE OR REPLACE PROPERTY `department_id` integer;
CREATE OR REPLACE PROPERTY `department_name` string;
CREATE OR REPLACE PROPERTY `payroll_id` integer;
CREATE OR REPLACE PROPERTY `last_name` string;
CREATE OR REPLACE PROPERTY `hire_date` date;
CREATE OR REPLACE PROPERTY `benefit_type` string;
CREATE OR REPLACE PROPERTY `review_date` date;
CREATE OR REPLACE PROPERTY `employee_id` integer;
CREATE OR REPLACE PROPERTY `reviewer_id` integer;
CREATE OR REPLACE PROPERTY `instructor_id` integer;
CREATE OR REPLACE PROPERTY `phone_number` string;
CREATE OR REPLACE PROPERTY `benefit_id` integer;
CREATE OR REPLACE PROPERTY `benefit_cost` decimal;
CREATE OR REPLACE PROPERTY `status` string;
CREATE OR REPLACE CONCEPT `training_session` (`training_subject` string, `instructor_id` integer, `training_id` integer, `scheduled_date` date, `location_id` integer, PRIMARY KEY (`training_id`), LABEL (`training_subject`), CONSTRAINT `training_instructor` FOREIGN KEY (`instructor_id`) REFERENCES `employee` (`instructor_id`) INVERSEOF `instructor_trainings` , CONSTRAINT `training_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) INVERSEOF `~training_location` ) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-graduation-cap');
CREATE OR REPLACE CONCEPT `performance_review` (`review_date` date, `comments` string, `employee_id` integer, `performance_score` integer, `reviewer_id` integer, `review_id` integer, PRIMARY KEY (`review_id`), LABEL (`review_id`), CONSTRAINT `review_by_reviewer` FOREIGN KEY (`reviewer_id`) REFERENCES `employee` (`employee_id`) INVERSEOF `reviewer_reviews` , CONSTRAINT `review_for_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) INVERSEOF `employee_reviews` ) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-clipboard-check');
CREATE OR REPLACE CONCEPT `payroll_record` (`employee_id` integer, `payroll_id` integer, `amount` decimal, `net_pay` decimal, `pay_date` date, `deductions` decimal, PRIMARY KEY (`payroll_id`), LABEL (`pay_date`), CONSTRAINT `payroll_for_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) INVERSEOF `employee_payrolls` ) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-money-check-dollar');
CREATE OR REPLACE CONCEPT `location` (`state` string, `address` string, `city` string, `country` string, `location_id` integer, PRIMARY KEY (`location_id`), LABEL (`address`)) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-location-dot');
CREATE OR REPLACE CONCEPT `employee_benefit` (`employee_id` integer, `effective_date` date, `benefit_id` integer, `benefit_cost` decimal, `benefit_type` string, PRIMARY KEY (`benefit_id`), LABEL (`benefit_type`), CONSTRAINT `benefit_for_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) INVERSEOF `employee_benefits` ) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-gift');
CREATE OR REPLACE CONCEPT `employee` (`employee_id` integer, `phone_number` string, `manager_id` integer, `instructor_id` integer, `status` string, `department_id` integer, `last_name` string, `salary` decimal, `email` string, `hire_date` date, `first_name` string, PRIMARY KEY (`employee_id`), LABEL (`first_name`), CONSTRAINT `employee_department` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) INVERSEOF `department_employees` , CONSTRAINT `employee_manager` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`employee_id`) INVERSEOF `manager_subordinates` ) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-user-tie');
CREATE OR REPLACE CONCEPT `department` (`department_id` integer, `department_name` string, `location_id` integer, PRIMARY KEY (`department_id`), LABEL (`department_name`), CONSTRAINT `department_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) INVERSEOF `location_departments` ) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-building');