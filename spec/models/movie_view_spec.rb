require 'spec_helper'

describe MovieView do
  it { should belong_to(:movie) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:movie_id) }
end
