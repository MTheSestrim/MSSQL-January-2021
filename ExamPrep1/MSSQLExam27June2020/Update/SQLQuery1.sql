-- Ryan -> MechanicId = 3
UPDATE Jobs 
	SET [Status] = 'In Progress', MechanicId = 3
	WHERE [Status] = 'Pending'