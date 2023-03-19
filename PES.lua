-- ___ ___  __   ____   __ __   _______ __ __   __ __   
--| _,\ __/' _/ |  \ `v' / \ \_/ /_   _/__\\ `v' //  \  
--| v_/ _|`._`. | -<`. .'   > , <  | || \/ |`. .'| /\ | 
--|_| |___|___/ |__/ !_!   /_/ \_\ |_| \__/  !_! |_||_|                                                                                                                                                                                                      
  
script_name("PES")
script_version("0.0.3")
--------local 
local encoding = require 'encoding'
encoding.default = 'UTF-8'
u8 = encoding.CP1251
local nax = false -- РїРѕР·РЅР°С‡Р°Р‡РјРѕ, С‰Рѕ РіСЂР° С‰Рµ РЅРµ Р·Р°РїСѓС‰РµРЅР°
local inicfg = require "inicfg"
local memory = require "memory"
local samp = require 'lib.samp.events'
local imgui = require 'imgui'
local help = imgui.ImBool(false)
local settings = imgui.ImBool(false)
local textt = imgui.ImBool(false)
-------СВ¬вЂњСњСњРЊСњВ¬Р‹в‰€РЊРЊСЏ by qrlk
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
                sampAddChatMessage((prefix..'{FFFFFF}Update detected. Attempting to update from {00ffdd}'..thisScript().version..'{FFFFFF} to {00ffdd}'..updateversion), 0x00ffdd)
