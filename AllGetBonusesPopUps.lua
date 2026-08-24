--GAME STATUS
--CHEST TALLY
-- 5 Torn Page(s)
-- 1 Proof(s) of Nonexistence
-- 1 Ukulele Charm(s)
-- 1 Feather Charm(s)

--POPUP TALLY

--FORM & SUMMON TALLY

--LEVEL TALLY
--SWORD TALLY

--SHIELD TALLY

--STAFF TALLY

--BONUS TALLY

--SORA'S FINAL STATS IN CRITICAL MODE
-- HP: 20
-- MP: 100
-- Armor: 1
-- Accessory: 1
-- Item: 3
-- Drive: 6

function _OnInit()
	kh2libstatus, kh2lib = pcall(require, "kh2lib")
	if not kh2libstatus then
		print("ERROR ((AllGetBonusesPopUps).lua): KH2-Lua-Library mod is not installed")
		CanExecute = false
		return
	end
	Log("(AllGetBonusesPopUps).lua Ready!")
	RequireKH2LibraryVersion(1)
	CanExecute = kh2lib.CanExecute
	StaticPointersLoaded = false
	OnPC = kh2lib.OnPC
	Now = kh2lib.Now
	Save = kh2lib.Save
	Slot1 = kh2lib.Slot1
	Gauge = kh2lib.Gauge1
	Songs = kh2lib.Songs
end

function _OnFrame()
	if not CanExecute then
		return
	end
	if not StaticPointersLoaded then
		Obj0 = ReadLong(kh2lib.Obj0Pointer)
		Sys3 = ReadLong(kh2lib.Sys3Pointer)
		Btl0 = ReadLong(kh2lib.Btl0Pointer)
	end
	World = ReadByte(Now + 0x00)
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

function BAR(File, Subfile, Offset)
	local Subpoint = File + 0x08 + 0x10*Subfile
	local Address
	--Detect errors
	if ReadInt(File,OnPC) ~= 0x01524142 then --Header mismatch
		return
	elseif Subfile > ReadInt(File+4,OnPC) then --Subfile over count
		return
	elseif Offset >= ReadInt(Subpoint+4,OnPC) then --Offset exceed subfile length
		return
	end
	--Get address
	Address = File + (ReadInt(Subpoint,OnPC) - ReadInt(File+8,OnPC)) + Offset
	return Address
end

