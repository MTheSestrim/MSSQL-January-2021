SELECT u.Username, g.[Name] AS Game, MAX(c.[Name]) AS [Character],
	SUM(si.Strength) + MAX(sc.Strength) + MAX(sgt.Strength) AS Strength,
	SUM(si.Defence) + MAX(sc.Defence) + MAX(sgt.Defence) AS Defence,
	SUM(si.Speed) + MAX(sc.Speed) + MAX(sgt.Speed) AS Speed,
	SUM(si.Mind) + MAX(sc.Mind) + MAX(sgt.Mind) AS Mind,
	SUM(si.Luck) + MAX(sc.Luck) + MAX(sgt.Luck) AS Luck
	FROM Games g
	JOIN UsersGames ug ON ug.GameId = g.Id
	JOIN Users u ON u.Id = ug.UserId
	JOIN Characters c ON c.Id = ug.CharacterId
	JOIN [Statistics] sc ON sc.Id = c.StatisticId
	JOIN GameTypes gt ON gt.Id = g.GameTypeId
	JOIN [Statistics] sgt ON sgt.Id = gt.BonusStatsId
	JOIN UserGameItems ugi ON ugi.UserGameId = ug.Id
	JOIN Items i ON i.Id = ugi.ItemId
	JOIN [Statistics] si ON si.Id = i.StatisticId
	GROUP BY u.Username, g.[Name]
	ORDER BY Strength DESC, Defence DESC, Speed DESC, Mind DESC, Luck DESC