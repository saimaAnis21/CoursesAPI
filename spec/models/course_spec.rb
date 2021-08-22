require 'rails_helper'

RSpec.describe Course, type: :model do
  # Association test
  it { should belong_to(:user) }
  # Validation tests
  # ensure columns title and duration are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:duration) }
  it { should validate_presence_of(:category_name_id) }
end
