require 'rails_helper'

RSpec.describe SearchedTerm, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:term) }
  end
  context 'table fields' do
    it { is_expected.to have_db_column(:term).of_type(:string) }
    it { is_expected.to have_db_column(:popularity).of_type(:integer) }
  end
end
