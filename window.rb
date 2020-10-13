class Window < Gosu::Window
    attr_reader :time

    def initialize
        super(1024, 768, false)
        self.caption = 'Just testing to see if title works.....hi' #window title
        @player = Player.new(self)
        #@enemyprojectile = [TheyAimBottin.new(self), TheyAimBottin.new(self)]#same jus have to copy more in []  <---------change
        @enemyprojectile = (5).times.map {TheyAimBottin.new(self)}#same as above
        @nogameover = true
        @text = Gosu::Font.new(self, Gosu::default_font_name, 20)
        @background_image = Gosu::Image.new('bckgrd.png')
        #@stats = Status.new
        @time = 0
        @rupee = 3.times.map {Rupee.new(self)}
        #@rupee = Array.new
        #new
        @pause = false
        @title = Gosu::Image.new('title.png')
        @rupy = Gosu::Image.new('rupee.png')

    end

   
=begin   #restructure later(stops game nad can be used for items)
    def update
        if @nogameover
            if @player.hit_by? @enemyprojectile
                @nogameover = false
            else
                rungame
            end
        end
        if @nogameover == false && button_down?(Gosu::KbR) && @player.lives > 0
            @nogameover = true
            @player.reset_position
        end
    end
=end
#begin       
    def update
        if @nogameover == true 
            if @player.hit_by? (@enemyprojectile)
                if @player.hp == 0
                    @nogameover = false
                end
            elsif @player.collect_by? (@rupee)#<any hits or collects need to be represented in this update

                #rungame #<----2 spots to pick from so far(breaks when hit)
            end
            rungame  #<----may be required spot
        end
        if @nogameover == false && button_down?(Gosu::KbE) #&& @player.lives > 0
            @nogameover = true
            @player.reset_position
            @player.extralife
        end
        if button_down?(Gosu::KbJ)
            endgame  true
        end
        if rand(300) < 1 and @rupee.size < 12
            @rupee.push(Rupee.new(19824683645821658764127856120561251623))#like idek man
        end
        #if @pause == true && button_down?(Gosu::KbJ)
            #@pause = false
        #end
    end
#end
    def rungame  #<----to stop game from death/dmg
        live_ball.each {|enemyprojectile| enemyprojectile.update(@player.firebreath)}
        #newwwwwww
        live_rup.each {|rupee| rupee.update(@player.firebreath)}
        #
        @time = Gosu.milliseconds / 1000  #<---stops time but when resume it adds lost time
        #

        @player.update
    end
    def live_ball
        @enemyprojectile.select {|enemyprojectile| enemyprojectile.live == true}
        #new
        #@rupee.select {|rupee| rupee.live == true}

    end
    def live_rup
        @rupee.select {|rupee| rupee.live == true}
    end
    #def timer
        #if @nogameover == true
            #"#{@player.score = Gosu.milliseconds / 1000}"
        #end
    #end


    def draw
        @background_image.draw(0, 0, 1)
        @player.draw
        live_ball.each {|enemyprojectile| enemyprojectile.draw}
        @text.draw("HP: #{@player.hp}", 10, 10, 3, 1, 1, 0xffffffff)
        @text.draw("Score: #{@player.score}", 10, 30, 3, 1, 1, 0xffffffff)   #<----------------------keep an eye on
        @text.draw("Time: #{@time} RT:#{@player.start_time_r} HT:#{@player.start_time_h}", 10, 70, 3, 1, 1, 0xffffffff)
        @text.draw("Pos: X-#{@player.x}  Y-#{@player.y}", 10, 50, 3, 1, 1, 0xffffffff)

        #@rup_image.draw(555, 555, 2)
        live_rup.each {|rupee| rupee.draw}

    end
    def endgame
        self.close
    end
end

#window = Window.new  #<-----moved
#window.show
