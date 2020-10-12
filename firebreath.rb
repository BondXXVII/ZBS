class Shoot
    attr_reader :x, :y
    def initialize(player, window)
        @player = player
        @window = window
        @shooting = false
        @x = @player.x
        @y = @player.y
        @bimage = Gosu::Image.new('shootfb.png')
    end
   
    def shoot
        @shooting = true
    end

    def update
        if @shooting
            @x = @x - 10
            if @x < -60
                @shooting = false
            end
        else
            @x = @player.x
            @y = @player.y
        end
    end

    def draw
        if @shooting
            @bimage.draw(@x+20, @y+20, 5)# add 20(amount of pixels) to center the shot
        else
            @bimage.draw(-55, -55, 1)
        end
    end
end