wait(250)
downloadUrlToFile(updatelink, thisScript().path,
  function(id3, status1, p13, p23)
    if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
      print(string.format('Downloaded %d out of %d bytes.', p13, p23))
    elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
      print('Update download completed.')
      sampAddChatMessage((prefix..'Update completed!'), 0x00ffdd)
      goupdatestatus = true
      lua_thread.create(function() wait(500) thisScript():reload() end)
    end
    if status1 == dlstatus.STATUSEX_ENDDOWNLOAD then
      if goupdatestatus == nil then
        sampAddChatMessage((prefix..'{FFFFFF}Update failed. Starting the outdated version..'), 0x00ffdd)
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

-------cfРї
local mainIni = inicfg.load({ 
Settings = { 
texts = 1, 
killed = "0",
killedchet = true,
activate = true,  
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
	autoupdate("https://raw.githubusercontent.com/xtoyatakii/PESupdate/main/PESj.json?", '['..string.upper(thisScript().name)..']: ', "")
sampAddChatMessage('{00ffdd}['..thisScript().name.. u8']: {FFFFFF}Script loaded. CMD: /spes', 0x00ffdd)
	custom_style()
	sampRegisterChatCommand("spes", function() help.v = not help.v end)
	local _, playerid = sampGetPlayerIdByCharHandle(PLAYER_PED)
local	namess = sampGetPlayerNickname(playerid)
  if name[namess] == 'P' then
	sampAddChatMessage(u8'ЧС', -1)
	thisScript():unload()
			end
  while true do
  imgui.Process = help.v or settings.v or textt.v
    wait(100)
---РѕСЃРЅРѕРІР° СЃРєСЂРёРїС‚Сѓ 
    local result, target =  getCharPlayerIsTargeting(playerHandle)
    if result and isCharDead(target) == true then 
	if ini.Settings.activate == true then
	nax = true
	if nax == true then
	local timer = os.time() + 10 
  local timerActive = true 
  while timerActive do
    wait(0)
    if not sampIsChatInputActive() and isKeyDown(0x52) then 
texttt()
      timerActive = false 
	  nax = false
	  if ini.Settings.killedchet then
	  ini.Settings.killed = ini.Settings.killed + 1
	  inicfg.save(ini, "pes")
	 end 
    elseif os.time() > timer then 
      timerActive = false 
	  nax = false
						end
					end
				end 
			end
		end
	end 
end 
function imgui.OnDrawFrame()
if help.v then 
local sw, sh = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
        imgui.SetNextWindowSize(imgui.ImVec2(200, 250), imgui.Cond.FirstUseEver)
		imgui.Begin('PES', help, imgui.WindowFlags.NoResize)
		imgui.SetCursorPos(imgui.ImVec2(4, 23), imgui.Cond.FirstUseEver)
		imgui.BeginChild('left', imgui.ImVec2(190, 120), true)
		if imgui.Button('Налаштування', imgui.SetCursorPos(imgui.ImVec2(4, 20.5))) then
		help.v = false
		settings.v = true 
		end
		imgui.EndChild() 
		imgui.SetCursorPos(imgui.ImVec2(4, 190), imgui.Cond.FirstUseEver)
		imgui.BeginChild('right', imgui.ImVec2(190, 50), true)
		imgui.EndChild() 
	if imgui.Link("Наш телеграм", "•Новини про створення скриптів\n•Актуальні версії скриптів\n•Всі скрипти мають українську мову.\n•t.me/ebkalua", imgui.SetCursorPos(imgui.ImVec2(10, 218.5))) then
    os.execute(('explorer.exe "%s"'):format("https://t.me/ebkalua"))
	end 
	if imgui.Link("Автор - XtoYa", 'XtoYa - адміністратор телеграм каналу "EBKA"\nМинулий малорос, ДМщик, ідіот. ', imgui.SetCursorPos(imgui.ImVec2(10, 195.5))) then
	end 
imgui.End() -- конец окна
end
if settings.v then 
local sw, sh = getScreenResolution()
imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
        imgui.SetNextWindowSize(imgui.ImVec2(200, 250), imgui.Cond.FirstUseEver)
		imgui.Begin('PES settings', settings, imgui.WindowFlags.NoResize)
	if imgui.Button('Текст після вбивства', imgui.SetCursorPos(imgui.ImVec2(4, 40.5))) then
	settings.v = false
	textt.v = true
		end
	if ini.Settings.activate == true then
	if imgui.Button('Відключити активацію на "R"', imgui.SetCursorPos(imgui.ImVec2(4, 90.5))) then
	ini.Settings.activate = false
	end 
	elseif ini.Settings.activate == false then
	if imgui.Button('Включити активацію на "R"', imgui.SetCursorPos(imgui.ImVec2(4, 90.5))) then
	ini.Settings.activate = true
	end 
end 
	if ini.Settings.killedchet == true then
	if imgui.Button('Відключити рахунок вбивств', imgui.SetCursorPos(imgui.ImVec2(4, 140.5))) then
	ini.Settings.killedchet = false
	inicfg.save(ini, "pes")
	end 
	elseif ini.Settings.killedchet == false then 
	if imgui.Button('Включити рахунок вбивств', imgui.SetCursorPos(imgui.ImVec2(4, 140.5))) then
	ini.Settings.killedchet = true
	inicfg.save(ini, "pes")
	end 
end 
imgui.End()
	end 
if textt.v then 
local sw, sh = getScreenResolution()
imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
        imgui.SetNextWindowSize(imgui.ImVec2(200, 250), imgui.Cond.FirstUseEver)
		imgui.Begin('PES text', textt, imgui.WindowFlags.NoResize)
		imgui.Text('Ваш текст після вбивства зараз:', imgui.SetCursorPos(imgui.ImVec2(4, 20.5)))
		if ini.Settings.texts == 1 then
		imgui.Link('*Подивитися*', 'Я думав ти сильніший, а ти якийсь слабак...\nТренируйся лузер', imgui.SetCursorPos(imgui.ImVec2(4, 40.5))) 
		elseif ini.Settings.texts == 2 then
		imgui.Link('*Подивитися*', 'Сьогодні помер наш дорогий %losernick\nЦе велика втрата для нас\nБудемо пам`ятати його!', imgui.SetCursorPos(imgui.ImVec2(4, 40.5))) 
		elseif ini.Settings.texts == 3 then
		imgui.Link('*Подивитися*', 'Ви порушили закон, а тому Старший Брат виніс вам вирок...\nСмерть!', imgui.SetCursorPos(imgui.ImVec2(4, 40.5))) 
		elseif ini.Settings.texts == 4 then
		imgui.Link('*Подивитися*', 'Hasta la vista!', imgui.SetCursorPos(imgui.ImVec2(4, 40.5))) 
		elseif ini.Settings.texts == 5 then
		imgui.Link('*Подивитися*', 'See you in hell!', imgui.SetCursorPos(imgui.ImVec2(4, 40.5))) 
		end 
	if imgui.Button('Змінити на "Тренируйся лузер"', imgui.SetCursorPos(imgui.ImVec2(4, 90.5))) then
	ini.Settings.texts = 1
	inicfg.save(ini, "pes")
	end 
	if imgui.Button('Змінити на "Священик"', imgui.SetCursorPos(imgui.ImVec2(4, 120.5))) then
	ini.Settings.texts = 2
	inicfg.save(ini, "pes")
	end 
	if imgui.Button('Змінити на "Старший Брат"', imgui.SetCursorPos(imgui.ImVec2(4, 150.5))) then
	ini.Settings.texts = 3
	inicfg.save(ini, "pes")
	end 
	if imgui.Button('Змінити на "Hasta la vista"', imgui.SetCursorPos(imgui.ImVec2(4, 180.5))) then
	ini.Settings.texts = 4
	inicfg.save(ini, "pes")
	end 
	if imgui.Button('Змінити на "See you in hell"', imgui.SetCursorPos(imgui.ImVec2(4, 210.5))) then
	ini.Settings.texts = 5
	inicfg.save(ini, "pes")
	end 
	imgui.End()
	end 
end




function imgui.Link(label, description)

    local size = imgui.CalcTextSize(label)
    local p = imgui.GetCursorScreenPos()
    local p2 = imgui.GetCursorPos()
    local result = imgui.InvisibleButton(label, size)

    imgui.SetCursorPos(p2)

    if imgui.IsItemHovered() then
        if description then
            imgui.BeginTooltip()
            imgui.PushTextWrapPos(600)
            imgui.TextUnformatted(description)
            imgui.PopTextWrapPos()
            imgui.EndTooltip()

        end

        imgui.TextColored(imgui.GetStyle().Colors[imgui.Col.CheckMark], label)
        imgui.GetWindowDrawList():AddLine(imgui.ImVec2(p.x, p.y + size.y), imgui.ImVec2(p.x + size.x, p.y + size.y), imgui.GetColorU32(imgui.GetStyle().Colors[imgui.Col.CheckMark]))

    else
        imgui.TextColored(imgui.GetStyle().Colors[imgui.Col.CheckMark], label)
    end

    return result
end

function imgui.VerticalSeparator()
    local p = imgui.GetCursorScreenPos()
    imgui.GetWindowDrawList():AddLine(imgui.ImVec2(p.x, p.y), imgui.ImVec2(p.x, p.y + imgui.GetContentRegionMax().y), imgui.GetColorU32(imgui.GetStyle().Colors[imgui.Col.Separator]))
end

function custom_style()
imgui.SwitchContext()
local style = imgui.GetStyle()
local clrs = style.Colors
local clr = imgui.Col
local ImVec4 = imgui.ImVec4
style.Alpha = 1
style.ChildWindowRounding = 1
style.WindowRounding = 8
style.GrabRounding = 0
style.GrabMinSize = 12
style.FrameRounding = 0
clrs[clr.Text] = ImVec4(1, 1, 1, 0.56470590829849)
clrs[clr.TextDisabled] = ImVec4(0.60000002384186, 0.60000002384186, 0.60000002384186, 1)
clrs[clr.WindowBg] = ImVec4(4.4408920872885e-22, 4.4408920872885e-22, 4.4408920872885e-22, 0.72549021244049)
clrs[clr.ChildWindowBg] = ImVec4(0, 0, 0, 0)
clrs[clr.PopupBg] = ImVec4(9.9999999747524e-07, 9.9999476788071e-07, 9.9998999303352e-07, 0.60000002384186)
clrs[clr.Border] = ImVec4(1, 1, 1, 0.3137255012989)
clrs[clr.BorderShadow] = ImVec4(1, 1, 1, 0.3137255012989)
clrs[clr.FrameBg] = ImVec4(9.9999999747524e-07, 9.9999476788071e-07, 9.9998999303352e-07, 0.60000002384186)
clrs[clr.FrameBgHovered] = ImVec4(0, 0, 0, 0.43921568989754)
clrs[clr.FrameBgActive] = ImVec4(0, 0, 0, 0.43921568989754)
clrs[clr.TitleBg] = ImVec4(0, 0, 0, 0.72549021244049)
clrs[clr.TitleBgActive] = ImVec4(0, 0, 0, 0.72549021244049)
clrs[clr.TitleBgCollapsed] = ImVec4(9.9998999303352e-07, 9.9998999303352e-07, 9.9999999747524e-07, 0.20000000298023)
clrs[clr.MenuBarBg] = ImVec4(0, 0, 0, 0.72549021244049)
clrs[clr.ScrollbarBg] = ImVec4(9.9998999303352e-07, 9.9999499525438e-07, 9.9999999747524e-07, 0.60000002384186)
clrs[clr.ScrollbarGrab] = ImVec4(0.99998998641968, 0.99998998641968, 1, 0.30000001192093)
clrs[clr.ScrollbarGrabHovered] = ImVec4(0.99998998641968, 0.99998998641968, 1, 0.40000000596046)
clrs[clr.ScrollbarGrabActive] = ImVec4(1, 0.99998998641968, 0.99998998641968, 0.40000000596046)
clrs[clr.ComboBg] = ImVec4(0.20000000298023, 0.20000000298023, 0.20000000298023, 0.99000000953674)
clrs[clr.CheckMark] = ImVec4(1, 1, 1, 0.56470590829849)
clrs[clr.SliderGrab] = ImVec4(1, 1, 1, 0.30000001192093)
clrs[clr.SliderGrabActive] = ImVec4(1, 0.99998998641968, 0.99998998641968, 1)
clrs[clr.Button] = ImVec4(9.9999999747524e-07, 9.9998999303352e-07, 9.9998999303352e-07, 0.60000002384186)
clrs[clr.ButtonHovered] = ImVec4(1, 1, 1, 0.37647059559822)
clrs[clr.ButtonActive] = ImVec4(9.9999999747524e-07, 9.9998999303352e-07, 9.9998999303352e-07, 1)
clrs[clr.Header] = ImVec4(9.9998999303352e-07, 9.9998999303352e-07, 9.9999999747524e-07, 0.44999998807907)
clrs[clr.HeaderHovered] = ImVec4(1, 1, 1, 0.3137255012989)
clrs[clr.HeaderActive] = ImVec4(1, 1, 1, 0.3137255012989)
clrs[clr.Separator] = ImVec4(1, 1, 1, 0.3137255012989)
clrs[clr.SeparatorHovered] = ImVec4(0.60000002384186, 0.60000002384186, 0.69999998807907, 1)
clrs[clr.SeparatorActive] = ImVec4(1, 1, 1, 0.3137255012989)
clrs[clr.ResizeGrip] = ImVec4(1, 1, 1, 0.30000001192093)
clrs[clr.ResizeGripHovered] = ImVec4(1, 1, 1, 0.60000002384186)
clrs[clr.ResizeGripActive] = ImVec4(1, 1, 1, 0.89999997615814)
clrs[clr.CloseButton] = ImVec4(1, 1, 1, 0.3137255012989)
clrs[clr.CloseButtonHovered] = ImVec4(1, 1, 1, 0.3137255012989)
clrs[clr.CloseButtonActive] = ImVec4(1, 1, 1, 0.3137255012989)
clrs[clr.PlotLines] = ImVec4(1, 1, 1, 1)
clrs[clr.PlotLinesHovered] = ImVec4(0.89999997615814, 0.69999998807907, 0, 1)
clrs[clr.PlotHistogram] = ImVec4(0.89999997615814, 0.69999998807907, 0, 1)
clrs[clr.PlotHistogramHovered] = ImVec4(1, 0.60000002384186, 0, 1)
clrs[clr.TextSelectedBg] = ImVec4(0.99998998641968, 0.99998998641968, 1, 0.34999999403954)
clrs[clr.ModalWindowDarkening] = ImVec4(0.20000000298023, 0.20000000298023, 0.20000000298023, 0.34999999403954)
end


function texttt()
      if ini.Settings.texts == 1 then 
sampAddChatMessage(u8'Один upd', -1)
elseif ini.Settings.texts == 2 then 
sampAddChatMessage(u8'Дваupd', -1)
elseif ini.Settings.texts == 3 then 
sampAddChatMessage(u8'Триupd', -1)
elseif ini.Settings.texts == 4 then 
sampAddChatMessage(u8'Чотириupd', -1)
elseif ini.Settings.texts == 5 then 
sampAddChatMessage(u8'5upd', -1)
end 
end 
