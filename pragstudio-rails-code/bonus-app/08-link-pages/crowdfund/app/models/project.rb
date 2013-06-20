class Project < ActiveRecord::Base
  def pledging_expired?
    pledging_ends_on < Date.today
  end
end
