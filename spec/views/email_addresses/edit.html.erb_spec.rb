require 'rails_helper'

RSpec.describe "email_addresses/edit", type: :view do
  let(:person) { Person.create!(:first_name => "Bob", :last_name => "Smith") }
  let(:email_address) { EmailAddress.create!(:contact_id => person.id, :contact_type => "Person", :address => "MyString") }
  before(:each) do
    assign(:contact, person)
    assign(:email_address, email_address)
  end

  it "shows the contact's name in the title" do
    render
    assert_select("h1", text: "Editing Email Address for #{ email_address.contact }")
  end

  it "renders the edit email_address form" do
    render

    assert_select "form[action=?][method=?]", email_address_path(email_address), "post" do

      assert_select "input#email_address_contact_id[name=?]", "email_address[contact_id]"

      assert_select "input#email_address_address[name=?]", "email_address[address]"
    end
  end
end
