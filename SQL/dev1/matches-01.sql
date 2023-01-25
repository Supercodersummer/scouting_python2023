CREATE TABLE IF NOT EXISTS dev1.matches (
        matchID INT AUTO_INCREMENT NOT NULL,
        eventID INT NOT NULL,
        matchNum INT NOT NULL,
        red1 VARCHAR(10) NOT NULL,
        red2 VARCHAR(10) NOT NULL,
        red3 VARCHAR(10) NOT NULL,
        blue1 VARCHAR(10) NOT NULL,
        blue2 VARCHAR(10) NOT NULL,
        blue3 VARCHAR(10) NOT NULL,
        /* add alliance data from TBA */
        redAutoPts INT NULL,
        blueAutoPts INT NULL,
        redTelePts INT NULL,
        blueTelePts INT NULL,
        redEndGmPts INT NULL,
        blueEndGmPts INT NULL,
        redScore INT NULL,
        blueScore INT NULL,
        redLinksRP TINYINT NULL,
        blueLinksRP TINYINT NULL,
        redChrgZoneRP TINYINT NULL,
        blueChrgZoneRP TINYINT NULL,
        matchTime INT NULL,
        actualTime INT NULL,
        PRIMARY KEY (matchID),
        FOREIGN KEY (eventID) REFERENCES events (eventID)
) Engine = InnoDB;
