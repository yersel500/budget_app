require 'rails_helper'

RSpec.describe 'CategoriesPage', type: :system do
  before :all do
    @user = User.create!(full_name: 'Babi',
                         email: 'b@g.com', password: '123456',
                         created_at: '2022-06-15 06:29:35.011315')

    Category.create(id: 110, user: User.first, name: 'school', icon: 'https://cdn-prod.voxy.com/wp-content/uploads/2012/10/school-1.jpg')
    Category.create(user: User.first, name: 'health', icon: 'https://cdn-prod.voxy.com/wp-content/uploads/2012/10/school-1.jpg')
    Category.create(user: User.first, name: 'loan', icon: 'https://cdn-prod.voxy.com/wp-content/uploads/2012/10/school-1.jpg')
    Category.create(user: User.first, name: 'Electricity', icon: 'https://cdn-prod.voxy.com/wp-content/uploads/2012/10/school-1.jpg')
  end

  context 'testing' do
    before :each do
      visit root_path
      fill_in 'Email', with: 'b@g.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
    end

    it 'should contain "school"' do
      expect(page).to have_content('school')
    end

    it 'the categories items count should be #4' do
      count = all('.my-icon').count
      expect(count).to eq 4
    end

    it 'should navigate to the category form page' do
      click_link 'Create New Category'
      expect(page).to have_current_path(new_user_category_path(user_id: @user.id))
    end
  end
end
