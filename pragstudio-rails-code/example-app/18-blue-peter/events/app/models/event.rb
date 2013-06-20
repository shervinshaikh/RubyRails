class Event < ActiveRecord::Base
  
  def self.upcoming
    where('starts_at >= ?', Time.now).order(:starts_at)
  end
  
  def self.inexpensive
    where('price <= 15').order('price DESC')
  end
    
  def free?
    price.blank? || price.zero?
  end  

end
