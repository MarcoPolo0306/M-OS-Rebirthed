os.loadAPI("M-OS_Rebirthed/crypt")
local w,h = term.getSize()
local pass = fs.open("M-OS_Rebirthed/config/pass.txt", "r")
term.setBackgroundColor(colors.gray)
term.clear()

local function centerText(text)
	local x,y = term.getSize()
	local x2,y2 = term.getCursorPos()
	term.setCursorPos(math.ceil((x / 2) - (text:len() / 2)), y2)
	print(text)
end
local function writeCenterText(text)
	local x,y = term.getSize()
	local x2,y2 = term.getCursorPos()
	term.setCursorPos(math.ceil((x / 2) - (text:len() / 2)), y2)
	write(text)
end

local function drawscreen()
	term.setCursorPos(w/2+25/2,3)
	local logo = paintutils.loadImage("M-OS_Rebirthed/img/logo.img")
	paintutils.drawImage(logo,25/2,h/2-3)
	term.setCursorPos(1,h/2+3)
	term.setBackgroundColor(colors.gray)
	centerText("Welcome to M-OS")
	local versionF = fs.open("M-OS_Rebirthed/sysdata/version.syscfg", "r")
	local version = versionF:readLine()
	term.setCursorPos(0,h-2)
	centerText(version)
	term.setCursorPos(0,h-1)
	centerText("© MarcoSoft, 2016-2018")
	versionF.close()
end
drawscreen()

local password = pass.readLine()


if password == "nN8pDMGMwFPywHnaw78YYuPGPNG4xr2nZis5c6Ds4szKY3uWzqYXUU74Muej0SKtxSdFyG16kmJfGiUqxm20FwDn39ja1tgZ2DEN" then
	pass.close()
	shell.run("M-OS_Rebirthed/desktop.lua")
else
	while true do
		term.setCursorPos(1,h/2+4)
		centerText("Please your enter password:")
		term.setCursorPos(1,h/2+5)
		term.setBackgroundColor(colors.lightGray)
		writeCenterText("                      ")
		term.setCursorPos(math.ceil((w / 2) - (string.len("                      ") / 2)), h/2+5)
		status, input = pcall(read("#"))
		if crypt.encrypt(input) == password then
			term.setBackgroundColor(colors.gray)
			term.clear()
			drawscreen()
			term.setCursorPos(1,h/2+3)
			term.clearLine()
			term.setBackgroundColor(colors.gray)
			pass.close()
			centerText("Welcome!")
			sleep(2)
			term.clear()
			shell.run("M-OS_Rebirthed/desktop.lua")
		else
			drawscreen()
			term.setCursorPos(1,h/2+3)
			term.clearLine()
			term.setBackgroundColor(colors.gray)
			centerText("Password incorrect, please try again.")
		end
	end
end