require 'rails_helper'

RSpec.describe SearchedTermsController, type: :controller do
  describe 'GET #home' do
    it 'return http success' do
      get :home
      expect(response).to be_success
    end
  end

  describe 'GET #index' do
    it 'return a array of suggestions' do
      SearchedTerm.create(term: 'foo bar')
      params = { format: 'json', searched_term: { term: 'foo'}}

      @expected = { format: 'json', term: 'foo bar' }

      get :index, params: params
      expect(JSON.parse(response.body).first).to eq(@expected[:term])
    end
  end

  describe 'POST create' do

    it 'creates a new searched term ' do
      expect{
        post :create, params: { search: 'foo' }
      }.to change(SearchedTerm,:count).by(1)
    end

    it 'increments the popularity attribute if terms already exists' do
      search_sample = SearchedTerm.create!(term: 'foo')

      post :create, params: { search: 'foo'}

      search_sample.reload
      expect(search_sample.popularity).to eq(2)
      expect(response).to redirect_to root_path
    end
  end
end
