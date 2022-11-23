require 'rails_helper'

RSpec.describe Contact, type: :model do
  it { should validate_presence_of(:full_name) }
  it { should validate_presence_of(:phone) }
  it { should validate_uniqueness_of(:phone) }
  it { should belong_to(:user) }
end