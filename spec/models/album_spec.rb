require 'rails_helper'

describe Album do
  subject(:album) { create(:album) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :total_tracks }
  it { is_expected.to validate_presence_of :spotify_id }
  it { is_expected.to have_and_belong_to_many :artists }
  it { is_expected.to have_and_belong_to_many :songs }
end
