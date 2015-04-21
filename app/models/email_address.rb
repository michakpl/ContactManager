class EmailAddress < ActiveRecord::Base
	validates :address, presence: true

	belongs_to :contact, polymorphic: true
end
