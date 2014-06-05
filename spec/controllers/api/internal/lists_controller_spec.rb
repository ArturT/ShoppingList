require 'spec_helper'

describe Api::Internal::ListsController do
  let(:user) { create(:user) }
  let(:current_user) { controller.current_user }
  let(:list_params) do
    { 'name' =>  'List Name' }
  end
  let(:errors) { double }

  subject { response }

  before do
    sign_in user
  end

  describe '#index' do
    let(:lists) { double }

    before do
      expect(current_user).to receive(:lists) { lists }
      get :index
    end

    it { should be_success }
    its(:body) { should be_json_eql lists.to_json }
  end

  describe '#create' do
    let(:list) { double }

    before do
      expect(current_user.lists).to receive(:build).with(list_params) { list }
    end

    context 'when list is valid' do
      before do
        expect(list).to receive(:save).and_return(true)
        post :create, list: list_params
      end

      it { should be_success }
      its(:body) { should be_json_eql list.to_json }
    end

    context 'when list is invalid' do
      before do
        expect(list).to receive(:save).and_return(false)
        expect(list).to receive(:errors) { errors }
        post :create, list: list_params
      end

      it { should_not be_success }
      its(:status) { should eql 422 }
      its(:body) { should be_json_eql({errors: errors}.to_json) }
    end
  end

  describe '#update' do
    let(:list) { double(id: 1) }

    before do
      expect(current_user.lists).to receive(:find).with(list.id.to_s) { list }
    end

    context 'when list is valid' do
      before do
        expect(list).to receive(:update).with(list_params) { true }
        put :update, id: list.id, list: list_params
      end

      it { should be_success }
      its(:body) { should be_json_eql list.to_json }
    end

    context 'when list is invalid' do
      before do
        expect(list).to receive(:update).with(list_params) { false }
        expect(list).to receive(:errors) { errors }
        put :update, id: list.id, list: list_params
      end

      it { should_not be_success }
      its(:body) { should be_json_eql({errors: errors}.to_json) }
    end
  end

  describe '#destroy' do
    let(:list) { double(id: 1) }

    before do
      expect(current_user.lists).to receive(:find).with(list.id.to_s) { list }
      expect(list).to receive(:destroy)
      delete :destroy, id: list.id
    end

    it { should be_success }
  end
end
