import statistics

def teleMid(analysis, rsRobotMatchData, rsRobotL2MatchData, rsRobotPitData):
    # Initialize the rsCEA record set and define variables specific to this function which lie outside the for loop
    rsCEA = {}
    rsCEA['analysisTypeID'] = 6
    numberOfMatchesPlayed = 0

    # only using to test ranks, eliminate later
    teleMidList = []
    
    # Loop through each match the robot played in.
    for matchResults in rsRobotMatchData:
        rsCEA['team'] = matchResults[analysis.columns.index('team')]
        rsCEA['eventID'] = matchResults[analysis.columns.index('eventID')]
        # We are hijacking the starting position to write DNS or UR. This should go to Auto as it will not
        #   likely be displayed on team picker pages.
        preNoShow = matchResults[analysis.columns.index('preNoShow')]
        scoutingStatus = matchResults[analysis.columns.index('scoutingStatus')]
        if preNoShow == 1:
            rsCEA['M' + str(matchResults[analysis.columns.index('teamMatchNum')]) + 'D'] = 'DNS'
        elif scoutingStatus == 2:
            rsCEA['M' + str(matchResults[analysis.columns.index('teamMatchNum')]) + 'D'] = 'UR'
        else:
            
            coneHigh = 0
            coneMid = 0
            coneLow = 0

            cubeHigh = 0
            cubeMid = 0
            cubeLow = 0

            totalMid = 0
            total = 0

            coneHigh = matchResults[analysis.columns.index('teleConeHigh')]
            coneMid = matchResults[analysis.columns.index('teleConeMid')]
            coneLow = matchResults[analysis.columns.index('teleConeMid')]

            cubeHigh = matchResults[analysis.columns.index('teleCubeHigh')]
            cubeMid = matchResults[analysis.columns.index('teleCubeMid')]
            cubeLow = matchResults[analysis.columns.index('teleCubeLow')]


            if coneHigh is None:
                coneHigh = 0
            if coneMid is None:
                coneMid = 0
            if coneLow is None:
                coneLow = 0
            if cubeHigh is None:
                cubeHigh = 0
            if cubeMid is None:
                cubeMid = 0
            if cubeLow is None:
                cubeLow = 0

            totalMid = coneMid + cubeMid
            total = coneHigh + coneMid + coneLow + cubeHigh + cubeMid + cubeLow

            teleMidDisplay = (f"{str(totalMid)}|{str(total)}")
            teleMidValue = totalMid

            if total == 0:
                teleMidColor = 1
            elif total <= 3:
                teleMidColor = 2
            elif total <= 6:
                teleMidColor = 3
            elif total <= 9:
                teleMidColor = 4
            else:
                teleMidColor = 5


            # Increment the number of matches played and write M#D, M#V and M#F
            numberOfMatchesPlayed += 1
            rsCEA['M' + str(matchResults[analysis.columns.index('teamMatchNum')]) + 'D'] = teleMidDisplay
            rsCEA['M' + str(matchResults[analysis.columns.index('teamMatchNum')]) + 'V'] = teleMidValue
            rsCEA['M' + str(matchResults[analysis.columns.index('teamMatchNum')]) + 'F'] = teleMidColor

            teleMidList.append(teleMidValue)

    if numberOfMatchesPlayed > 0:
        rsCEA['S1V'] = round(statistics.mean(teleMidList), 1)
        rsCEA['S1D'] = str(round(statistics.mean(teleMidList), 1))
        rsCEA['S2V'] = round(statistics.median(teleMidList), 1)
        rsCEA['S2D'] = str(round(statistics.median(teleMidList), 1))
    return rsCEA