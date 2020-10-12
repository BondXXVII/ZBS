require 'gosu'
require_relative 'window'
require_relative 'player'
require_relative 'enemyprojectile'
require_relative 'firebreath'
#require_relative 'stats'
#require_relative 'collectables'
require_relative 'rupee'




window = Window.new  #<---moved from window
window.show

=begin
--------------TO DO------------
`other collectibles after rup
   -based off time or score
`create timers
`finish health system   
`title screen
`menu and difficulty
`gameover continue screen
`better collision detection method
   -its super iffy right now
`refactor stats
`make proj respawn
`make inventory
`make pause
`make more levels
`make level goals or entry   


-------------TO DONE------------
`rup collision
`rup collected/disappear
`MAKE RUPS SPAWN RANDOMLY NOT SHOOT AS WELL
`MAKE RUPS ADD SCORE
`MAKE THE FN EPROJ CLEAR INSTEAD OF BECOMING INVISIBLE
`create window screen
`create player
`player spawn
`player movemeent
`load in images of player
`background
`borders
`walk animations
`stats etc score health
`projectiles tab
`projectile spawn and move
`proj collision
`proj hurt player
`gameover`
`proj spin to look better
`hearts for hp
`player shoot

=end
