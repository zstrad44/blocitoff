module ApplicationHelper
    
    def greet
      Time.zone = 'MST'
      the_time = Time.zone.now
      today = Date.today.to_time
      
    
      morning = today.beginning_of_day
      noon = today.noon
      evening = today.change( hour: 17 )
      night = today.change( hour: 20 )
      tomorrow = Date.tomorrow.to_time
    
      if (morning..noon).cover? the_time
        'Good Morning'
      elsif (noon..evening).cover? the_time
        'Good Afternoon'
      elsif (evening..night).cover? the_time
        'Good Evening'
      elsif (night..tomorrow).cover? the_time
        'Good Night'
      end
    end
    
    def time 
       Time.zone = 'Arizona'
       the_time = Time.zone.now.strftime("%l:%m %p")
       
       return the_time
    end
    
    def days_left(item)
      
      return distance_of_time_in_words(item.created_at + 7.days, Time.now)
    end
    
end


