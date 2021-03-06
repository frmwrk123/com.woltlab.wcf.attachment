DROP TABLE IF EXISTS wcf1_attachment;
CREATE TABLE wcf1_attachment (
	attachmentID INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	objectTypeID INT(10) NOT NULL,
	objectID INT(10),
	userID INT(10),
	tmpHash VARCHAR(40) NOT NULL DEFAULT '',
	filename VARCHAR(255) NOT NULL DEFAULT '',
	filesize INT(10) NOT NULL DEFAULT 0,
	fileType VARCHAR(255) NOT NULL DEFAULT '',
	fileHash VARCHAR(40) NOT NULL DEFAULT '',
	
	isImage TINYINT(1) NOT NULL DEFAULT 0,
	width SMALLINT(5) NOT NULL DEFAULT 0,
	height SMALLINT(5) NOT NULL DEFAULT 0, 
	
	tinyThumbnailType VARCHAR(255) NOT NULL DEFAULT '',
	tinyThumbnailSize INT(10) NOT NULL DEFAULT 0,
	tinyThumbnailWidth SMALLINT(5) NOT NULL DEFAULT 0,
	tinyThumbnailHeight SMALLINT(5) NOT NULL DEFAULT 0,
	
	thumbnailType VARCHAR(255) NOT NULL DEFAULT '',
	thumbnailSize INT(10) NOT NULL DEFAULT 0,
	thumbnailWidth SMALLINT(5) NOT NULL DEFAULT 0,
	thumbnailHeight SMALLINT(5) NOT NULL DEFAULT 0,
	
	downloads INT(10) NOT NULL DEFAULT 0,
	lastDownloadTime INT(10) NOT NULL DEFAULT 0,
	uploadTime INT(10) NOT NULL DEFAULT 0,
	showOrder SMALLINT(5) NOT NULL DEFAULT 0,
	KEY (objectTypeID, objectID),
	KEY (objectTypeID, tmpHash),
	KEY (objectID, uploadTime)
);

ALTER TABLE wcf1_attachment ADD FOREIGN KEY (objectTypeID) REFERENCES wcf1_object_type (objectTypeID) ON DELETE CASCADE;
ALTER TABLE wcf1_attachment ADD FOREIGN KEY (userID) REFERENCES wcf1_user (userID) ON DELETE SET NULL;