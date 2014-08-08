class Article < ActiveRecord::Base
	#them
	validates :title, :content, :presence => true
	validates :published_at_in_future
	def published_at_in_future
		if selg.published_at > Date.today
			self.errors.add(:published_at, "Published at should be")
			
		end
	end
end
