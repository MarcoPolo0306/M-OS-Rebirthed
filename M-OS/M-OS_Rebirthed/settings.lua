local w,h = term.getSize()
os.loadAPI("M-OS_Rebirthed/crypt")
menu = 0

local button1x, button1y = 1,1
local text1 = "X"

local button2x, button2y = 2,5
local text2 = " Change Password "

local button3x, button3y = 2,9
local text3 = " Change Desktop Background "

local button4x, button4y = 2,13
local text4 = " System Info "

local backArrowX, backArrowY = 3,1
local backArrowText = "<-"

--COLORS
local redX, redY = 2,5
local orangeX, orangeY = 4,5
local yellowX, yellowY = 6,5
local limeX, limeY = 8,5
local greenX, greenY = 10,5
local cyanX, cyanY = 12,5
local lightBlueX, lightBlueY = 14,5
local blueX, blueY = 16,5
local magentaX, magentaY = 18,5
local pinkX, pinkY = 20,5
local purpleX, purpleY = 22,5
local brownX, brownY = 24,5
local lightGrayX, lightGrayY = 26,5
local grayX, grayY = 28,5
local blackX, blackY = 30,5

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
	centerText("Settings")
	term.setBackgroundColor(colors.red)
	term.setTextColor(colors.white)
	term.setCursorPos(button1x,button1y)
	print(text1)
end

local function drawSettings()
	menu = 0
	-------------------
	term.setBackgroundColor(colors.white)
	term.setTextColor(colors.gray)
	term.setCursorPos(1,3)
	centerText("Security")
	term.setCursorPos(button2x, button2y)
	term.setBackgroundColor(colors.gray)
	term.setTextColor(colors.lightGray)
	print(text2)
	-------------------
	term.setCursorPos(1,7)
	term.setBackgroundColor(colors.white)
	term.clearLine()
	term.setTextColor(colors.gray)
	centerText("Appearance")
	term.setCursorPos(button3x, button3y)
	term.setBackgroundColor(colors.gray)
	term.setTextColor(colors.lightGray)
	print(text3)
	-------------------
	term.setBackgroundColor(colors.white)
	term.setTextColor(colors.gray)
	term.setCursorPos(1,11)
	term.clearLine()
	centerText("System")
	term.setCursorPos(button4x, button4y)
	term.setBackgroundColor(colors.gray)
	term.setTextColor(colors.lightGray)
	print(text4)
	term.setCursorPos(0,h-1)
	term.setBackgroundColor(colors.white)
	term.setTextColor(colors.lightGray)
	centerText("Some settings may not take effect until rebooting.")
end

local function drawPasswordPrompt(stage)
	if stage == 1 then
		term.setCursorPos(2,7)
		term.setBackgroundColor(colors.white)
		term.setTextColor(colors.gray)
		print("Please enter your new password:")
		term.setCursorPos(2,8)
		term.setBackgroundColor(colors.gray)
		term.setTextColor(colors.lightGray)
		print("                               ")
	elseif stage == 2 then
		term.setCursorPos(2,7)
		term.setBackgroundColor(colors.white)
		term.clearLine()
		term.setTextColor(colors.gray)
		print("Password successfully changed.")
		term.setCursorPos(2,8)
		term.clearLine()
		sleep(1)
		drawUi()
		drawSettings()
	end
end

