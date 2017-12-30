local w,h = term.getSize()
local menu = 0
local done = false
local button1x, button1y = 1,1
local text1 = "X"
local button2x, button2y = 2,3
local text2 = " Install a Program "
local item1x, item1y, item1name, item1exists
local item2x, item2y, item2name, item2exists
local item3x, item3y, item3name, item3exists
local item4x, item4y, item4name, item4exists
local item5x, item5y, item5name, item5exists

local function centerText(text)
	local x,y = term.getSize()
	local x2,y2 = term.getCursorPos()
	term.setCursorPos(math.ceil((x / 2) - (text:len() / 2)), y2)
	print(text)
end

local function drawUi()
	term.setBackgroundColor(colors.white)
	term.clear()
	term.setBackgroundColor(colors.gray)
	term.setCursorPos(1,1)
	term.clearLine()
	term.setTextColor(colors.lightGray)
	centerText("Programs")
	term.setBackgroundColor(colors.red)
	term.setTextColor(colors.white)
	term.setCursorPos(button1x,button1y)
	print(text1)
	term.setCursorPos(button2x, button2y)
	term.setBackgroundColor(colors.gray)
	term.setTextColor(colors.lightGray)
	print(text2)
	term.setTextColor(colors.gray)
	term.setBackgroundColor(colors.white)
	term.setCursorPos(2,5)
	centerText("Installed Programs")
end

local function loadPrograms()
	local programs = fs.list("M-OS_Rebirthed/programs")
	term.setCursorPos(2,3)
	term.setBackgroundColor(colors.white)
	term.setTextColor(colors.gray)
	local currentLevel = 7
	term.setCursorPos(2,7)
	for i, file in ipairs(programs) do
		if file ~= "mouse.cfg" then
			if i == 1 then
				item1x = 2
				item1y = currentLevel
				item1name = file
				item1exists = true
				term.setBackgroundColor(colors.white)
				term.clearLine()
				print(item1name)
				currentLevel = currentLevel + 1
				term.setCursorPos(2,currentLevel)
			elseif i == 2 then
				item2x = 2
				item2y = currentLevel
				item2name = file
				item2exists = true
				term.setBackgroundColor(colors.lightGray)
				term.clearLine()
				print(item2name)
				currentLevel = currentLevel + 1
				term.setCursorPos(2,currentLevel)
			elseif i == 3 then
				item3x = 2
				item3y = currentLevel
				item3name = file
				item3exists = true
				term.setBackgroundColor(colors.white)
				term.clearLine()
				print(item3name)
				currentLevel = currentLevel + 1
				term.setCursorPos(2,currentLevel)
			elseif i == 4 then
				item4x = 2
				item4y = currentLevel
				item4name = file
				item4exists = true
				term.setBackgroundColor(colors.lightGray)
				term.clearLine()
				print(item4name)
				currentLevel = currentLevel + 1
				term.setCursorPos(2,currentLevel)
			elseif i == 5 then
				item5x = 2
				item5y = currentLevel
				item5name = file
				item5exists = true
				term.setBackgroundColor(colors.white)
				term.clearLine()
				print(item5name)
				currentLevel = currentLevel + 1
				term.setCursorPos(2,currentLevel)
			end
		end
	end
end

local function addProgram(stage)
	if stage == 1 then
		term.setCursorPos(button2x,button2y+1)
		term.setBackgroundColor(colors.white)
		term.setTextColor(colors.gray)
		print("Enter program name:")
		term.setCursorPos(button2x,button2y+2)
		term.setBackgroundColor(colors.gray)
		print("                   ")
		term.setCursorPos(button2x,button2y+2)
		term.setTextColor(colors.lightGray)
	elseif stage == 2 then
		term.setCursorPos(button2x,button2y+1)
		term.setBackgroundColor(colors.white)
		term.setTextColor(colors.gray)
		print("Enter Pastebin code (usually after \"get\":")
		term.setCursorPos(button2x,button2y+2)
		term.setBackgroundColor(colors.gray)
		print("                   ")
		term.setCursorPos(button2x,button2y+2)
		term.setTextColor(colors.lightGray)
	elseif stage == 3 then
		term.setCursorPos(button2x,button2y+1)
		term.setBackgroundColor(colors.white)
		term.setTextColor(colors.gray)
		print("Installing program...")
	end
end

drawUi()
loadPrograms()

while true do
	drawUi()
	loadPrograms()	
	local event, button, cx, cy = os.pullEventRaw()
	if event == "mouse_click" then
		if button == 1 then
			if menu == 0 then
				if cx == button1x and cy == button1y then
					break
				elseif cx >= button2x and cx < text2:len() and cy == button2y then
					addProgram(1)
					local name = read()
					addProgram(2)
					local code = read()
					addProgram(3)
					shell.run("pastebin get "..code.." M-OS_Rebirthed/programs/"..name)
					term.setCursorPos(button2x,button2y+1)
					term.setBackgroundColor(colors.white)
					term.setTextColor(colors.gray)
					print("Successfully installed program.")
					sleep(1)
				end
				if item1exists == true then
					if cx >= item1x and cx < item1name:len() and cy == item1y then
						local files = fs.find("M-OS_Rebirthed/programs/"..item1name)
						done = false
						for _, file in ipairs(files) do
							if done == false then
								shell.run(file)
								done = true
							end
						end
					end
				end
				if item2exists == true then
					if cx >= item2x and cx < item2name:len() and cy == item2y then
						local files = fs.find("M-OS_Rebirthed/programs/"..item2name)
						done = false
						for _, file in ipairs(files) do
							if done == false then
								shell.run(file)
								done = true
							end
						end
					end
				end
				if item3exists == true then
					if cx >= item3x and cx < item3name:len() and cy == item3y then
						local files = fs.find("M-OS_Rebirthed/programs/"..item3name)
						done = false
						for _, file in ipairs(files) do
							if done == false then
								shell.run(file)
								done = true
							end
						end
					end
				end
				if item4exists == true then
					if cx >= item4x and cx < item4name:len() and cy == item4y then
						local files = fs.find("M-OS_Rebirthed/programs/"..item4name)
						done = false
						for _, file in ipairs(files) do
							if done == false then
								shell.run(file)
								done = true
							end
						end
					end
				end
				if item5exists == true then
					if cx >= item5x and cx < item5name:len() and cy == item5y then
						local files = fs.find("M-OS_Rebirthed/programs/"..item5name)
						done = false
						for _, file in ipairs(files) do
							if done == false then
								shell.run(file)
								done = true
							end
						end
					end
				end
			end
		end
	end
end