require 'rails_helper'
require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the companies view', type: :feature do

	context 'when logged in' do
		let(:user) { Fabricate(:user) }

		it 'displays companies associated with the user' do
			company_1 = Fabricate(:company)
			company_1.user = user
			company_1.save
			login_as user
			visit(companies_path)
			expect(page).to have_text(company_1.to_s)
		end

		it 'does not display companies associated with another user' do
			user_2 = Fabricate(:user)
			company_2 = Fabricate(:company)
			company_2.user = user_2
			company_2.save
			login_as user
			visit(companies_path)
			expect(page).not_to have_text(company_2.to_s)
		end
	end

end