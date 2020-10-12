class Rupee
    attr_reader :x, :y, :live
    def initialize(window)
        @window = window
        @rupy = Gosu::Image.new('rupee.png')
        @y = rand(44..720)
        @x = rand(170..1000)
        @live = true
        #@player = Player.new(self)
        #@score = Player.score
    end
=begin
    def update(firbreath)
        @x = rand(@window.width) + 2
        if @x < 160
            @x += 160
        end
        if @x > 980
            @x -= 50
        end
        @y = rand(@window.height)
        if @y > 720
            @y -= 60
        end
    end
=end    
#begin   
    def update(player)
        #@x = @x + 2#10(speeeeed)
        #if @x > @window.width
            #@x = 0                  #<--------------section makes it move    #WORKIN ON RUP COLLISION/COLLECTION
            #@y = rand(40..700)   
        #end
        collect_by?(player)  #<-----idr why...test it !it is what deletes objects!
    end
#end    
    
    def draw
        #@rupy.draw(@x, @y, 2) #normal
        @rupy.draw_rot(@x, @y, 2, 11 * Math.sin(Gosu.milliseconds / 222.1))#<-----spins
    end
#begin
    def collect_by?(player) #<change from hit by (in player as well)
        if Gosu::distance(player.x+44, player.y+44, @x, @y) < 42 #<------edited to have player collide instead of firebreath
            @live = false
            if @live == false
                @x = 0
                @y = 0

            end

            #@player.score = @player.score + 55    #<------doesnt work move test later
        end
    end
#end    
end   
    
    







    
=begin    
    attr_reader :x, :y, :live
    def initialize(window)
        @window = window
        @rup_image = Gosu::Image.new('shell.png')
        @y = 444
        @x = 444
        @live = true
    end
   
    def update(firebreath)

        hit_by?(firebreath)
    end
   
    def draw
        @rup_image.draw(@x, @y, 3)
        #@fimage.draw_rot(@x-16, @y-16, 2, 9999 * Math.sin(Gosu.milliseconds / 48888.1))


    end

    def hit_by?(firebreath)
        if Gosu::distance(firebreath.x, firebreath.y, @x, @y) < 20
            @live = false
        end
    end
end
=end