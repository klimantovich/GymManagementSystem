CREATE TABLE IF NOT EXISTS `info`
(
	`username` VARCHAR(200), 
	`password` VARCHAR(500), 
	`name` VARCHAR(100), 
	`prof` INT, 
	`street` VARCHAR(100), 
	`city` VARCHAR(50), 
	`phone` VARCHAR(32),
	`time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
	PRIMARY KEY(`username`)
);

CREATE TABLE IF NOT EXISTS `plans`
(
	`name` VARCHAR(100),
	`exercise` VARCHAR(100),
	`reps` INT,
	`sets` INT,
	PRIMARY KEY(`name`)
);

CREATE TABLE IF NOT EXISTS `receps`
(
	`username` VARCHAR(200), 
	PRIMARY KEY(`username`), 
	FOREIGN KEY(`username`) references `info`(`username`)
);

CREATE TABLE IF NOT EXISTS `trainors`
(
	`username` VARCHAR(200), 
	PRIMARY KEY(`username`), 
	FOREIGN KEY(`username`) references `info`(`username`)
);

CREATE TABLE IF NOT EXISTS `members`
(
	`username` VARCHAR(200), 
	`plan` VARCHAR(100), 
	`trainor` VARCHAR(200), 
	PRIMARY KEY(`username`), 
	FOREIGN KEY(`username`) references `info`(`username`), 
	FOREIGN KEY(`plan`) references `plans`(`name`), 
	FOREIGN KEY(`trainor`) references `trainors`(`username`)
);

CREATE TABLE IF NOT EXISTS `progress`
(
	`username` VARCHAR(200), 
	date DATE, `daily_result` VARCHAR(200), 
	time TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
	PRIMARY KEY(`username`, date), 
	FOREIGN KEY(`username`) references `members`(`username`)
);

CREATE TABLE IF NOT EXISTS `equip`
(
	`name` VARCHAR(100),
	`count` INT,
	PRIMARY KEY(`name`)
);

REPLACE INTO `info`(`username`, `password`, `name`, `prof`, `street`, `city`, `phone`) 
VALUES('admin', '$5$rounds=535000$jlqSxaic6j1Omgdz$Pz/QfrzJP/iNNU36l.1Wm37P.5MD8M7i7I0MVj4e1E5', 
'DB Admin', 1, 'Some avenue 1', 'Chicago', 375258121178);