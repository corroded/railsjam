require 'spec_helper'


describe Post do
  before(:each) do
    @post = Post.new
    @date = Time.now
  end

  it "should not be valid when empty" do
    @post.should_not be_valid
  end

  ['user_id', 'title', 'tags', 'body', 'published'].each do |field|
    it "should require #{field}" do
     @post.should_not be_valid
    end
  end
  
  
   describe 'return promoted post' do
    it 'gets the last promoted post' do
      Post.promoted.size.should_not == nil
    end
    
  end 


end