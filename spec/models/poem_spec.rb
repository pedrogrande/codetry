require 'spec_helper'

describe Poem do
  it "is valid with title, content, language, tags" do
  	expect(create(:poem)).to be_valid
  end
end
