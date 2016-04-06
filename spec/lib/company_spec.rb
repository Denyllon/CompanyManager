require "spec_helper"
require "company"

describe Company do
  # place here some examples
  it "is name Hummus" do
    company = Company.new
    expect(company.name).to eq('Hummus')
  end
end
