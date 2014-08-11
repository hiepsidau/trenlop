class Coarse < ActiveRecord::Base
	has_many :registrations
	has_many :students, :througj => :registrations
	#has_many :student_registers,:class_name =>'Registration'
	#has_many :students, :through => :student_register
end
