class User < ActiveRecord::Base
  has_many :items , dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
          
     def items_expiring_today
       items.where('DATE(created_at) < ?', Date.today - 5.days)
     end
     
     def items_expiring_tomorrow
       items.where('DATE(created_at) = ?', Date.today - 5.days)
     end     
         
    def items_upcoming
       items.where('DATE(created_at) > ?', Date.today - 5.days)
    end
     
    
    def avatar_url(size)
     gravatar_id = Digest::MD5::hexdigest(self.email).downcase
     
     "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=mm"
    end
         
end
