require 'rails_helper'

RSpec.describe Comment do
  describe '#body' do
    it 'returns body value' do
      comment = Comment.new('body')
      expect(comment.body).to be 'body'
    end
  end

  describe '#to_s' do
    it 'returns body value' do
      comment = Comment.new('body')
      expect(comment.to_s).to be 'body'
    end
  end
end
