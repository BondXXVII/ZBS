class TheyAimBottin
    attr_reader :x, :y, :live
    def initialize(window)
        @window = window
        @fimage = Gosu::Image.new('fireball.png')
        @y = -160  #<-------------------------------have to change start otherwise you get hit from its spawn(nothing there)
        @x = rand(@window.width)
        @live = true
        #@player = Player.new(self)
    end
   
    def update(firebreath)
        @x = @x + 5#10(speeeeed)
        if @x > @window.width
            @x = 0
            @y = rand(@window.height-50)   
        end
        hit_by?(firebreath)  #<-----idr why...test it
    end
   
    def draw
        #@fimage.draw(@x, @y, 3)
        @fimage.draw_rot(@x-16, @y-16, 2, 9999 * Math.sin(Gosu.milliseconds / 48888.1))#<-----spins projs
    end

    def hit_by?(firebreath)
        if Gosu::distance(firebreath.x, firebreath.y, @x-88, @y-88) < 48
            @live = false
            if @live == false
                @x = 0
                @y = 0

            end
            #@player.score += 55    #<------doesnt work move test later
        end
    end
end