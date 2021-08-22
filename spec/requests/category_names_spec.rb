require 'rails_helper'

RSpec.describe 'CategoryNames', type: :request do
  # initialize test data
  let!(:category_names) { create_list(:category_name, 10) }
  let(:category_name_id) { category_names.first.id }

  # Test suite for GET /category_names
  describe 'GET /category_names' do
    # make HTTP get request before each example
    before { get '/category_names' }

    it 'returns category_names' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
