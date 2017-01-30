class SearchedTerm < ApplicationRecord

  validates :term, presence: true

  def self.terms_for(prefix)
    Rails.cache.fetch(["search-terms", prefix], expires_in: 5.minutes) do
      suggestions = where("term like ?", "#{prefix}_%")
      suggestions.order("popularity desc").limit(10).pluck(:term)
    end
  end

end
