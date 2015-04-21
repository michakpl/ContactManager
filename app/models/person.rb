class Person < ActiveRecord::Base
	include Contact

	validates :first_name, :last_name, presence: true

	def to_s
		"#{ last_name }, #{ first_name }"
	end

	belongs_to :user, autosave: true
end