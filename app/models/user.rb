class User < ActiveRecord::Base
  has_many :items
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
        
        
   
    def items_expiring_today
      items.where('DATE(created_at) <= ?', Date.today - 5.days)
    end
    
    def items_expiring_tomorrow
      items.where('DATE(created_at) = ?', Date.today - 5.days)
    end
    
    def items_upcoming
      items.where('DATE(created_at) > ?', Date.today - 5.days)
    end
    
        #I tried this but, it didn'y seem to work.
    # scope :items_expiring_today, -> {
    #   where('DATE(created_at) = ?', Date.today - 6.days)
    # }
    
    # scope :items_expiring_tomorrow, -> {
    #   where('DATE(created_at) > ?', Date.today - 5.days)
    # }
    
    # scope :items_upcoming, -> {
    # where('DATE(created_at) > ?', Date.today - 5.days) 
    # }    
         
  
end