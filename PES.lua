-- ___ ___  __   ____   __ __   _______ __ __   __ __   
--| _,\ __/' _/ |  \ `v' / \ \_/ /_   _/__\\ `v' //  \  
--| v_/ _|`._`. | -<`. .'   > , <  | || \/ |`. .'| /\ | 
--|_| |___|___/ |__/ !_!   /_/ \_\ |_| \__/  !_! |_||_|                                                                                                                                                                                                      
  
script_name("PES")
script_version("0.0.1")
--------local 
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8
local nax = false -- позначаємо, що гра ще не запущена
local inicfg = require "inicfg"
local memory = require "memory"
local samp = require 'lib.samp.events'
-------АВТООНОВЛЕННЯ by qrlk
function autoupdate(json_url, prefix, url)
  local dlstatus = require('moonloader').download_status
  local json = getWorkingDirectory() .. '\\'..thisScript().name..'-version.json'
  if doesFileExist(json) then os.remove(json) end
  downloadUrlToFile(json_url, json,
    function(id, status, p1, p2)
      if status == dlstatus.STATUSEX_ENDDOWNLOAD then
        if doesFileExist(json) then
          local f = io.open(json, 'r')
          if f then
            local info = decodeJson(f:read('*a'))
            updatelink = info.updateurl
            updateversion = info.latest
            f:close()
            os.remove(json)
            if updateversion ~= thisScript().version then
              lua_thread.create(function(prefix)
                local dlstatus = require('moonloader').download_status
                local color = -1
                sampAddChatMessage((prefix..'Update detected. Attempting to update from '..thisScript().version..' to '..updateversion), 0x0077be)
wait(250)
downloadUrlToFile(updatelink, thisScript().path,
  function(id3, status1, p13, p23)
    if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
      print(string.format('Downloaded %d out of %d bytes.', p13, p23))
    elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
      print('Update download completed.')
      sampAddChatMessage((prefix..'Update completed!'), 0x0077be)
      goupdatestatus = true
      lua_thread.create(function() wait(500) thisScript():reload() end)
    end
    if status1 == dlstatus.STATUSEX_ENDDOWNLOAD then
      if goupdatestatus == nil then
        sampAddChatMessage((prefix..'Update failed. Starting the outdated version..'), 0x0077be)
                        update = false
                      end
                    end
                  end
                )
                end, prefix
              )
            else
              update = false
              print('v'..thisScript().version..': No update required.')
            end
          end
        else
          print('v'..thisScript().version..': Unable to check for update. Please check manually at '..url)
          update = false
        end
      end
    end
  )
  while update ~= false do wait(100) end
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
autoupdate("https://raw.githubusercontent.com/xtoyatakii/PESupdate/main/PESj.json?", '['..string.upper(thisScript().name)..']: ', "")
	while not isSampAvailable() do wait(100) end
	local _, playerid = sampGetPlayerIdByCharHandle(PLAYER_PED)
local	namess = sampGetPlayerNickname(playerid)
  if name[namess] == 'P' then
	sampAddChatMessage(u8'Навіщо ти скачав цей скрипт? Таким тут не раді', -1)
	thisScript():unload()
			end
  while true do
  sampAddChatMessage(u8"тиг", -1) 
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
      sampAddChatMessage(u8"встиг", -1) 
      timerActive = false 
	  nax = false
	  ini.Settings.killed = ini.Settings.killed + 1
	  inicfg.save(ini, "pes")
    elseif os.time() > timer then 
      sampAddChatMessage(u8"не встиг", -1)
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