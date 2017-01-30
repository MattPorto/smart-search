class SearchedTermsController < ApplicationController
  def home
    @last_search = session[:last_search]
  end

  def index
    render json: SearchedTerm.terms_for(params[:term])
  end

  def new
    @searched_term = SearchedTerm.new
  end
  def create
    session[:last_search] = search_param
    @searched_term = SearchedTerm.find_by(term: search_param)
    unless @searched_term
      @searched_term = SearchedTerm.new(term: search_param)
      @searched_term.save
    else
      @searched_term.increment! :popularity
    end
    redirect_to root_path
  end

  def most_searched
    @searched_terms = SearchedTerm.all.order(popularity: :desc).select {|n| n.popularity > 1}
  end

  private

  def search_param
    params[:search].strip
  end

end
