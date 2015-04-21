require 'rails_helper'

RSpec.describe "phone_numbers/new", type: :view do
  let(:person) { Person.create!(:first_name => "Bob", :last_name => "Smith") }
  let(:phone_number) { PhoneNumber.new(:contact_id => person.id, :contact_type => "Person", :number => "555-8888") }
  before(:each) do
    assign(:contact, person)
    assign(:phone_number, phone_number)
  end

  it "shows the contact's name in the title" do
    render
    assert_select("h1", text: "New Phone Number for #{ phone_number.contact }")
  end

  it "renders new phone_number form" do
    render

    assert_select "form[action=?][method=?]", phone_numbers_path, "post" do

      assert_select "input#phone_number_number[name=?]", "phone_number[number]"

      assert_select "input#phone_number_contact_id[name=?]", "phone_number[contact_id]"
    end
  end
end
