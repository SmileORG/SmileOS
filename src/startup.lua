_G.lang = {}
_G.lang.login = {}
_G.config = {}
_G.config.ssh = {}
pcall(dofile,"os.config")
pcall(dofile,"lang/"..config.lang..".lang")
os.loadAPI("apis/sha256")
term.setBackgroundColor(colors.white)
term.setTextColor(colors.black)
function os.version()
  return "SmileOS 0.1A"
end
local parent = term.current()
function term.restore()
  term.redirect(parent)
end
term.clear()
term.setCursorPos(5,5)
term.write(lang.boot)
sleep(3)
while true do
term.setBackgroundColor(colors.white)
term.clear()
local w = window.create(term.current(),5,5,15,10)
term.redirect(w)
term.setBackgroundColor(colors.lightGray)
term.clear()
term.setCursorPos(1,1)
term.setBackgroundColor(colors.blue)
term.clearLine()
term.setTextColor(colors.white)
term.write(lang.login.title)
term.setBackgroundColor(colors.lightGray)
term.setTextColor(colors.black)
term.setCursorPos(2,3)
term.write(lang.login.user)
term.setCursorPos(2,7)
term.write(lang.login.pass)
term.setCursorPos(2,5)
term.setBackgroundColor(colors.gray)
term.write("         ")
term.setCursorPos(2,9)
term.write("         ")
term.setCursorPos(2,5)
local user = read()
term.setCursorPos(2,9)
local pass = read("*")
term.restore()
term.setCursorPos(1,1)
if sha256.hash(pass) == config.pass and user == config.user then
  return
end
end
