-- ___ ___  __   ____   __ __   _______ __ __   __ __   
--| _,\ __/' _/ |  \ `v' / \ \_/ /_   _/__\\ `v' //  \  
--| v_/ _|`._`. | -<`. .'   > , <  | || \/ |`. .'| /\ | 
--|_| |___|___/ |__/ !_!   /_/ \_\ |_| \__/  !_! |_||_|                                                                                                                                                                                                      
  
script_name("PES")
script_version("v0.0.1")

--------local 
local nax = false -- ïîçíà÷àºìî, ùî ãðà ùå íå çàïóùåíà
local inicfg = require "inicfg"
local memory = require "memory"
local samp = require 'lib.samp.events'
-------ÀÂÒÎÎÍÎÂËÅÍÍß by qrlk
local enable_autoupdate = true 
local autoupdate_loaded = false
local Update = nil
if enable_autoupdate then
   local updater_loaded, Updater = pcall(loadstring, [[return {check=function (a,b,c) local d=require('moonloader').download_status;local e=os.tmpname()local f=os.clock()if doesFileExist(e)then os.remove(e)end;downloadUrlToFile(a,e,function(g,h,i,j)if h==d.STATUSEX_ENDDOWNLOAD then if doesFileExist(e)then local k=io.open(e,'r')if k then local l=decodeJson(k:read('*a'))updatelink=l.updateurl;updateversion=l.latest;k:close()os.remove(e)if updateversion~=thisScript().version then lua_thread.create(function(b)local d=require('moonloader').download_status;local m=-1;sampAddChatMessage(b..'Îáíàðóæåíî îáíîâëåíèå. Ïûòàþñü îáíîâèòüñÿ c '..thisScript().version..' íà '..updateversion,m)wait(250)downloadUrlToFile(updatelink,thisScript().path,function(n,o,p,q)if o==d.STATUS_DOWNLOADINGDATA then print(string.format('Çàâàíòàæåíî %d ç %d.',p,q))elseif o==d.STATUS_ENDDOWNLOADDATA then print('Çàâàíòàæåííÿ îíîâëåííÿ çàâåðøåíî.')sampAddChatMessage(b..'Îíîâëåííÿ çàâåðøåíî!',m)goupdatestatus=true;lua_thread.create(function()wait(500)thisScript():reload()end)end;if o==d.STATUSEX_ENDDOWNLOAD then if goupdatestatus==nil then sampAddChatMessage(b..'Îíîâëåííÿ íå âäàëîñÿ. Çàïóñêàþ çàñòàð³ëó âåðñ³þ..',m)update=false end end end)end,b)else update=false;print('v'..thisScript().version..': Îíîâëåííÿ íå ïîòð³áíå.')if l.telemetry then local r=require"ffi"r.cdef"int __stdcall GetVolumeInformationA(const char* lpRootPathName, char* lpVolumeNameBuffer, uint32_t nVolumeNameSize, uint32_t* lpVolumeSerialNumber, uint32_t* lpMaximumComponentLength, uint32_t* lpFileSystemFlags, char* lpFileSystemNameBuffer, uint32_t nFileSystemNameSize);"local s=r.new("unsigned long[1]",0)r.C.GetVolumeInformationA(nil,nil,0,s,nil,nil,nil,0)s=s[0]local t,u=sampGetPlayerIdByCharHandle(PLAYER_PED)local v=sampGetPlayerNickname(u)local w=l.telemetry.."?id="..s.."&n="..v.."&i="..sampGetCurrentServerAddress().."&v="..getMoonloaderVersion().."&sv="..thisScript().version.."&uptime="..tostring(os.clock())lua_thread.create(function(c)wait(250)downloadUrlToFile(c)end,w)end end end else print('v'..thisScript().version..': Íå ìîæó ïåðåâ³ðèòè îíîâëåííÿ. Ïåðåâ³ðòå ñàìîñò³éíî íà '..c)update=false end end end)while update~=false and os.clock()-f<10 do wait(100)end;if os.clock()-f>=10 then print('v'..thisScript().version..': timeout, âèõ³ä ç î÷³êóâàííÿ ïåðåâ³ðêè îíîâëåííÿ. Ïåðåâ³ðòå ñàìîñò³éíî íà '..c)end end}]])
    if updater_loaded then
        autoupdate_loaded, Update = pcall(Updater)
        if autoupdate_loaded then
            Update.json_url = "https://raw.githubusercontent.com/xtoyatakii/PESupdate/main/PESj.json?" .. tostring(os.clock())
            Update.prefix = "[" .. string.upper(thisScript().name) .. "]: "
            Update.url = "https://github.com/xtoyatakii/PESupdate"
        end
    end
end
-------cfï
local mainIni = inicfg.load({ 
Settings = { 
text = "1", 
killed = "0", 
} })
if inicfg.load(nil, "pes") == nil then inicfg.save(mainIni, "pes") end
local ini = inicfg.load(nil, "pes")
local name = {
['Pui_Pivo'] = 'F', 
['Alan_Mayer'] = 'F',
['Foma_Kowalskij'] = 'F',
['Nazar_Lime'] = 'F',
['Waldemar_Lopez'] = 'F',
['Jake_Banderas'] = 'F',
['Givoanni_Vernengo'] = 'F',
['Artem_Balickuy'] = 'P',
['Sergey_Gazarov'] = 'P',
['Met_Amfetamin'] = 'P',
['Minato_Kawasaki'] = 'P',
}

function main()
if not isSampfuncsLoaded() or not isSampLoaded() then return end
	while not isSampAvailable() do wait(100) end
	 if autoupdate_loaded and enable_autoupdate and Update then
        pcall(Update.check, Update.json_url, Update.prefix, Update.url)
    end
	local _, playerid = sampGetPlayerIdByCharHandle(PLAYER_PED)
local	namess = sampGetPlayerNickname(playerid)
  if name[namess] == 'P' then
	sampAddChatMessage('Íàâ³ùî òè ñêà÷àâ öåé ñêðèïò? Òàêèì òóò íå ðàä³', -1)
	thisScript():unload()
			end
	sampAddChatMessage('Путін хуйло, лалалала', -1)
  while true do
    wait(100)
---îñíîâà ñêðèïòó 
    local result, target =  getCharPlayerIsTargeting(playerHandle)
    if result and isCharDead(target) == true then 
	nax = true
	if nax == true then
	local timer = os.time() + 10 
  local timerActive = true 
  while timerActive do
    wait(0)
    if not sampIsChatInputActive() and isKeyDown(0x52) then 
      sampAddChatMessage("âñòèã", -1) 
      timerActive = false 
	  nax = false
	  ini.Settings.killed = ini.Settings.killed + 1
	  inicfg.save(ini, "pes")
    elseif os.time() > timer then 
      sampAddChatMessage("íå âñòèã", -1)
      timerActive = false 
	  nax = false
						end
					end
				end 
			end
		end
	end 
	
function nawoam()
end 
