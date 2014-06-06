require 'spec_helper'

describe ListItem do
  let(:list_item) { build(:list_item) }

  before do
    @item = Item.create(name: 'Item')
    @list = List.create(name: 'List')
  end

  it 'saves list_item properly' do
    list_item = ListItem.new(item: @item, list: @list, bought: true)
    expect(list_item.save).to be(true)
  end

  it { expect(list_item).to be_valid }
end
