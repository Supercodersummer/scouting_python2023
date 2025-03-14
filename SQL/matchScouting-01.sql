CREATE TABLE IF NOT EXISTS dev1.matchScouting (
        matchScoutingID INT AUTO_INCREMENT NOT NULL,
        eventID INT NOT NULL,
        matchID INT NOT NULL,
        matchNum INT NULL,
        allianceStationID INT NULL,
        team VARCHAR(10) NOT NULL,
        teamMatchNum INT NULL,
        scoutingStatus INT NULL,
        scouterID INT NULL,
        /* Level 1 Data */
        preNoShow TINYINT NULL,
        preStartPos TINYINT NULL,
        preLoad TINYINT NULL,
        autoMB TINYINT NULL,
        autoRamp TINYINT NULL,
        BAautoCSrampPts TINYINT NULL,
        autoPen TINYINT NULL,
        autoScore1 TINYINT NULL DEFAULT 0,
        autoScore2 TINYINT NULL DEFAULT 0,
        autoScore3 TINYINT NULL DEFAULT 0,
        autoScore4 TINYINT NULL DEFAULT 0,
        teleConeHigh TINYINT NULL DEFAULT 0,
        teleCubeHigh TINYINT NULL DEFAULT 0,
        teleConeMid TINYINT NULL DEFAULT 0,
        teleCubeMid TINYINT NULL DEFAULT 0,
        teleConeLow TINYINT NULL DEFAULT 0,
        teleCubeLow TINYINT NULL DEFAULT 0,
        teleConeCMTY TINYINT NULL DEFAULT 0,
        teleCubeCMTY TINYINT NULL DEFAULT 0,
        teleLZPickup TINYINT NULL DEFAULT 0,
        teleObstructed TINYINT NULL DEFAULT 0,
        teleWasObstructed TINYINT NULL,
        ramp TINYINT NULL,
        rampAssist TINYINT NULL DEFAULT 0,
        rampPos TINYINT NULL,
        rampStartTime TINYINT NULL DEFAULT 0,
        postSubsystemBroke TINYINT NULL,
        postBrokeDown TINYINT NULL,
        postReorientCone TINYINT NULL,
        postShelfPickup TINYINT NULL,
        postGroundPickup TINYINT NULL,
        postGoodPartner TINYINT NULL,
        postTippedOver TINYINT NULL,
        BAfouls INT NULL,
        BAtechFouls INT NULL,
        BAlinkRP TINYINT NULL,
        BAchargeStationRP TINYINT NULL,
        BAcoopertitionBonus TINYINT NULL,
        PRIMARY KEY (matchScoutingID),
        FOREIGN KEY (eventID) REFERENCES events (eventID),
        FOREIGN KEY (matchID) REFERENCES matches (matchID),
        FOREIGN KEY (scouterID) REFERENCES scouters (scouterID),
        FOREIGN KEY (allianceStationID) REFERENCES allianceStations (allianceStationID)
) Engine = InnoDB;
