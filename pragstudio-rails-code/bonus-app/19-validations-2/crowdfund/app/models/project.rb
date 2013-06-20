class Project < ActiveRecord::Base
  validates :name, presence: true
  
  validates :description, presence: true, length: { maximum: 500 }

  validates :target_pledge_amount, numericality: { greater_than: 0 }

  validates :website, format: {
    with: /https?:\/\/[\S]+\b/i,
    message: "must reference a valid URL"
  }
  
  validates :image_file_name, format: {
    with: /\w+\.(gif|jpg|png)\z/i,
    message: "must reference a GIF, JPG, or PNG image"
  }

  def self.accepting_pledges
    where("pledging_ends_on >= ?", Time.now).order("pledging_ends_on asc")
  end

  def pledging_expired?
    pledging_ends_on < Date.today
  end
end