function Chests()
	-- AGRABAH
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
	WriteShort(BAR(Sys3, 0x7, 0x106E), 0x016B, OnPC) -- Accidental Help, Agrabah Map is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x107A), 0x016B, OnPC) -- See You Again, Lamp Charm is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x118E), 0x016B, OnPC) -- Cosmic Razzle Dazzle, Wishing Lamp is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x1326), 0x016B, OnPC) -- Lexaeus (Absent Silhouette), Strength Beyond Strength is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x1362), 0x016B, OnPC) -- Lexaeus (Data), Lost Illusion is now Crystal Orb
	-- ATLANTICA
	WriteShort(BAR(Sys3, 0x7, 0x1122), 0x016B, OnPC) -- Come Join the Musical, Undersea Kingdom Map is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x11BE), 0x016B, OnPC) -- Ursala's Defeat, Mysterious Abyss is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x11CA), 0x016B, OnPC) -- Our Worlds Are All Connected (A), Blizzard is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x11D6), 0x016B, OnPC) -- Our Worlds Are All Connected (B), Orichalcum+ is now Crystal Orb
	-- BEAST'S CASTLE
	WriteShort(BAR(Sys3, 0x7, 0xFD2), 0x016B, OnPC) -- Things Are Just Beginning, Cure is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x112E), 0x016B, OnPC) -- Don't Give Up, Rumbling Rose is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x113A), 0x016B, OnPC) -- Don't Give Up, Castle Walls Map is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x12A2), 0x016B, OnPC) -- Xaldin's Demise, Secret Ansem's Report 4 is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x139E), 0x016B, OnPC) -- Xaldin (Data), Defense Boost is now Crystal Orb
	-- DISNEY CASTLE
	WriteShort(BAR(Sys3, 0x7, 0x1032), 0x016B, OnPC) -- Queen Minnie, Disney Castle Map is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x134A), 0x016B, OnPC) -- Marluxia (Absent Silhouette), Eternal Blossom is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x1386), 0x016B, OnPC) -- Marluxia (Data), Lost Illusion is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x13F2), 0x016B, OnPC) -- Lingering Will (A), Proof of Connection is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x13FE), 0x016B, OnPC) -- Lingering Will (B), Manifest Illusion is now Crystal Orb
	-- HALLOWEEN TOWN
	WriteShort(BAR(Sys3, 0x7, 0x1086), 0x016B, OnPC) -- Oogie's Demise, Magnet is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x119A), 0x016B, OnPC) -- The Case Isn't Closed, Present is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x11A6), 0x016B, OnPC) -- Presents Full of Love, Decoy Presents is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x11B2), 0x016B, OnPC) -- The Experiment, Decisive Pumpkin is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x131A), 0x016B, OnPC) -- Vexen (Absent Silhouette), Road to Discovery is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x1356), 0x016B, OnPC) -- Vexen (Data), Lost Illusion is now Crystal Orb
	-- HOLLOW BASTION
	WriteShort(BAR(Sys3, 0x7, 0xF66), 0x016B, OnPC) -- The Great Ninja Yuffie, Marketplace Map is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0xF72), 0x016B, OnPC) -- The HBRC (A), Membership Card is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0xF7E), 0x016B, OnPC) -- The HBRC (B), Blizzard is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x12C6), 0x016B, OnPC) -- Organization XIII, Secret Ansem's Report 7 is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0xFDE), 0x016B, OnPC) -- Lost Memories, Baseball Charm is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x10E6), 0x016B, OnPC) -- The Doodle On The Wall, Master Form is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x1212), 0x016B, OnPC) -- Loading Data, Sleeping Lion is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x10FE), 0x016B, OnPC) -- Goofy's Awake!, Cure is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x127E), 0x016B, OnPC) -- Xemnas's Agenda, Secret Ansem's Report 1 is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x110A), 0x016B, OnPC) -- A Box of Memories (A), Ice Cream is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x1116), 0x016B, OnPC) -- A Box of Memories (B), Picture is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x121E), 0x016B, OnPC) -- The Battle, Fenrir is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x1416), 0x016B, OnPC) -- Mushroom XIII (A), Proof of Peace is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x140A), 0x016B, OnPC) -- Mushroom XIII (B), Winner's Proof is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x1392), 0x016B, OnPC) -- Demyx (Data), AP Boost is now Crystal Orb
	-- LAND OF DRAGONS
	WriteShort(BAR(Sys3, 0x7, 0xFAE), 0x016B, OnPC) -- Enlistment, Encampment Area Map is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0xFA2), 0x016B, OnPC) -- Ping's Training, AP Boost is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0xFBA), 0x016B, OnPC) -- Mountain Climb, Village Area Map is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0xFC6), 0x016B, OnPC) -- The Hero Who Saved the Day, Hidden Dragon is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x13C2), 0x016B, OnPC) -- Xigbar (Data), Defense Boost is now Crystal Orb
	-- OLYMPUS COLISEUM
	WriteShort(BAR(Sys3, 0x7, 0xFEA), 0x016B, OnPC) -- The Reunion, Coliseum Map is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0xFF6), 0x016B, OnPC) -- Regained Power (A), Olympus Stone is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x12AE), 0x016B, OnPC) -- Regained Power (B), Secret Ansem's Report 5 is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x1002), 0x016B, OnPC) -- The Aftermath, Hero's Crest is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x115E), 0x016B, OnPC) -- Foe vs. Foe, Auron's Statue is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x116A), 0x016B, OnPC) -- Good-bye, Auron, Guardian Soul is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x1332), 0x016B, OnPC) -- Zexion (Absent Silhouette), Book of Shadows is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x136E), 0x016B, OnPC) -- Zexion (Data), Lost Illusion is now Crystal Orb
	-- OLYMPUS CUPS
	WriteShort(BAR(Sys3, 0x7, 0x101A), 0x016B, OnPC) -- Pain & Panic Cup (A), Protect Belt is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x1026), 0x016B, OnPC) -- Pain & Panic Cup (B), Serenity Gem is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x10AA), 0x016B, OnPC) -- Cerberus Cup (A), Rising Dragon is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x10B6), 0x016B, OnPC) -- Cerberus Cup (B), Serenity Crystal is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x1176), 0x016B, OnPC) -- Titan Cup (A), Genji Shield is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x1182), 0x016B, OnPC) -- Titan Cup (B), Skillful Ring is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x122A), 0x016B, OnPC) -- Goddess of Fate Cup (A), Fatal Crest is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x1236), 0x016B, OnPC) -- Goddess of Fate Cup (B), Orichalcum+ is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x1272), 0x016B, OnPC) -- Hades Cup, Hades Cup Trophy is now Crystal Orb
	-- 100 ACRE WOOD
	WriteShort(BAR(Sys3, 0x7, 0x11E2), 0x016B, OnPC) -- We Were So Worried (A), Sweet Memories is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x11EE), 0x016B, OnPC) -- We Were So Worried (B), Spooky Cave Map is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x11FA), 0x016B, OnPC) -- I'll Always Be With You (A), Cure is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x1206), 0x016B, OnPC) -- I'll Always Be With You (B), Orichalcum+ is now Crystal Orb
	-- PORT ROYAL
	WriteShort(BAR(Sys3, 0x7, 0x1056), 0x016B, OnPC) -- Run!, Isla de Muerta Map is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x1062), 0x016B, OnPC) -- Parting Ways, Follow the Wind is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x1146), 0x016B, OnPC) -- Captain Elizabeth (A), Cursed Medallion is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x1152), 0x016B, OnPC) -- Captain Elizabeth (B), Ship Graveyard Map is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x12BA), 0x016B, OnPC) -- Luxord Flees, Secret Ansem's Report 6 is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x13DA), 0x016B, OnPC) -- Luxord (Data), AP Boost is now Crystal Orb
	-- PRIDE LANDS
	WriteShort(BAR(Sys3, 0x7, 0x1092), 0x016B, OnPC) -- Nothing to Say, Circle of Life is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x109E), 0x016B, OnPC) -- A New King, Fire is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x13CE), 0x016B, OnPC) -- Saix (Data), Defense Boost is now Crystal Orb
	-- SIMULATED TWILIGHT TOWN
	WriteShort(BAR(Sys3, 0x7, 0xF12), 0x016B, OnPC) -- Let's Go to the Beach!, Twilight Town Map is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0xEE2), 0x016B, OnPC) -- Making Memories, Munny Pouch (Olette) is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0xEEE), 0x016B, OnPC) -- Setzer Victory, Champion Belt is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0xEFA), 0x016B, OnPC) -- Setzer Loss, Medal is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0xF06), 0x016B, OnPC) -- The New Champion, Roxas, "The Struggle" Trophy is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0xF1E), 0x016B, OnPC) -- Those Who Are Incomplete (A), Namine's Sketches is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0xF2A), 0x016B, OnPC) -- Those Who Are Incomplete (B), Mansion Map is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x13E6), 0x016B, OnPC) -- Roxas (Data), Magic Boost is now Crystal Orb
	-- SPACE PARANOIDS
	WriteShort(BAR(Sys3, 0x7, 0x10F2), 0x016B, OnPC) -- To Hollow Bastion, Photon Debugger is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x133E), 0x016B, OnPC) -- Larxene (Absent Silhouette), Cloaked Thunder is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x137A), 0x016B, OnPC) -- Larxene (Data), Lost Illusion is now Crystal Orb
	-- TIMELESS RIVER
	WriteShort(BAR(Sys3, 0x7, 0x104A), 0x016B, OnPC) -- Sora's Deduction, Window of Time Map is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x100E), 0x016B, OnPC) -- Steamboat Willie, Monochrome is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x103E), 0x016B, OnPC) -- The Castle Is Secure, Wisdom Form is now Crystal Orb
	-- TWILIGHT TOWN
	WriteShort(BAR(Sys3, 0x7, 0xF36), 0x016B, OnPC) -- His Majesty, the King (A), Munny Pouch (Mickey) is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x128A), 0x016B, OnPC) -- His Majesty, the King (C), Secret Ansem's Report 2 is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0xF4E), 0x016B, OnPC) -- The Fairies' Gift (A), Star Seeker is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0xF5A), 0x016B, OnPC) -- The Fairies' Gift (B), Valor Form is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x10C2), 0x016B, OnPC) -- Saix Makes an Appearance, Seifer's Trophy is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x10CE), 0x016B, OnPC) -- The Trophy's Crystals (A), Oathkeeper is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x10DA), 0x016B, OnPC) -- The Trophy's Crystals (B), Limit Form is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x12EA), 0x016B, OnPC) -- Roxas's Twilight Town, Secret Ansem's Report 10 is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x1242), 0x016B, OnPC) -- His Last Words, Bond of Flame is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x13AA), 0x016B, OnPC) -- Axel (Data), Magic Boost is now Crystal Orb
	-- THE WORLD THAT NEVER WAS
	WriteShort(BAR(Sys3, 0x7, 0x124E), 0x016B, OnPC) -- Time to Sleep (A), Two Become One is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x12D2), 0x016B, OnPC) -- Time to Sleep (B), Secret Ansem's Report 8 is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x1296), 0x016B, OnPC) -- On Our Way, Secret Ansem's Report 3 is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x125A), 0x016B, OnPC) -- It's You! (A), Oblivion is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x1266), 0x016B, OnPC) -- It's You! (B), Castle That Never Was Map is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x12DE), 0x016B, OnPC) -- As the Battle Ends, Secret Ansem's Report 9 is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x1302), 0x016B, OnPC) -- A Friend Within, Secret Ansem's Report 12 is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x12F6), 0x016B, OnPC) -- Back to His Old Self, Secret Ansem's Report 11 is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x130E), 0x016B, OnPC) -- The Door to Kingdom Hearts, Secret Ansem's Report 13 is now Crystal Orb
	WriteShort(BAR(Sys3, 0x7, 0x13B6), 0x016B, OnPC) -- Xemnas (Data), Power Boost is now Crystal Orb
