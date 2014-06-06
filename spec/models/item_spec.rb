require 'spec_helper'

describe Item do
  it { should have_many(:list_items) }
  it { should have_many(:lists) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end

