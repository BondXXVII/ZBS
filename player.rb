require 'gosu'
require_relative 'rupee'
class Player
    attr_reader :hp, :x, :y, :firebreath, :score, :start_time_r, :start_time_h
    def initialize(window)
        @window = window
        @walkL1, @standL, @walkL2, @walkR1, @standR, @walkR2 = Gosu::Image.load_tiles('walkLR.png', 88, 88)
        @walkD1, @standD, @walkD2, @walkU1, @standU, @walkU2 = Gosu::Image.load_tiles('walkUD.png', 88, 88)
        @image = Gosu::Image.new('WD.png')
        @heart = Gosu::Image.new('heart.png')
        @x = 650
        @y = 450#window.height - 80
        @damaged = Gosu::Image.new('shell.png')
        @hurt = false
        @hp = 120 #<------------might change to use life system or both
        @firebreath = Shoot.new(self, @window)
        @score = 0
        #@p = 0
        @collectR = false
        @rupAnim = false
        @hurtAnim = false
        @start_time_r = 0
        @start_time_h = 0
        @sparkle = Gosu::Image.new('sparkle.png')
        @temp_x = 0
        @temp_y = 0
    end
    
    def update
        if Gosu.button_down?(Gosu::KbW)  #elsif instead of ifs for + movements only, no diagonals
            move_up
        #end
        elsif @window.button_down?(Gosu::KbS)  #Gosu.button or @window.button works so far
            move_down
        #end
        elsif @window.button_down?(Gosu::KbA) #had to add window after moving "move" to player instead of window
            move_left
        #end
        elsif @window.button_down?(Gosu::KbD)  #<needs ?s to read input
            move_right
        end
        if @window.button_down?(Gosu::KbSpace)
            @firebreath.shoot
        end
        @firebreath.update
        #@hearttimer -= @time
    end

    def move_up
        @y = @y - 3#movement speed
        if @y < 0
            @y = 0
        end
        @image = (Gosu.milliseconds / 277 % 2 == 0)? @walkU1 : @walkU2
    end
    def move_down
        @y = @y + 3
        if @y > @window.height - 112
            @y = @window.height - 112
        end
        @image = (Gosu.milliseconds / 277 % 2 == 0)? @walkD1 : @walkD2
    end
    def move_left
        @x = @x - 3
        if @x < 160
            @x = 160
        end
        @image = (Gosu.milliseconds / 277 % 2 == 0)? @walkL1 : @walkL2
    end
    def move_right
        @x = @x + 3
        if @x > @window.width - 88
            @x = @window.width - 88
        end
        @image = (Gosu.milliseconds / 277 % 2 == 0)? @walkR1 : @walkR2
    end

    def draw
        if @hurtAnim
            if Gosu.milliseconds - @start_time_h < 300
                @damaged.draw(@x, @y, 3)
            else
                @hurtAnim = false
            end
        #elsif @rupeAnim
            #if @window.time - @start_time < 3    #Gosu.milliseconds/1000 - @start_time < 4

                #@sparkle.draw(@x, @y, 1) # for length of 1000 Gosu.milliseconds
            ##sleep(0.1)#<---pauses whole game...............
            #else
                #@rupeAnim = false
            #end
        else
            @image.draw(@x, @y, 2)
            @firebreath.draw
        end
        if @rupAnim
            if Gosu.milliseconds - @start_time_r < 120
                @sparkle.draw(@temp_x-22, @temp_y-22, 1)
            else
                @rupAnim = false
            end
        end

        #newwwwwwwwwwwwwww
        #(1..5).each do
            #@heart.draw(55, 55+@p, 3)#<^----all this can make clouds fly over screen etc
            #@p += 0.1
        #end
        if @hp > 0
            @heart.draw(150, 20, 6)
        end
        if @hp > 40
            @heart.draw(200, 20, 6)
        end
        if @hp > 80
            @heart.draw(250, 20, 6)
        end

    end

=begin
    def collect_by?(rupee)
        rupee.reject! do |rupee|    
            if Gosu::distance(@x, @y, rupee.x, rupee.y) < 44
                @score += 777  
            end
        end
    end
=end
    def hit_by?(enemyprojectile)
        @hurt = enemyprojectile.any? {|enemyprojectile| Gosu::distance(enemyprojectile.x, enemyprojectile.y, @x+88, @y+88) < 42}

        if @hurt
            @hp = @hp - 20
            @start_time_h = Gosu.milliseconds
            @hurtAnim = true
            #@score += 11  #<-------------works for score
        end
    end
#begin
=begin     def hit_by?(rupee)#does enemyproj if hitby
        rupee.reject! do |rupee|
            if Gosu::distance(rupee.x, rupee.y, @x, @y) < 44 then
                @score = @score + 222222
                true
            else
                false
            end
=end        #@collectR = rupee.any? {|rupee| Gosu::distance(rupee.x, rupee.y, @x, @y) < 44}
        #if @collectR
            #@hp2 += 20 #<---------------------fixed by changing def from hitby to collectby
            #@score2 += 22222 #<---------- does not work yet...  took the place of enemyprojs....fix it(back to norml if # out rup section)
        #end
    #end
#end
#begin
    def collect_by?(rupee)
        @collectR = rupee.any? {|rupee| Gosu::distance(rupee.x, rupee.y, @x+44, @y+44) < 42}
        if @collectR
            #@hp = @hp + 200 #<-----
            @score += 255 #<---------- does not work yet...  took the place of enemyprojs....fix it(back to norml if # out rup section)
            @start_time_r = Gosu.milliseconds
            @temp_x = @x
            @temp_y = @y
            @rupAnim = true
        end
    end
#end    
    def reset_position  #<--------------------------change for spawn reset
        @x = rand(700..900)
        @y = rand(500.700)
    end
    def extralife
        @hp += 120
    end

    #def lives
        #"#{@lives}" # attr removed the need for this im thinkin
    #end
end