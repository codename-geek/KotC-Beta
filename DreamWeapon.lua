function _OnInit()
	GameVersion = 0
end
function GetVersion() --Define anchor addresses
if (GAME_ID == 0xF266B00B or GAME_ID == 0xFAF99301) and ENGINE_TYPE == "ENGINE" then --PCSX2
	GameVersion = 1
	Now = 0x032BAE0 --Current Location
	Save = 0x032BB30 --Save File
	Sys3Pointer = 0x1C61AF8 --03system.bin Pointer Address
	Sys3 = ReadInt(Sys3Pointer)
	print('GoA PS2 Version - Dream Weapon Test')
elseif GAME_ID == 0x431219CC and ENGINE_TYPE == 'BACKEND' then --PC
	OnPC = true
	if ReadString(0x9A9330,4) == 'KH2J' then --EGS
		GameVersion = 2
		Now = 0x0716DF8
		Save = 0x09A9330
		Sys3Pointer = 0x2AE58D0
		Sys3 = ReadLong(Sys3Pointer)
		print('GoA Epic Version (v.10) - Dream Weapon Test')
	elseif ReadString(0x9A98B0,4) == 'KH2J' then --Steam Global
		GameVersion = 3
		Now = 0x0717008
		Save = 0x09A98B0
		Sys3Pointer = 0x2AE5E50
		Sys3 = ReadLong(Sys3Pointer)
		print('GoA Steam Global Version (v.2) - Dream Weapon Test')
	elseif ReadString(0x9A98B0,4) == 'KH2J' then --Steam JP (same as Global for now)
		GameVersion = 4
		Now = 0x0717008
		Save = 0x09A98B0
		Sys3Pointer = 0x2AE5E50
		Sys3 = ReadLong(Sys3Pointer)
		print('GoA Steam JP Version (v.2) - Dream Weapon Test')
	end
end
end

function Events(M,B,E) --Check for Map, Btl, and Evt
return ((Map == M or not M) and (Btl == B or not B) and (Evt == E or not E))
end

function BAR(File,Subfile,Offset) --Get address within a BAR file
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

inGoA = false
function _OnFrame()
	if GameVersion == 0 then --Get anchor addresses
		GetVersion()
		return
	end

	World  = ReadByte(Now+0x00)
	Room   = ReadByte(Now+0x01)
	Place  = ReadShort(Now+0x00)
	Map    = ReadShort(Now+0x04)
	Btl    = ReadShort(Now+0x06)
	Evt    = ReadShort(Now+0x08)
	--print(ReadByte(Save+0x24FE))
	--WriteShort(BAR(Sys3, 0x7, 0xED6), 0x021B, OnPC) --Combo Master
	--WriteShort(BAR(Sys3, 0x7, 0xECA), 0x0191, OnPC) --Experience Boost
	--WriteShort(BAR(Sys3, 0x7, 0xEBE), 0x006B, OnPC) --Glide 2
	if Place == 0x2002 and Events(0x01,Null,0x01) then
		--print("resetting")
		inGoA = false
	end
	if World == 0x04 and Room == 0x1A and not inGoA then
		--print("Picked")
		if ReadByte(Save+0x24FE) == 2 then --Staff
			--print("Staff")
			WriteShort(BAR(Sys3, 0x7, 0xED6), 0x0003, OnPC)
			WriteShort(BAR(Sys3, 0x7, 0xECA), 0x0191, OnPC) --Experience Boost
			WriteShort(BAR(Sys3, 0x7, 0xEBE), 0x0003, OnPC)
			WriteByte(Save+0x24F9,ReadByte(Save+0x24F9) + 2)
			WriteByte(Save+0x24FA,ReadByte(Save+0x24F9) + 2)
		elseif ReadByte(Save+0x24FE) == 0 then --Sword
			--print("Sword")
			WriteShort(BAR(Sys3, 0x7, 0xED6), 0x021B, OnPC) --Combo Master
			WriteShort(BAR(Sys3, 0x7, 0xECA), 0x0003, OnPC) 
			WriteShort(BAR(Sys3, 0x7, 0xEBE), 0x0186, OnPC) --Combo Boost
		elseif ReadByte(Save+0x24FE) == 1 then --Shield
			--print("Shield")
			WriteShort(BAR(Sys3, 0x7, 0xED6), 0x0003, OnPC)
			WriteShort(BAR(Sys3, 0x7, 0xECA), 0x0003, OnPC)
			WriteShort(BAR(Sys3, 0x7, 0xEBE), 0x006B, OnPC) --Glide 2
		end
		inGoA = true
	end
end