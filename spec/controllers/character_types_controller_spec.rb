# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CharacterTypesController, type: :controller do
  login_user

  let(:valid_attributes) do
    { name: 'Test character!', avatar: 'some image' }
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end
end
