-- ___ ___  __   ____   __ __   _______ __ __   __ __   
--| _,\ __/' _/ |  \ `v' / \ \_/ /_   _/__\\ `v' //  \  
--| v_/ _|`._`. | -<`. .'   > , <  | || \/ |`. .'| /\ | 
--|_| |___|___/ |__/ !_!   /_/ \_\ |_| \__/  !_! |_||_|                                                                                                                                                                                                      
  
script_name("PES")
script_version("0.0.2")
--------local 
local nax = false -- ïîçíà÷àºìî, ùî ãðà ùå íå çàïóùåíà
local inicfg = require "inicfg"
local memory = require "memory"
local samp = require 'lib.samp.events'
-------ÀÂÒÎÎÍÎÂËÅÍÍß by qrlk
local encoding = require 'encoding'

encoding.default = 'cp1251'
local u8 = encoding.UTF8
local function recode(u8) return encoding.UTF8:decode(u8) end
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
                sampAddChatMessage((prefix..'Îáíàðóæåíî îáíîâëåíèå. Ïûòàþñü îáíîâèòüñÿ c '..thisScript().version..' íà '..updateversion), color)
                wait(250)
                downloadUrlToFile(updatelink, thisScript().path,
                  function(id3, status1, p13, p23)
                    if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
                      print(string.format('Çàãðóæåíî %d èç %d.', p13, p23))
                    elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
                      print('Çàãðóçêà îáíîâëåíèÿ çàâåðøåíà.')
                      sampAddChatMessage((prefix..'Îáíîâëåíèå çàâåðøåíî!'), color)
                      goupdatestatus = true
                      lua_thread.create(function() wait(500) thisScript():reload() end)
                    end
                    if status1 == dlstatus.STATUSEX_ENDDOWNLOAD then
                      if goupdatestatus == nil then
                        sampAddChatMessage((prefix..'Îáíîâëåíèå ïðîøëî íåóäà÷íî. Çàïóñêàþ óñòàðåâøóþ âåðñèþ..'), color)
                        update = false
                      end
                    end
                  end
                )
                end, prefix
              )
            else
              update = false
              print('v'..thisScript().version..': Îáíîâëåíèå íå òðåáóåòñÿ.')
            end
          end
        else
          print('v'..thisScript().version..': Íå ìîãó ïðîâåðèòü îáíîâëåíèå. Ñìèðèòåñü èëè ïðîâåðüòå ñàìîñòîÿòåëüíî íà '..url)
          update = false
        end
      end
    end
  )
  while update ~= false do wait(100) end
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
autoupdate("https://raw.githubusercontent.com/xtoyatakii/PESupdate/main/PESj.json?", '['..string.upper(thisScript().name)..']: ', "")
	while not isSampAvailable() do wait(100) end
	local _, playerid = sampGetPlayerIdByCharHandle(PLAYER_PED)
local	namess = sampGetPlayerNickname(playerid)
  if name[namess] == 'P' then
	sampAddChatMessage('Íàâ³ùî òè ñêà÷àâ öåé ñêðèïò? Òàêèì òóò íå ðàä³', -1)
	thisScript():unload()
			end
  while true do
  sampAddChatMessage(u8'Îáíîâ', -1)
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
