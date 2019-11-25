require 'rails_helper'

describe Song do
  subject(:song) { create(:song) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :duration_ms }
  it { is_expected.to validate_presence_of :spotify_id }
  it { is_expected.to have_and_belong_to_many :albums }
end
