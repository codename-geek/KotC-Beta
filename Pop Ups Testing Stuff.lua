--GAME STATUS
--CHEST TALLY
-- 5 Torn Page(s)
-- 1 Proof(s) of Nonexistence
-- 1 Ukulele Charm(s)
-- 1 Feather Charm(s)

--POPUP TALLY
-- 1 Fire spell(s)
-- 2 Blizzard spell(s)
-- 3 Cure spell(s)
-- 1 Reflect spell(s)
-- 1 Proof(s) of Connection
-- 1 Proof(s) of Peace
-- 1 Secret Ansem's Report(s) 1
-- 1 Secret Ansem's Report(s) 2
-- 1 Secret Ansem's Report(s) 3
-- 1 Secret Ansem's Report(s) 4
-- 1 Secret Ansem's Report(s) 5
-- 1 Secret Ansem's Report(s) 6
-- 1 Secret Ansem's Report(s) 7
-- 1 Secret Ansem's Report(s) 8
-- 1 Secret Ansem's Report(s) 9
-- 1 Secret Ansem's Report(s) 10
-- 1 Secret Ansem's Report(s) 11
-- 1 Secret Ansem's Report(s) 12
-- 1 Secret Ansem's Report(s) 13
-- 1 Valor Form(s)
-- 1 Wisdom Form(s)
-- 1 Limit Form(s)
-- 1 Master Form(s)
-- 1 Baseball Charm(s)
-- 1 Lamp Charm(s)

--FORM & SUMMON TALLY

--LEVEL TALLY
--SWORD TALLY

--SHIELD TALLY

--STAFF TALLY

--BONUS TALLY
-- 1 Fire spell(s)

--SORA'S FINAL STATS IN CRITICAL MODE
-- HP: 30
-- MP: 100
-- Armor: 2
-- Accessory: 3
-- Item: 6
-- Drive: 7

function _OnInit()
	kh2libstatus, kh2lib = pcall(require, "kh2lib")	if not kh2libstatus then		print("ERROR (Auto Save): KH2-Lua-Library mod is not installed")		CanExecute = false		return	end	RequireKH2LibraryVersion(1)	Now = kh2lib.Now
	Save = kh2lib.Save
	Obj3 = ReadPointer(kh2lib.Obj0Pointer)
	Sys3 = ReadPointer(kh2lib.Sys3Pointer)
	Btl0 = ReadPointer(kh2lib.Btl0Pointer)
	Slot1 = kh2lib.Slot1
	Gauge = kh2lib.Gauge1
	Songs = kh2lib.Songs
end

function _OnFrame()
	if not CanExecute then		return	end	World = ReadByte(Now + 0x00)
	Room = ReadByte(Now + 0x01)
	Place = ReadShort(Now + 0x00)
	Door = ReadShort(Now + 0x02)
	Map = ReadShort(Now + 0x04)
	Btl = ReadShort(Now + 0x06)
	Evt = ReadShort(Now + 0x08)
	Chests()
	Popups()
	BonusRewards()
	DriveForms()
	Equipment()
	LevelRewards()
	AbilityCosts()
	StartingStatus()
	Cheats()
end

function Events(M,B,E) --Check for Map, Btl, and Evt
	return ((Map == M or not M) and (Btl == B or not B) and (Evt == E or not E))
end


function Chests()
	-- AGRABAH
	WriteShort(Sys3+0x14526,0x016F) -- Agrabah, Dark Shard is now Letter
	-- BEAST'S CASTLE
	-- CAVERN OF REMEMBRANCE
	-- DISNEY CASTLE
	-- HALLOWEEN TOWN
	-- HOLLOW BASTION
	-- LAND OF DRAGONS
	-- OLYMPUS COLISEUM
	-- 100 ACRE WOOD
	-- PORT ROYAL
	-- PRIDE LANDS
	-- SIMULATED TWILIGHT TOWN
	-- SPACE PARANOIDS
	-- TIMELESS RIVER
	-- TWILIGHT TOWN
	-- THE WORLD THAT NEVER WAS
end

