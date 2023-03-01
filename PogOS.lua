os.pullEvent = os.pullEventRaw
 
local w,h = term.getSize()
 
function printCentered( y,s )
   local x = math.floor((w - string.len(s)) / 2)
   term.setCursorPos(x,y)
   term.clearLine()
   term.write( s )
end
 
local nOption = 1
 
local function drawMenu()
   term.clear()
   term.setCursorPos(1,1)
   term.write("PogOS")
term.setCursorPos(1,2)
term.write("Owned by Dmoz_")
-- PogOS is hidden by defualt if you want to access it just do edit .PogOS
   term.setCursorPos(w-11,1)
   if nOption == 1 then
   term.write("Commands")
elseif nOption == 2 then
   term.write("Programs")
elseif nOption == 3 then
   term.write("Shutdown")
end
 
end


term.clear()
local function drawFrontend()
   printCentered( math.floor(h/2) - 3, "")
   printCentered( math.floor(h/2) - 2, "Start Menu" )
   printCentered( math.floor(h/2) - 1, "")
   printCentered( math.floor(h/2) + 0, ((nOption == 1) and "[ Command  ]") or "Command" )
   printCentered( math.floor(h/2) + 1, ((nOption == 2) and "[ Programs ]") or "Programs" )
   printCentered( math.floor(h/2) + 2, ((nOption == 3) and "[ Shutdown ]") or "Shutdown" )
   printCentered( math.floor(h/2) + 3, "")
end
 

drawMenu()
drawFrontend()
 
while true do
 local e,p = os.pullEvent()
 if e == "key" then
  local key = p
  if key == 17 or key == 200 then
 
   if nOption > 1 then
    nOption = nOption - 1
    drawMenu()
    drawFrontend()
   end
  elseif key == 31 or key == 208 then
  if nOption < 4 then
  nOption = nOption + 1
  drawMenu()
  drawFrontend()
end
elseif key == 28 then
break
end 
end
end
term.clear()
 
if nOption  == 1 then
shell.run("ios/.command")
elseif nOption == 2 then
shell.run("ios/.programs")
elseif nOption == 3 then
os.shutdown()
else
shell.run("ios/.UninstallDialog")
end