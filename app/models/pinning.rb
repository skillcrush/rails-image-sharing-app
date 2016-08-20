class Pinning < ActiveRecord::Base

	belongs_to :user
	belongs_to :pin
	belongs_to :board

end

