require 'rails_helper'

RSpec.describe 'Phonebook API', type: :request do
  describe 'GET /users' do
    before { get '/users' }

    it 'should not allow to list the users' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json['message']).to eql('Missing token')
    end

    it 'returns status code 401 unauthorized_request' do
      expect(response).to have_http_status(401)
    end
  end

  describe 'POST /users' do
    let(:valid_attributes) { { first_name: 'alex', last_name: 'alex', email: 'alex@mail.com', password: 'passs', } }

    context 'when the request is valid' do
      before { post '/users', params: valid_attributes }

      it 'creates a user' do
        expect(json['message']).to eql('User was successfully created.')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/users', params: { } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json)
          .to eql( ["First name can't be blank", "Last name can't be blank", "Email can't be blank", "Email is invalid", "Password digest can't be blank", "Password can't be blank"])
      end
    end
  end
end