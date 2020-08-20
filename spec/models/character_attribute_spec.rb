require 'rails_helper'

RSpec.describe CharacterAttribute, type: :model do

  before(:each) do
    @user = FactoryBot.create(:user,
                              :email => "test@test.com",
                              :username => "test_username",
                              :password => "super_secret")
    @character_type = FactoryBot.create(:character_type,
                                        :id => 1,
                                        :user_id => @user.id,
                                        :user => @user,
                                        :name => "Character")
  end

  subject { described_class.new(id: 1,
                                character_type_id: @character_type.id,
                                name: "Test",
                                value: 1,
                                created_at: DateTime.now,
                                updated_at: DateTime.now + 1.week)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    character_attribute = CharacterAttribute.new(name: nil)
    expect(character_attribute).to_not be_valid
  end

  it "is not valid without a value" do
    character_attribute = CharacterAttribute.new(value: nil)
    expect(character_attribute).to_not be_valid
  end
end
