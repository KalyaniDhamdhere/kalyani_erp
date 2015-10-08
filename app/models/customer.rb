class Customer < ActiveRecord::Base
	has_one :order
end
