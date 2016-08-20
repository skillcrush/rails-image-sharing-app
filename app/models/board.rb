class Board < ActiveRecord::Base
  validates_presence_of :name
  
  belongs_to :user
  has_many :pinnings
  has_many :pins, through: :pinnings
end
