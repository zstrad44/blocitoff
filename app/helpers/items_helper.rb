module ItemsHelper
     def change_days(item)
        days = item.days_to_expire
        date = DateTime.now.in_time_zone("Pacific Time (US & Canada)").at_beginning_of_day
        expire = nil
        
        case days
        when 1
          expire = date - (5.days + 6.hours)
        when 2
          expire = date - (4.days + 6.hours)
        when 3
          expire = date - (3.days + 6.hours)
        when 4
          expire = date - (2.days + 6.hours)
        when 5
          expire = date - (1.days + 6.hours)
        when 6
          expire = date - 6.hours
        when 7
          expire = DateTime.now.in_time_zone("Pacific Time (US & Canada)")
        else
          expire = item.created_at
        end
        
        item.created_at = expire
        return item.save!
      end
    
end
