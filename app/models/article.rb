class Article < ActiveRecord::Base
	#them 
	has_many :user_comment, :class_name => 'comment' #doi truong tim kiem
	#:dependence
	#:counter_cache =>true//dem tren cache khong dem tren database
	validates :title, :content, :published_at, :presence => true #custom validation
	validate :published_at_in_future,:title_longer_than_10, :on 
	def self.class_method_here
		puts 'ss'
	end
	def published_at_in_future
		if self.published_at && self.published_at > Date.today 
			self.errors.add(:published_at, " should be in future")
		end
	end
	def title_longer_than_10
		if self.title && self.title.length < 10
			self.errors.add(:title," should longer than 10 char")
			#aaaaaaaaaaaaaaaa
	end
end
#rails c
#b = Article.new
#b.save
#b,body = 'test 1'
#b.publish_at
#b.save
#Date.today +2.day
#a2 = Article.create(title:'article 2',body:'article 2',publish_at:Date)
#a2.attributes
#a2.save
#Article.find(:all,:condition =>{:title =>'article 2' })
#Article.find(2) #chi find id
#Article.find(:title => 'test2')
#Article.find_by_title('test') //missing method,khong can phai defind,tu dong tao ham
#Article.first
#Article.where(:id = 1) // co the su dung cau lenh sql trong () 
#a1=article.first
#a1.title = "article 1"
#a1.save
#Article.where(["id > ?",4]).destroy
#*************Fat model *******************#
#a1 = article.first
#tao model comment
#rails g model comment article_id:integer body:string
#has_many :comments //them vao model comment
#a1.comment.create(:body => 'day la comment dau tien')
#comment = Comment.first
#**class comment**#
#    belongs_to //1 nhieu
#has_and_belongs_to_many
#User.new(:name)
#tao comment
#u.profile
#tao column counter_cache rails g migration add_comment_count_cache_to
#rails tu tao bang join 2 bang khi co quan he nhieu nhieu VD tb lop,tb hs ==> lop_hs
#tao bang categories va articles_categories //rails g model ........
#category.articles.create(:title =>'',:body =>'body',:published_at => '')
#tao bang student,coarse,registration
#Student.crete(:name => 'aaaa')
#student = Student.first //loi 