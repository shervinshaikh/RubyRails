class Pledge < ActiveRecord::Base
  belongs_to :project

  validates :name, :email, presence: true

  validates :email, format: { with: /(\S+)@(\S+)/ }
  
  AMOUNT_LEVELS = [25.00, 50.00, 100.00, 200.00, 500.00]

  validates :amount, inclusion: { in: AMOUNT_LEVELS }
end