function Popups()
	-- AGRABAH
	-- ATLANTICA
	-- BEAST'S CASTLE
	WriteShort(Sys3+0x157C2,0x016B) -- Xaldin (Data), Defense Boost is now Crystal Orb
	-- DISNEY CASTLE
	-- HALLOWEEN TOWN
	-- HOLLOW BASTION
	WriteShort(Sys3+0x157B6,0x016B) -- Demyx (Data), AP Boost is now Crystal Orb
	-- LAND OF DRAGONS
	WriteShort(Sys3+0x157E6,0x016B) -- Xigbar (Data), Defense Boost is now Crystal Orb
	-- OLYMPUS COLISEUM
	-- OLYMPUS CUPS
	-- 100 ACRE WOOD
	-- PORT ROYAL
	WriteShort(Sys3+0x157FE,0x016B) -- Luxord (Data), AP Boost is now Crystal Orb
	-- PRIDE LANDS
	WriteShort(Sys3+0x157F2,0x016B) -- Saix (Data), Defense Boost is now Crystal Orb
	-- SIMULATED TWILIGHT TOWN
	WriteShort(Sys3+0x1580A,0x016B) -- Roxas (Data), Magic Boost is now Crystal Orb
	-- SPACE PARANOIDS
	-- TIMELESS RIVER
	-- TWILIGHT TOWN
	WriteShort(Sys3+0x157CE,0x016B) -- Axel (Data), Magic Boost is now Crystal Orb
	-- THE WORLD THAT NEVER WAS
	WriteShort(Sys3+0x157DA,0x016B) -- Xemnas (Data), Power Boost is now Crystal Orb
end

