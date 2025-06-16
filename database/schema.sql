CREATE DATABASE IF NOT EXISTS bug_tracker_sys_db;
USE bug_tracker_sys_db;


CREATE Table IF NOT EXISTS ADMINS(
admin_id int PRIMARY KEY AUTO_INCREMENT,
admin_name varchar(100),
admin_username varchar(100) UNIQUE,
admin_email varchar(255) NOT NULL,
admin_password varchar(20)
);

CREATE Table IF NOT EXISTS Tester(
tester_id int PRIMARY KEY AUTO_INCREMENT,
tester_name varchar(100),
tester_username varchar(100) UNIQUE,
tester_email varchar(255) NOT NULL,
tester_password varchar(20)
);

CREATE Table IF NOT EXISTS Developer(
developer_id int PRIMARY KEY AUTO_INCREMENT,
developer_name varchar(100),
developer_username varchar(100) UNIQUE,
developer_email varchar(255) NOT NULL,
developer_password varchar(20)
);

 
CREATE Table IF NOT EXISTS Project(
project_id int PRIMARY KEY AUTO_INCREMENT,
project_name varchar(100),
project_status ENUM('inactive', 'active') DEFAULT 'active',
created_by int,
FOREIGN KEY (created_by) REFERENCES admins(admin_id)
);

CREATE Table IF NOT EXISTS Module(
module_id int PRIMARY KEY AUTO_INCREMENT,
module_name varchar(100),
module_status ENUM('inactive', 'active') DEFAULT 'active',
project_id int,
FOREIGN KEY (project_id) REFERENCES project(project_id)
);


CREATE Table IF NOT EXISTS BugTypeMaster(
BugType_id int PRIMARY KEY AUTO_INCREMENT,
BugType_name varchar(100),
BugType_description text,
BugType_status ENUM('inactive', 'active') DEFAULT 'active'
);

CREATE Table IF NOT EXISTS Issues(
issue_id int PRIMARY KEY AUTO_INCREMENT,
issue_description TEXT NOT NULL,
steps_to_reproduce TEXT,
source_url VARCHAR(255),
priority ENUM('Low', 'Mid', 'High'),
attachment_path VARCHAR(255),
added_on DATETIME DEFAULT CURRENT_TIMESTAMP,
issue_status ENUM('New', 'InProgress', 'Resolved', 'Reopen', 'Closed', 'Not a Bug', 'Hold') DEFAULT 'New',
issue_remark TEXT,
project_id INT,
module_id INT,
bugType_id INT,
added_by INT,
FOREIGN KEY (project_id) REFERENCES Project(project_id),
FOREIGN KEY (module_id) REFERENCES Module(module_id),
FOREIGN KEY (bugType_id) REFERENCES BugTypeMaster(bugType_id),
FOREIGN KEY (added_by) REFERENCES Tester(tester_id)
);
--copy and paste in same seq