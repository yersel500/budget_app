require 'rails_helper'

RSpec.describe 'RecipePage', type: :system do
  before :all do
    @user = User.create!(full_name: 'Babi',
                         email: 'b@g.com', password: '123456',
                         created_at: '2022-06-15 06:29:35.011315')

    @c1 = Category.create(user: User.first, name: 'school', icon: 'https://cdn-prod.voxy.com/wp-content/uploads/2012/10/school-1.jpg')
    @op1 = Operation.create(id: 111, user_id: @user.id,
                            name: 'tools', amount: 210, category_id: @c1.id)
    @op1 = Operation.create(user_id: @user.id,
                            name: 'april', amount: 220, category_id: @c1.id)
    @op1 = Operation.create(user_id: @user.id,
                            name: 'ticket', amount: 230, category_id: @c1.id)
    @op1 = Operation.create(user_id: @user.id,
                            name: 'uniform', amount: 240, category_id: @c1.id)
  end

  context 'testing' do
    before :each do
      visit root_path
      fill_in 'Email', with: 'b@g.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      page.first('.my-category').click
    end

    it 'should contain "tools"' do
      expect(page).to have_content('tools')
    end

    it 'the recipe items count should be #4' do
      count = all('.my-operation').count
      expect(count).to eq 4
    end

    it 'shoudl navigate to the recipe form page' do
      click_link 'Add new operation'
      expect(page).to have_current_path(new_user_category_operation_path(user_id: @user.id,
                                                                         category_id: @c1.id))
    end
  end
end
