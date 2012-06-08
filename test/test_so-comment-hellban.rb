#!/usr/bin/env ruby

require_relative '../lib/so-comment-hellban'
require 'minitest/autorun'

describe 'SO_Comment_Hellban::Hellban::Hellban#valid_args?' do
  it '#valid_args? should reject a single argument' do
      ARGV.replace [1]
      SO_Comment_Hellban::Hellban.valid_args?.must_equal false
  end

  it '#valid_args? should reject a three arguments' do
    ARGV.replace (1..3).to_a
    SO_Comment_Hellban::Hellban.valid_args?.must_equal false
  end

  it '#valid_args? should accept 2 arguments' do
    ARGV.replace (1..2).to_a
    SO_Comment_Hellban::Hellban.valid_args?.must_equal true
  end

  it '#valid_args? should reject non-integers' do
    ARGV.replace %w[a b]
    SO_Comment_Hellban::Hellban.valid_args?.must_equal false
  end
end

describe 'SO_Comment_Hellban::Hellban#flag_weight' do
  it 'should return 0' do
    SO_Comment_Hellban::Hellban.new(10, 0).
      send(:flag_weight).must_equal 0
  end

  it 'should return 40' do
    SO_Comment_Hellban::Hellban.new(10, 40).
      send(:flag_weight).must_equal 40
  end

  it 'should return -9' do
    SO_Comment_Hellban::Hellban.new(20, 1).
      send(:flag_weight).must_equal -9
  end
end

describe 'SO_Comment_Hellban::Hellban#comment_hellbanned?' do
  it 'should be true when flag_weight <= 0' do
    SO_Comment_Hellban::Hellban.new(20, 1).
      send(:comment_hellbanned?).must_equal true
  end

  it 'should be true when flag_weight == 0' do
    SO_Comment_Hellban::Hellban.new(10, 0).
      send(:comment_hellbanned?).must_equal true
  end

  it 'should be false when flag_weight > 0' do
    SO_Comment_Hellban::Hellban.new(10, 40).
      send(:comment_hellbanned?).must_equal false
  end
end
