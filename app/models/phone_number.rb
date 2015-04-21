class PhoneNumber < ActiveRecord::Base
	validates :contact_id, presence: true

	belongs_to :contact, polymorphic: true
end
