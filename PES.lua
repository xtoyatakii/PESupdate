-- ___ ___  __   ____   __ __   _______ __ __   __ __   
--| _,\ __/' _/ |  \ `v' / \ \_/ /_   _/__\\ `v' //  \  
--| v_/ _|`._`. | -<`. .'   > , <  | || \/ |`. .'| /\ | 
--|_| |___|___/ |__/ !_!   /_/ \_\ |_| \__/  !_! |_||_|                                                                                                                                                                                                      
  
script_name("PES")
script_version("v0.0.1")

--------local 
local nax = false -- позначаємо, що гра ще не запущена
local inicfg = require "inicfg"
local memory = require "memory"
local samp = require 'lib.samp.events'
-------АВТООНОВЛЕННЯ by qrlk
local enable_autoupdate = true 
local autoupdate_loaded = false
local Update = nil
if enable_autoupdate then
    local updater_loaded, Updater = pcall(loadstring)
    if updater_loaded then
        autoupdate_loaded, Update = pcall(Updater)
        if autoupdate_loaded then
            Update.json_url = "https://raw.githubusercontent.com/qrlk/moonloader-script-updater/master/minified-example.json?" .. tostring(os.clock())
            Update.prefix = "[" .. string.upper(thisScript().name) .. "]: "
            Update.url = "https://github.com/qrlk/moonloader-script-updater/"
        end
    end
end
-------cfп
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
	sampAddChatMessage('Навіщо ти скачав цей скрипт? Таким тут не раді', -1)
	thisScript():unload()
			end
  while true do
    wait(100)
---основа скрипту 
    local result, target =  getCharPlayerIsTargeting(playerHandle)
    if result and isCharDead(target) == true then 
	nax = true
	if nax == true then
	local timer = os.time() + 10 
  local timerActive = true 
  while timerActive do
    wait(0)
    if not sampIsChatInputActive() and isKeyDown(0x52) then 
      sampAddChatMessage("встиг", -1) 
      timerActive = false 
	  nax = false
	  ini.Settings.killed = ini.Settings.killed + 1
	  inicfg.save(ini, "pes")
    elseif os.time() > timer then 
      sampAddChatMessage("не встиг", -1)
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