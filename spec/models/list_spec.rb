require 'spec_helper'

describe List do
  let(:list) { build(:list) }

  it { expect(list).to be_valid }

  it { should have_many(:list_items) }
  it { should have_many(:items) }

  it { should belong_to(:user) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).scoped_to([:user_id]) }
end

