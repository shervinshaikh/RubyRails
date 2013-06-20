class Event < ActiveRecord::Base
  def free?
    price.blank? || price.zero?
  end
end
