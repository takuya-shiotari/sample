RSpec.describe 'Posts' do
  describe 'test' do
    let(:alias_item_category) { create(:alias_item_category) }

    scenario 'post' do
      visit posts_path
      click_link 'New Post'

      fill_in 'post[title]', with: 'Test Title'
      fill_in 'post[body]', with: 'Test Body'
      click_button 'Create Post'

      expect(page).to have_content 'Test Title'
      expect(page).to have_content 'Test Body'
      click_link 'Back'

      visit posts_path
      expect(page).to have_content 'Test Title'
    end
  end
end
