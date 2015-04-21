require 'rails_helper'

RSpec.describe EmailAddress, type: :model do
  let(:person) { Person.create(:first_name => "Jimbob", :last_name => "Billy") }
  let(:email_address) { EmailAddress.new(address: 'test@example.com', contact_id: person.id, contact_type: 'Person') }

  it 'is_valid' do
  	expect(email_address).to be_valid
  end

  it 'is invalid without an address' do
  	email_address.address = nil
  	expect(email_address).to be_invalid
  end

  it 'is associated with a contact' do
  	expect(email_address).to respond_to(:contact)
  end
end
