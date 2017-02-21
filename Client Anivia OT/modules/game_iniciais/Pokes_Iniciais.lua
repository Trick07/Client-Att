-- Privates variables
local window = nil
local pokes = {"Pidgey", "Spearow", "Oddish", "Bellsprout", "Hoppip", "Sunkern", "Sentret", "Remoraid"} --edita a tabela... -n esquece da ordem!-
-- End privates variables

-- Public functions
function init()
   window = g_ui.loadUI('Pokes_Iniciais', modules.game_interface.getRootPanel()) 
   window:setVisible(false)  
   window:move(250,50)
   
   connect(g_game, 'onTextMessage', getParams)
   connect(g_game, { onGameStart = hide,
                     onGameEnd = hide })
end

function terminate()
   disconnect(g_game, { onGameStart = hide,
                     onGameEnd = hide })
   disconnect(g_game, 'onTextMessage', getParams)
   
   cdBarWin:destroy()
end

function getParams(mode, text)
if not g_game.isOnline() then return end
   if mode == MessageModes.Failure then 
      if string.find(text, '#cnp#') then
         window:setVisible(true)      
      end
   end
end

function click(id)
   g_game.talk("/#cnp# "..pokes[id])
   window:setVisible(false)
end

function onMiniWindowClose()
end

function hide()
   window:setVisible(false) 
end

function show()
   window:setVisible(true)
end
-- End Public functions