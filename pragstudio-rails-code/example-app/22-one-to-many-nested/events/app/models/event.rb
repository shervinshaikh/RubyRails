class Event < ActiveRecord::Base
  validates :name, :location, presence: true
  
  validates :description, length: { minimum: 25 }

  validates :price, numericality: { greater_than_or_equal_to: 0 }

  validates :capacity, numericality: { only_integer: true, greater_than: 0 }

  validates :image_file_name, allow_blank: true, format: {
    with:    /\w+\.(gif|jpg|png)\z/i,
    message: "must reference a GIF, JPG, or PNG image"
  }
  
  validate :price_is_a_multiple_of_fifty_cents
  
  has_many :registrations, dependent: :destroy
  
  def self.upcoming
    where('starts_at >= ?', Time.now).order(:starts_at)
  end
  
  def self.inexpensive
    where('price <= 15').order('price DESC')
  end
    
  def free?
    price.blank? || price.zero?
  end  
  
private

  def price_is_a_multiple_of_fifty_cents
    if errors[:price].empty?
      # unless (price * 100).remainder(50) == 0
      unless (price * 100) % 50 == 0
        errors[:price] << "must be a multiple of fifty cents"
      end
    end
  end

end
