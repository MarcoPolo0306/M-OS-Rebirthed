local w,h = term.getSize()
term.setBackgroundColor(colors.gray)
term.clear()
local logo = paintutils.loadImage("M-OS_Rebirthed/img/logo.img")

local function centerText(text)
	local x,y = term.getSize()
	local x2,y2 = term.getCursorPos()
	term.setCursorPos(math.ceil((x / 2) - (text:len() / 2)), y2)
	print(text)
end

local function slowWriteCenter(text,persec)
	local x,y = term.getSize()
	local x2,y2 = term.getCursorPos()
	term.setCursorPos(math.ceil((x / 2) - (text:len() / 2)), y2)
	textutils.slowWrite(text,persec)
end

local versionF = fs.open("M-OS_Rebirthed/sysdata/version.syscfg","r")
local version = versionF:readLine()

local function drawLogoIn()
	local requiredPos = h/2-3
	local currentPos = -6
	while true do
		term.setCursorPos(0,h-2)
		centerText(version)
		term.setCursorPos(0,h-1)
		centerText("© MarcoSoft, 2016-2018")
		paintutils.drawImage(logo,25/2,currentPos)
		currentPos = currentPos + 1
		sleep(0.1)
		if currentPos >= requiredPos then
			break
		end
		term.setBackgroundColor(colors.gray)
		term.clear()
	end
end

term.setCursorPos(0,h-2)
centerText(version)
term.setCursorPos(0,h-1)
centerText("© MarcoSoft, 2016-2018")
drawLogoIn()
paintutils.drawImage(logo,25/2,h/2-3)
term.setCursorPos(w/2+25/2,3)
term.setBackgroundColor(colors.gray)
term.setTextColor(colors.white)
term.setCursorPos(0,h/2+3)
centerText("Checking for updates...")
term.setTextColor(colors.gray)
fs.delete("M-OS_Rebirthed/sysdata/versionNum-download.syscfg")
shell.run("pastebin get aPfGT2y8 M-OS_Rebirthed/sysdata/versionNum-download.syscfg")
local curVersionF = fs.open("M-OS_Rebirthed/sysdata/versionNumber.syscfg","r")
local newVerF = fs.open("M-OS_Rebirthed/sysdata/versionNum-download.syscfg","r")
local curVersion = curVersionF.readLine()
local newVer = newVerF.readLine()

if fs.exists("Updater") then
	fs.delete("Updater")
end

if  newVer ~= curVersion then
	term.setCursorPos(0,h/2+3)
	term.clearLine()
	term.setTextColor(colors.white)
	centerText("Update found!")
	sleep(0.5)
	centerText("Installing update...")
	shell.run("pastebin run 4h6KcvVX")
else
	term.setCursorPos(0,h/2+3)
	term.clearLine()
	term.setTextColor(colors.white)
	centerText("No update found.")
	sleep(0.25)
end

term.setCursorPos(0,h/2+3)
term.clearLine()
term.setTextColor(colors.white)
slowWriteCenter("Welcome to M-OS",25)
sleep(0.5)
shell.run("M-OS_Rebirthed/logon.lua")
