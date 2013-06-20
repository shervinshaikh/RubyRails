class Project < ActiveRecord::Base
  validates :name, presence: true
  
  validates :description, presence: true, length: { maximum: 500 }

  validates :target_pledge_amount, numericality: { greater_than: 0 }

  has_many :pledges, dependent: :destroy

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

  def total_amount_pledged
    pledges.sum(:amount) || 0
  end

  def amount_outstanding
    target_pledge_amount - total_amount_pledged
  end

  def funded?
    amount_outstanding <= 0
  end
end
