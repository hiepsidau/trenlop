class Article < ActiveRecord::Base
	#them
	validates :title, :content, :published_at, :presence => true #custom validation
	validate :published_at_in_future,:title_longer_than_10
	def self.class_method_here
		
	end
	def published_at_in_future
		if self.published_at && self.published_at > Date.today 
			self.errors.add(:published_at, " should be in future")
		end
	end
	def title_longer_than_10
		if self.title && self.title.length < 10
			self.errors.add(:title," should longer than 10 char")
	end
end
