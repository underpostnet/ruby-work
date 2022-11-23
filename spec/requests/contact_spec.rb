require 'rails_helper'

RSpec.describe 'Phonebook API', type: :request do
  # Test suite for GET /contacts
  describe 'GET /contacts' do
    # make HTTP get request before each example
    before { get '/contacts' }

    it 'should not allow to list the contacts' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json['message']).to eql('Missing token')
    end

    it 'returns status code 401 unauthorized_request' do
      expect(response).to have_http_status(401)
    end
  end
end