function BonusRewards()
	-- AGRABAH
	--Volcanic Lord & Blizzard Lord
	-- Bonus Slot #1
	WriteInt(Btl0+0x2AF68,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--Genie Jafar
	-- Bonus Slot #1
	WriteInt(Btl0+0x2ABF8,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	--Lexaeus (Absent Silhouette)
	-- Bonus Slot #1
	WriteInt(Btl0+0x2B3A4,0x00000000) -- Armor Slot:+0 Accessory Slot:+0 Item Slot:+0 Drive Gauge:+0
	WriteInt(Btl0+0x2B3A8,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- BEAST'S CASTLE
	--Thresholder
	-- Bonus Slot #1
	WriteInt(Btl0+0x2A9D8,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	--Dark Thorn
	-- Bonus Slot #1
	WriteShort(Btl0+0x2AA02,0x0000) -- MP:0 HP:0
	WriteInt(Btl0+0x2AA08,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--Xaldin
	-- Bonus Slot #1
	WriteShort(Btl0+0x2AA42,0x0000) -- MP:0 HP:0
	WriteInt(Btl0+0x2AA48,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	-- CAVERN OF REMEMBRANCE
	-- DISNEY CASTLE
	--Marluxia (Absent Silhouette)
	-- Bonus Slot #1
	WriteInt(Btl0+0x2B404,0x00000000) -- Armor Slot:+0 Accessory Slot:+0 Item Slot:+0 Drive Gauge:+0
	WriteInt(Btl0+0x2B408,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- HALLOWEEN TOWN
	--Prison Keeper
	-- Bonus Slot #1
	WriteInt(Btl0+0x2AC68,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--Oogie Boogie
	-- Bonus Slot #1
	WriteInt(Btl0+0x2ACA4,0x00000000) -- Armor Slot:+0 Accessory Slot:+0 Item Slot:+0 Drive Gauge:+0
	WriteInt(Btl0+0x2ACA8,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--The Experiment
	-- Bonus Slot #1
	WriteShort(Btl0+0x2ACE2,0x0000) -- MP:0 HP:0
	WriteInt(Btl0+0x2ACE8,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--Vexen (Absent Silhouette)
	-- Bonus Slot #1
	WriteInt(Btl0+0x2B374,0x00000000) -- Armor Slot:+0 Accessory Slot:+0 Item Slot:+0 Drive Gauge:+0
	WriteInt(Btl0+0x2B378,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- HOLLOW BASTION
	--Demyx (Hollow Bastion)
	-- Bonus Slot #1
	WriteInt(Btl0+0x2AE24,0x00000000) -- Armor Slot:+0 Accessory Slot:+0 Item Slot:+0 Drive Gauge:+0
	WriteInt(Btl0+0x2AE28,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	--Sephiroth
	-- Bonus Slot #1
	WriteInt(Btl0+0x2AF54,0x00000000) -- Armor Slot:+0 Accessory Slot:+0 Item Slot:+0 Drive Gauge:+0
	WriteInt(Btl0+0x2AF58,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- LAND OF DRAGONS
	--Shan-Yu
	-- Bonus Slot #1
	WriteShort(Btl0+0x2AB42,0x0000) -- MP:0 HP:0
	WriteInt(Btl0+0x2AB48,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--Storm Rider
	-- Bonus Slot #1
	WriteInt(Btl0+0x2AB88,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	-- OLYMPUS COLISEUM
	--Cerberus
	-- Bonus Slot #1
	WriteInt(Btl0+0x2AA88,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	--The Hydra
	-- Bonus Slot #1
	WriteShort(Btl0+0x2AAD2,0x0000) -- MP:0 HP:0
	WriteInt(Btl0+0x2AAD8,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	--Hades
	-- Bonus Slot #1
	WriteShort(Btl0+0x2AB02,0x0000) -- MP:0 HP:0
	WriteInt(Btl0+0x2AB08,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--Zexion (Absent Silhouette)
	-- Bonus Slot #1
	WriteInt(Btl0+0x2B3D4,0x00000000) -- Armor Slot:+0 Accessory Slot:+0 Item Slot:+0 Drive Gauge:+0
	WriteInt(Btl0+0x2B3D8,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- PORT ROYAL
	--Captain Barbossa
	-- Bonus Slot #1
	WriteInt(Btl0+0x2AD24,0x00000000) -- Armor Slot:+0 Accessory Slot:+0 Item Slot:+0 Drive Gauge:+0
	WriteInt(Btl0+0x2AD28,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--Grim Reaper I
	-- Bonus Slot #1
	WriteInt(Btl0+0x2B2A8,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--Grim Reaper II
	-- Bonus Slot #1
	WriteInt(Btl0+0x2AD68,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	-- PRIDE LANDS
	--Scar
	-- Bonus Slot #1
	WriteShort(Btl0+0x2AE52,0x0000) -- MP:0 HP:0
	WriteInt(Btl0+0x2AE58,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--Groundshaker
	-- Bonus Slot #1
	WriteShort(Btl0+0x2AE92,0x0000) -- MP:0 HP:0
	WriteInt(Btl0+0x2AE98,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- SIMULATED TWILIGHT TOWN
	--Twilight Thorn
	-- Bonus Slot #1
	WriteShort(Btl0+0x2AF32,0x0000) -- MP:0 HP:0
	WriteInt(Btl0+0x2AF38,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	--Axel II
	-- Bonus Slot #1
	WriteShort(Btl0+0x2AF42,0x0000) -- MP:0 HP:0
	WriteInt(Btl0+0x2AF48,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- SPACE PARANOIDS
	--Hostile Program
	-- Bonus Slot #1
	WriteInt(Btl0+0x2AEB4,0x00000000) -- Armor Slot:+0 Accessory Slot:+0 Item Slot:+0 Drive Gauge:+0
	WriteInt(Btl0+0x2AEB8,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--MCP
	-- Bonus Slot #1
	WriteShort(Btl0+0x2AEF2,0x0000) -- MP:0 HP:0
	WriteInt(Btl0+0x2AEF8,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--Larxene (Absent Silhouette)
	-- Bonus Slot #1
	WriteShort(Btl0+0x2B432,0x0000) -- MP:0 HP:0
	WriteInt(Btl0+0x2B438,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- TIMELESS RIVER
	--Pete (Timeless River)
	-- Bonus Slot #1
	WriteShort(Btl0+0x2AC32,0x0000) -- MP:0 HP:0
	WriteInt(Btl0+0x2AC38,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- TWILIGHT TOWN
	-- THE WORLD THAT NEVER WAS
	--Roxas
	-- Bonus Slot #1
	WriteShort(Btl0+0x2B462,0x0000) -- MP:0 HP:0
	WriteInt(Btl0+0x2B468,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	--Xigbar
	-- Bonus Slot #1
	WriteShort(Btl0+0x2ADA2,0x0000) -- MP:0 HP:0
	WriteInt(Btl0+0x2ADA8,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	--Luxord
	-- Bonus Slot #1
	WriteShort(Btl0+0x2ADD2,0x0000) -- MP:0 HP:0
	WriteInt(Btl0+0x2ADD8,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	--Saix
	-- Bonus Slot #1
	WriteShort(Btl0+0x2ADE2,0x0000) -- MP:0 HP:0
	WriteInt(Btl0+0x2ADE8,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	--Xemnas
	-- Bonus Slot #1
	WriteShort(Btl0+0x2AE12,0x0000) -- MP:0 HP:0
	WriteInt(Btl0+0x2AE18,0x0000016B) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
end

function DriveForms()
	-- VALOR
	-- WISDOM
	-- LIMIT
	-- MASTER
	-- FINAL
	-- SUMMON
end

function Equipment()
	-- KEYBLADE
	-- DONALD STAFF
	-- GOOFY SHIELD
	-- ALLY WEAPON
	-- ARMOR
	-- ACCESSORY
end

function LevelRewards()
	-- Level: 1
	-- No Level 1 Dream Weapon Rewards
	-- Level: 99
	-- Cannot Level to 100 so experience is not changed
end

function AbilityCosts()
	-- MAGIC
	-- DRIVES AND SUMMONS
	-- PARTY LIMITS
end

function StartingStatus()
end

function Cheats()
end