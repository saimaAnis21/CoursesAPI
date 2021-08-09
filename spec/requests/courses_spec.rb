require 'rails_helper'

RSpec.describe 'Courses', type: :request do
  # initialize test data
  let(:user) { create(:user) }
  # creating categor_names from factorybot
  let!(:category_names) { create_list(:category_name, 5) }
  let(:category_id) { category_names.first.id }
  let!(:courses) { create_list(:course, 10, created_by: user.id, category_name_id: category_id, duration: 5.5) }
  let(:course_id) { courses.first.id }
  let(:headers) { valid_headers }

  # Test suite for GET /courses
  describe 'GET /courses' do
    # make HTTP get request before each example
    before { get '/courses', params: {}, headers: headers }

    it 'returns courses' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /courses/:id
  describe 'GET /courses/:id' do
    before { get "/courses/#{course_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the course' do
        expect(response.body).not_to be_empty
        expect(json['id']).to eq(course_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:course_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Course/)
      end
    end
  end

  # Test suite for POST /courses
  describe 'POST /courses' do
    # send json payload
    let(:valid_attributes) { { title: 'Learn Rails', duration: 1.0, category_name_id: category_id }.to_json }

    context 'when the request is valid' do
      before { post '/courses', params: valid_attributes, headers: headers }

      it 'creates a course' do
        expect(json[0]['title']).to match('Learn Rails')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { title: nil }.to_json }

      before { post '/courses', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message'])
          .to match(/Validation failed: Title can't be blank, Duration can't be blank, Category name can't be blank/)
      end
    end
  end

  # Test suite for PUT /courses/:id
  describe 'PUT /courses/:id' do
    let(:valid_attributes) { { title: 'Learn Ruby' }.to_json }

    context 'when the record exists' do
      before { put "/courses/#{course_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /courses/:id
  describe 'DELETE /courses/:id' do
    before { delete "/courses/#{course_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
