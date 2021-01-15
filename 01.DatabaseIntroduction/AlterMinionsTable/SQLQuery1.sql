USE Minions;

ALTER TABLE Minions
ADD TownId int;

ALTER TABLE Minions
ADD FOREIGN KEY (TownId) REFERENCES Towns(Id);