class User < ActiveRecord::Base
	#active record relationship
	validates :name, :email, :presence => true
	has_one :profile,:foreign_key => 'customer_id' #tao khoa ngoai,apidock..class method..option
end
