require 'rails_helper'

describe Api::V1::BookSuggestionsController, type: :controller do
  include_context 'Authenticated User'

  describe 'POST #create' do
    context 'When creating a valid book suggestion' do
      let!(:new_book_suggestion) { attributes_for(:book_suggestion) }

      it 'creates a new book suggestion' do
        expect do
          post :create, params: { book_suggestion: new_book_suggestion }
        end.to change { BookSuggestion.count }.by(1)
      end

      it 'responds with 201 status' do
        post :create, params: { book_suggestion: new_book_suggestion }
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)['user_id']).to eq user.id
      end
    end

    context 'When creating an invalid book suggestion' do
      let!(:wrong_book_suggestion) { attributes_for(:book_suggestion).except(:editorial) }

      before do
        post :create, params: { book_suggestion: wrong_book_suggestion }
      end

      it 'doesn\'t create a new book suggestion' do
        expect do
          post :create, params: { book_suggestion: wrong_book_suggestion }
        end.to change { Rent.count }.by(0)
      end

      it 'returns error messages' do
        expect(response.body['error']).to be_present
      end

      it 'responds with 400 status' do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
