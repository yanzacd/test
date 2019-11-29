require 'rails_helper'

describe Artist do
  subject(:artist) { create(:artist) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :popularity }
  it { is_expected.to validate_presence_of :spotify_id }
  it { is_expected.to have_and_belong_to_many :albums }
end
