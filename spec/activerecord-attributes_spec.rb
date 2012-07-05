require 'active_record'
require 'activerecord-attributes'

describe "An active record" do
  before do
    ActiveRecord::Base.establish_connection({
      :adapter => "sqlite3",
      :database =>  File.expand_path('../artists.sqlite3', __FILE__)
    })
    @class = Class.new(ActiveRecord::Base)
    @class.table_name = 'artists'
  end
  it "is ok with columns that exists" do
    lambda {
      @class.attribute :talent
      @class.attribute :passion
    }.should_not raise_error
  end

  it "complains when you specify an attribute with no corresponding column" do
    lambda {
      @class.attribute 'common_sense'
    }.should raise_error(ActiveRecord::Attributes::AttributeError)
  end

  it "allows for disabling sanity checks when running migrations" do
    ActiveRecord::Attributes.without_assertions do
      lambda {
        @class.attribute :starving
      }.should_not raise_error
    end
  end
end