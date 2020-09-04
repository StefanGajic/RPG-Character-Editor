# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CharacterType, type: :model do
  before(:each) do
    @user = FactoryBot.create(:user,
                              email: 'test@test.com',
                              username: 'test_username',
                              password: 'super_secret')
  end

  subject do
    described_class.new(id: 1,
                        name: 'Test',
                        user_id: @user.id,
                        created_at: DateTime.now,
                        updated_at: DateTime.now + 1.week)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    character_type = CharacterType.new(name: nil)
    expect(character_type).to_not be_valid
  end

  it 'name is not unique' do
    CharacterType.new(name: 'test')
    new_character_type = CharacterType.new(name: 'test')
    expect(new_character_type).to_not be_valid
  end
end