end

function BonusRewards()
	-- AGRABAH
	--Escort Abu
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x670), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--Treasure Room Heartless
	-- Bonus Slot #1
	WriteShort(BAR(Btl0, 0x6, 0x70A), 0x0000, OnPC) -- MP:0 HP:0
	WriteInt(BAR(Btl0, 0x6, 0x710), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--Volcanic Lord & Blizzard Lord
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x5A0), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--Genie Jafar
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x230), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	--Lexaeus (Absent Silhouette)
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x9DC), 00000000, OnPC) -- Armor Slot:+0 Accessory Slot:+0 Item Slot:+0 Drive Gauge:+0
	WriteInt(BAR(Btl0, 0x6, 0x9E0), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- BEAST'S CASTLE
	--Thresholder
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x10), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	--The Beast
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x1FC), 00000000, OnPC) -- Armor Slot:+0 Accessory Slot:+0 Item Slot:+0 Drive Gauge:+0
	WriteInt(BAR(Btl0, 0x6, 0x200), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	--Dark Thorn
	-- Bonus Slot #1
	WriteShort(BAR(Btl0, 0x6, 0x3A), 0x0000, OnPC) -- MP:0 HP:0
	WriteInt(BAR(Btl0, 0x6, 0x40), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--Xaldin
	-- Bonus Slot #1
	WriteShort(BAR(Btl0, 0x6, 0x7A), 0x0000, OnPC) -- MP:0 HP:0
	WriteInt(BAR(Btl0, 0x6, 0x80), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	-- CAVERN OF REMEMBRANCE
	--Transport to Remembrance Nobodies III
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0xAFC), 00000000, OnPC) -- Armor Slot:+0 Accessory Slot:+0 Item Slot:+0 Drive Gauge:+0
	WriteInt(BAR(Btl0, 0x6, 0xB00), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- DISNEY CASTLE
	--Escort Queen Minnie
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x5DC), 00000000, OnPC) -- Armor Slot:+0 Accessory Slot:+0 Item Slot:+0 Drive Gauge:+0
	WriteInt(BAR(Btl0, 0x6, 0x5E0), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	--Marluxia (Absent Silhouette)
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0xA3C), 00000000, OnPC) -- Armor Slot:+0 Accessory Slot:+0 Item Slot:+0 Drive Gauge:+0
	WriteInt(BAR(Btl0, 0x6, 0xA40), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	--Lingering Will
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0xAAC), 00000000, OnPC) -- Armor Slot:+0 Accessory Slot:+0 Item Slot:+0 Drive Gauge:+0
	WriteInt(BAR(Btl0, 0x6, 0xAB0), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- HALLOWEEN TOWN
	--Prison Keeper
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x2A0), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--Oogie Boogie
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x2DC), 00000000, OnPC) -- Armor Slot:+0 Accessory Slot:+0 Item Slot:+0 Drive Gauge:+0
	WriteInt(BAR(Btl0, 0x6, 0x2E0), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--Lock/Shock/Barrel
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x62C), 00000000, OnPC) -- Armor Slot:+0 Accessory Slot:+0 Item Slot:+0 Drive Gauge:+0
	WriteInt(BAR(Btl0, 0x6, 0x630), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--The Experiment
	-- Bonus Slot #1
	WriteShort(BAR(Btl0, 0x6, 0x31A), 0x0000, OnPC) -- MP:0 HP:0
	WriteInt(BAR(Btl0, 0x6, 0x320), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--Vexen (Absent Silhouette)
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x9AC), 00000000, OnPC) -- Armor Slot:+0 Accessory Slot:+0 Item Slot:+0 Drive Gauge:+0
	WriteInt(BAR(Btl0, 0x6, 0x9B0), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- HOLLOW BASTION
	--Bailey Nobodies
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x750), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	--Demyx (Hollow Bastion)
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x45C), 00000000, OnPC) -- Armor Slot:+0 Accessory Slot:+0 Item Slot:+0 Drive Gauge:+0
	WriteInt(BAR(Btl0, 0x6, 0x460), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	--1,000 Heartless
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x920), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	--Sephiroth
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x58C), 00000000, OnPC) -- Armor Slot:+0 Accessory Slot:+0 Item Slot:+0 Drive Gauge:+0
	WriteInt(BAR(Btl0, 0x6, 0x590), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- LAND OF DRAGONS
	--Village Cave Heartless
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x6B0), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	--Shan-Yu
	-- Bonus Slot #1
	WriteShort(BAR(Btl0, 0x6, 0x17A), 0x0000, OnPC) -- MP:0 HP:0
	WriteInt(BAR(Btl0, 0x6, 0x180), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--Storm Rider
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x1C0), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	-- OLYMPUS COLISEUM
	--Cerberus
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0xC0), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	--Phil's Training(Story)
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x8A0), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	--Demyx (Olympus Coliseum)
	-- Bonus Slot #1
	WriteShort(BAR(Btl0, 0x6, 0x8AA), 0x0000, OnPC) -- MP:0 HP:0
	WriteInt(BAR(Btl0, 0x6, 0x8B0), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	--Pete (Olympus Coliseum)
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0xE0), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	--The Hydra
	-- Bonus Slot #1
	WriteShort(BAR(Btl0, 0x6, 0x10A), 0x0000, OnPC) -- MP:0 HP:0
	WriteInt(BAR(Btl0, 0x6, 0x110), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	--Hades
	-- Bonus Slot #1
	WriteShort(BAR(Btl0, 0x6, 0x13A), 0x0000, OnPC) -- MP:0 HP:0
	WriteInt(BAR(Btl0, 0x6, 0x140), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--Zexion (Absent Silhouette)
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0xA0C), 00000000, OnPC) -- Armor Slot:+0 Accessory Slot:+0 Item Slot:+0 Drive Gauge:+0
	WriteInt(BAR(Btl0, 0x6, 0xA10), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- PORT ROYAL
	--The Interceptor Pirates
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x970), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	--The Interceptor Barrels
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x5EC), 00000000, OnPC) -- Armor Slot:+0 Accessory Slot:+0 Item Slot:+0 Drive Gauge:+0
	WriteInt(BAR(Btl0, 0x6, 0x5F0), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--Captain Barbossa
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x35C), 00000000, OnPC) -- Armor Slot:+0 Accessory Slot:+0 Item Slot:+0 Drive Gauge:+0
	WriteInt(BAR(Btl0, 0x6, 0x360), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--Grim Reaper I
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x8E0), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--Grim Reaper II
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x3A0), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	-- PRIDE LANDS
	--Hyenas I
	-- Bonus Slot #1
	WriteShort(BAR(Btl0, 0x6, 0x75A), 0x0000, OnPC) -- MP:0 HP:0
	WriteInt(BAR(Btl0, 0x6, 0x760), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	--Scar
	-- Bonus Slot #1
	WriteShort(BAR(Btl0, 0x6, 0x48A), 0x0000, OnPC) -- MP:0 HP:0
	WriteInt(BAR(Btl0, 0x6, 0x490), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--Hyenas II
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x78C), 00000000, OnPC) -- Armor Slot:+0 Accessory Slot:+0 Item Slot:+0 Drive Gauge:+0
	WriteInt(BAR(Btl0, 0x6, 0x790), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--Groundshaker
	-- Bonus Slot #1
	WriteShort(BAR(Btl0, 0x6, 0x4CA), 0x0000, OnPC) -- MP:0 HP:0
	WriteInt(BAR(Btl0, 0x6, 0x4D0), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- SIMULATED TWILIGHT TOWN
	--Station of Serenity Nobodies
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x860), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	--Twilight Thorn
	-- Bonus Slot #1
	WriteShort(BAR(Btl0, 0x6, 0x56A), 0x0000, OnPC) -- MP:0 HP:0
	WriteInt(BAR(Btl0, 0x6, 0x570), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	--Axel I
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0xB30), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	--Axel II
	-- Bonus Slot #1
	WriteShort(BAR(Btl0, 0x6, 0x57A), 0x0000, OnPC) -- MP:0 HP:0
	WriteInt(BAR(Btl0, 0x6, 0x580), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- SPACE PARANOIDS
	--Dataspace Computers
	-- Bonus Slot #1
	WriteShort(BAR(Btl0, 0x6, 0x6CA), 0x0000, OnPC) -- MP:0 HP:0
	WriteInt(BAR(Btl0, 0x6, 0x6D0), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--Hostile Program
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x4EC), 00000000, OnPC) -- Armor Slot:+0 Accessory Slot:+0 Item Slot:+0 Drive Gauge:+0
	WriteInt(BAR(Btl0, 0x6, 0x4F0), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--Solar Sailor Heartless
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x930), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--MCP
	-- Bonus Slot #1
	WriteShort(BAR(Btl0, 0x6, 0x52A), 0x0000, OnPC) -- MP:0 HP:0
	WriteInt(BAR(Btl0, 0x6, 0x530), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- Bonus Slot #4
	--Larxene (Absent Silhouette)
	-- Bonus Slot #1
	WriteShort(BAR(Btl0, 0x6, 0xA6A), 0x0000, OnPC) -- MP:0 HP:0
	WriteInt(BAR(Btl0, 0x6, 0xA70), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- TIMELESS RIVER
	--Pete (Steamboat Fight)
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x240), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	--Pete (Timeless River)
	-- Bonus Slot #1
	WriteShort(BAR(Btl0, 0x6, 0x26A), 0x0000, OnPC) -- MP:0 HP:0
	WriteInt(BAR(Btl0, 0x6, 0x270), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	-- TWILIGHT TOWN
	--The Old Mansion Nobodies
	-- Bonus Slot #1
	WriteShort(BAR(Btl0, 0x6, 0x86A), 0x0000, OnPC) -- MP:0 HP:0
	WriteInt(BAR(Btl0, 0x6, 0x870), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	--Betwixt & Between Nobodies
	-- Bonus Slot #1
	WriteInt(BAR(Btl0, 0x6, 0x9A0), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- THE WORLD THAT NEVER WAS
	--Roxas
	-- Bonus Slot #1
	WriteShort(BAR(Btl0, 0x6, 0xA9A), 0x0000, OnPC) -- MP:0 HP:0
	WriteInt(BAR(Btl0, 0x6, 0xAA0), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	--Xigbar
	-- Bonus Slot #1
	WriteShort(BAR(Btl0, 0x6, 0x3DA), 0x0000, OnPC) -- MP:0 HP:0
	WriteInt(BAR(Btl0, 0x6, 0x3E0), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	--Luxord
	-- Bonus Slot #1
	WriteShort(BAR(Btl0, 0x6, 0x40A), 0x0000, OnPC) -- MP:0 HP:0
	WriteInt(BAR(Btl0, 0x6, 0x410), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	--Saix
	-- Bonus Slot #1
	WriteShort(BAR(Btl0, 0x6, 0x41A), 0x0000, OnPC) -- MP:0 HP:0
	WriteInt(BAR(Btl0, 0x6, 0x420), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
	-- Bonus Slot #2
	-- Bonus Slot #3
	--Xemnas
	-- Bonus Slot #1
	WriteShort(BAR(Btl0, 0x6, 0x44A), 0x0000, OnPC) -- MP:0 HP:0
	WriteInt(BAR(Btl0, 0x6, 0x450), 0000016B), OnPC) -- Replacement Reward #2:EMPTY, Replacement Reward #1:Crystal Orb
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