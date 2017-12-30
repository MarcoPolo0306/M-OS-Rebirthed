local button1x, button1y = 1,1
local text1 = " Menu "
local button2x, button2y = 3,10
local text2 = "Shutdown"
local button3x, button3y = 4,11
local text3 = "Reboot"
local button4x, button4y = 2,3
local text4 = " Settings "
local button5x, button5y = 2,4 
local text5 = " Programs "
local menu = 0

local backgroundColorFile = fs.open("M-OS_Rebirthed/config/desktop-background-color.config","r")
local backgroundColor = backgroundColorFile.readLine()

local function centerText(text)
	local x,y = term.getSize()
	local x2,y2 = term.getCursorPos()
	term.setCursorPos(math.ceil((x / 2) - (text:len() / 2)), y2)
	print(text)
end

function drawScreen()
	menu = 0
	if backgroundColor == "1" then
		term.setBackgroundColor(colors.orange)
	elseif backgroundColor == "2" then
		term.setBackgroundColor(colors.magenta)
	elseif backgroundColor == "3" then
		term.setBackgroundColor(colors.lightBlue)	
	elseif backgroundColor == "4" then
		term.setBackgroundColor(colors.yellow)
	elseif backgroundColor == "5" then
		term.setBackgroundColor(colors.lime)
	elseif backgroundColor == "6" then
		term.setBackgroundColor(colors.cyan)
	elseif backgroundColor == "7" then
		term.setBackgroundColor(colors.gray)
	elseif backgroundColor == "8" then
		term.setBackgroundColor(colors.lightGray)
	elseif backgroundColor == "9" then
		term.setBackgroundColor(colors.cyan)
	elseif backgroundColor == "a" then
		term.setBackgroundColor(colors.purple)
	elseif backgroundColor == "b" then
		term.setBackgroundColor(colors.blue)
	elseif backgroundColor == "c" then
		term.setBackgroundColor(colors.brown)
	elseif backgroundColor == "d" then
		term.setBackgroundColor(colors.green)
	elseif backgroundColor == "e" then
		term.setBackgroundColor(colors.red)
	elseif backgroundColor == "f" then
		term.setBackgroundColor(colors.black)
	else
		term.setBackgroundColor(colors.lightBlue)
	end
	term.clear()
	if backgroundColor == "7" then
		term.setBackgroundColor(colors.lightGray)
		term.setCursorPos(button1x, button1y)
		term.clearLine()
		term.setTextColor(colors.gray)
		print(text1)
	else
		term.setBackgroundColor(colors.gray)
		term.setCursorPos(button1x, button1y)
		term.clearLine()
		term.setTextColor(colors.lightGray)
		print(text1)
	end
end

function goodbye()
	term.clear()
	term.setCursorPos(0,h/2)
	centerText("Goodbye")
end

function drawMenu()
	menu = 1
	if backgroundColor == "7" then
		term.setCursorPos(button1x, button1y)
		term.setBackgroundColor(colors.gray)
		term.setTextColor(colors.lightGray)
		print(text1)
		paintutils.drawFilledBox(1,2,12,12,colors.lightGray)
		term.setTextColor(colors.gray)
		term.setCursorPos(button4x, button4y)
		print(text4)
		term.setCursorPos(button5x, button5y)
		print(text5)
		term.setCursorPos(button2x, button2y)
		print(text2)
		term.setCursorPos(button3x, button3y)
		print(text3)
	else
		term.setCursorPos(button1x, button1y)
		term.setBackgroundColor(colors.lightGray)
		term.setTextColor(colors.gray)
		print(text1)
		paintutils.drawFilledBox(1,2,12,12,colors.gray)
		term.setTextColor(colors.lightGray)
		term.setCursorPos(button4x, button4y)
		print(text4)
		term.setCursorPos(button5x, button5y)
		print(text5)
		term.setCursorPos(button2x, button2y)
		print(text2)
		term.setCursorPos(button3x, button3y)
		print(text3)
	end
end

drawScreen()

while true do
	local event, button, cx, cy = os.pullEventRaw()
	if event == "mouse_click" then
		if button == 1 then
			if menu == 0 then
				if cx >= button1x and cx < text1:len() and cy == button1y then
					drawMenu()
				else
					drawScreen()
				end
			elseif menu == 1 then
				if cx >= button2x and cx < text2:len() and cy == button2y then
					os.shutdown()
				elseif cx >= button3x and cx < text3:len() and cy == button3y then
					os.reboot()
				elseif cx >= button4x and cx < text4:len() and cy == button4y then
					shell.run("M-OS_Rebirthed/settings.lua")
				elseif cx >= button5x and cx < text4:len() and cy == button5y then
					shell.run("M-OS_Rebirthed/programs.lua")
				elseif cx >= button1x and cx < text1:len() and cy == button1y then
					drawScreen()
				else
					drawScreen()
				end
			else
				drawScreen()
			end
		end
	end
end