local function changeColor()
	menu = 1
	term.clear()
	drawUi()
	term.setCursorPos(1,3)
	term.setBackgroundColor(colors.white)
	term.clearLine()
	term.setTextColor(colors.gray)
	centerText("Change Desktop Color")
	term.setCursorPos(redX,redY)
	term.setBackgroundColor(colors.red)
	print(" ")
	term.setCursorPos(orangeX,orangeY)
	term.setBackgroundColor(colors.orange)
	print(" ")
	term.setCursorPos(yellowX,yellowY)
	term.setBackgroundColor(colors.yellow)
	print(" ")
	term.setCursorPos(limeX,limeY)
	term.setBackgroundColor(colors.lime)
	print(" ")
	term.setCursorPos(greenX,greenY)
	term.setBackgroundColor(colors.green)
	print(" ")
	term.setCursorPos(cyanX,cyanY)
	term.setBackgroundColor(colors.cyan)
	print(" ")
	term.setCursorPos(lightBlueX,lightBlueY)
	term.setBackgroundColor(colors.lightBlue)
	print(" ")
	term.setCursorPos(blueX,blueY)
	term.setBackgroundColor(colors.blue)
	print(" ")
	term.setCursorPos(magentaX,magentaY)
	term.setBackgroundColor(colors.magenta)
	print(" ")
	term.setCursorPos(purpleX,purpleY)
	term.setBackgroundColor(colors.purple)
	print(" ")
	term.setCursorPos(pinkX,pinkY)
	term.setBackgroundColor(colors.pink)
	print(" ")
	term.setCursorPos(brownX,brownY)
	term.setBackgroundColor(colors.brown)
	print(" ")
	term.setCursorPos(grayX,grayY)
	term.setBackgroundColor(colors.gray)
	print(" ")
	term.setCursorPos(lightGrayX,lightGrayY)
	term.setBackgroundColor(colors.lightGray)
	print(" ")
	term.setCursorPos(blackX,blackY)
	term.setBackgroundColor(colors.black)
	print(" ")
	term.setCursorPos(backArrowX, backArrowY)
	term.setBackgroundColor(colors.lightGray)
	term.setTextColor(colors.gray)
	print("<-")
	term.setCursorPos(0,h-1)
	term.setBackgroundColor(colors.white)
	term.setTextColor(colors.lightGray)
	centerText("Some settings may not take effect until rebooting.")
end

local function sysInfo()
	menu = 2
	term.clear()
	drawUi()
	term.setCursorPos(1,3)
	term.setBackgroundColor(colors.white)
	term.clearLine()
	term.setTextColor(colors.gray)
	centerText("System Info")
	local image = paintutils.loadImage("M-OS_Rebirthed/img/logo.img")
	local versionF = fs.open("M-OS_Rebirthed/sysdata/version.syscfg","r")
	local version = versionF.readLine()
	local releaseDateF = fs.open("M-OS_Rebirthed/sysdata/releasedate.syscfg","r")
	local releaseDate = releaseDateF.readLine()
	paintutils.drawImage(image,25/2,5)
	term.setCursorPos(0,11)
	term.setTextColor(colors.gray)
	term.setBackgroundColor(colors.white)
	centerText(version)
	term.setCursorPos(0,12)
	centerText("Released "..releaseDate)
	term.setCursorPos(0,14)
	centerText("Thanks to:")
	term.setCursorPos(0,15)
	centerText("valithor")
	term.setCursorPos(0,17)
	centerText("© MarcoSoft, 2016-2018")
	term.setCursorPos(backArrowX, backArrowY)
	term.setBackgroundColor(colors.lightGray)
	term.setTextColor(colors.gray)
	print("<-")
end

local function changedColor()
	term.setCursorPos(2,7)
	term.setBackgroundColor(colors.white)
	term.setTextColor(colors.gray)
	print("Successfully changed desktop background color.")
	sleep(1)
	term.clear()
	drawUi()
	changeColor()
end

drawUi()
drawSettings()

