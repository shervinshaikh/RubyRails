class Project < ActiveRecord::Base
  validates_presence_of :name, :description

  validates_length_of :description, maximum: 500

  validates_numericality_of :target_pledge_amount, greater_than: 0

  validates_format_of :website,
      with: /https?:\/\/[\S]+\b/i,
      message: "must reference a valid URL"

  validates_format_of :image_file_name,
      with: /\w+\.(gif|jpg|png)\z/i,
      message: "must reference a GIF, JPG, or PNG image"

  has_many :pledges, dependent: :destroy

  def self.accepting_pledges
    where("pledging_ends_on >= ?", Time.now).order("pledging_ends_on asc")
  end

  def pledging_expired?
    pledging_ends_on < Date.today
  end
end
