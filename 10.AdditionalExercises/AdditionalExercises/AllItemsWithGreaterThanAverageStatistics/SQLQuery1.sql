SELECT i.[Name], i.Price, i.MinLevel, 
	st.Strength, st.Defence, st.Speed, st.Luck, st.Mind
	FROM Items i
	JOIN [Statistics] st ON st.Id = i.StatisticId
	WHERE st.Mind > (SELECT AVG(Mind)
						FROM Items i
						JOIN [Statistics] st ON st.Id = i.StatisticId)
	AND st.Luck > (SELECT AVG(Luck)
						FROM Items i
						JOIN [Statistics] st ON st.Id = i.StatisticId)
	AND st.Speed > (SELECT AVG(Speed)
						FROM Items i
						JOIN [Statistics] st ON st.Id = i.StatisticId)
	ORDER BY i.[Name] ASC