while true do
	local event, button, cx, cy = os.pullEventRaw()
	if event == "mouse_click" then
		if button == 1 then
			if menu == 0 then
				if cx == button1x and cy == button1y then
					break
				elseif cx >= button2x and cx < text2:len() and cy == button2y then
					drawPasswordPrompt(1)
					term.setCursorPos(2,8)
					message = read("#")
					local pass = fs.open("M-OS_Rebirthed/config/pass.txt", "w")
					if message == "" then
						pass.write("nN8pDMGMwFPywHnaw78YYuPGPNG4xr2nZis5c6Ds4szKY3uWzqYXUU74Muej0SKtxSdFyG16kmJfGiUqxm20FwDn39ja1tgZ2DEN") --The random text is so people wont just enter a normal password, like "nopassword" and it being no password. Also, the password is longer to prevent this even more.
						pass.close()
						drawPasswordPrompt(2)
					else
						pass.write(crypt.encrypt(message))
						pass.close()
						drawPasswordPrompt(2)
					end
				elseif cx >= button3x and cx < text3:len() and cy == button3y then
					changeColor()
				elseif cx >= button4x and cx < text4:len() and cy == button4y then
					sysInfo()
				end
			elseif menu == 1 then
				if cx == button1x and cy == button1y then
					break
				elseif cx == redX and cy == redY then
					local color = fs.open("M-OS_Rebirthed/config/desktop-background-color.config", "w")
					color.write("e")
					color.close()
					changedColor()
				elseif cx == orangeX and cy == orangeY then
					local color = fs.open("M-OS_Rebirthed/config/desktop-background-color.config", "w")
					color.write("1")
					color.close()
					changedColor()
				elseif cx == yellowX and cy == yellowY then
					local color = fs.open("M-OS_Rebirthed/config/desktop-background-color.config", "w")
					color.write("4")
					color.close()
					changedColor()
				elseif cx == limeX and cy == limeY then
					local color = fs.open("M-OS_Rebirthed/config/desktop-background-color.config", "w")
					color.write("5")
					color.close()
					changedColor()
				elseif cx == greenX and cy == greenY then
					local color = fs.open("M-OS_Rebirthed/config/desktop-background-color.config", "w")
					color.write("d")
					color.close()
					changedColor()
				elseif cx == cyanX and cy == cyanY then
					local color = fs.open("M-OS_Rebirthed/config/desktop-background-color.config", "w")
					color.write("9")
					color.close()
					changedColor()
				elseif cx == lightBlueX and cy == lightBlueY then
					local color = fs.open("M-OS_Rebirthed/config/desktop-background-color.config", "w")
					color.write("3")
					color.close()
					changedColor()
				elseif cx == blueX and cy == blueY then
					local color = fs.open("M-OS_Rebirthed/config/desktop-background-color.config", "w")
					color.write("b")
					color.close()
					changedColor()
				elseif cx == magentaX and cy == magentaY then
					local color = fs.open("M-OS_Rebirthed/config/desktop-background-color.config", "w")
					color.write("2")
					color.close()
					changedColor()
				elseif cx == pinkX and cy == pinkY then
					local color = fs.open("M-OS_Rebirthed/config/desktop-background-color.config", "w")
					color.write("6")
					color.close()
					changedColor()
				elseif cx == purpleX and cy == purpleY then
					local color = fs.open("M-OS_Rebirthed/config/desktop-background-color.config", "w")
					color.write("a")
					color.close()
					changedColor()
				elseif cx == brownX and cy == brownY then
					local color = fs.open("M-OS_Rebirthed/config/desktop-background-color.config", "w")
					color.write("c")
					color.close()
					changedColor()
				elseif cx == lightGrayX and cy == lightGrayY then
					local color = fs.open("M-OS_Rebirthed/config/desktop-background-color.config", "w")
					color.write("8")
					color.close()
					changedColor()
				elseif cx == grayX and cy == grayY then
					local color = fs.open("M-OS_Rebirthed/config/desktop-background-color.config", "w")
					color.write("7")
					color.close()
					changedColor()
				elseif cx == blackX and cy == blackY then
					local color = fs.open("M-OS_Rebirthed/config/desktop-background-color.config", "w")
					color.write("f")
					color.close()
					changedColor()
				elseif cx >= backArrowX and cy == backArrowY then
					drawUi()
					drawSettings()
				end
			elseif menu == 2 then
				if cx == button1x and cy == button1y then
					break
				elseif cx >= backArrowX and cy == backArrowY then
					drawUi()
					drawSettings()
				end
			end
		end
	end
end