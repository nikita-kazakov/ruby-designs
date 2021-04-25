require_relative '../runner_nk_v2'

describe "a user" do
  it "five is five" do
    # (2+3).should == 5

    expect(2+3).to eq(5)
  end

  # it 'two is five' do
  #   (1+1).should == 5
  # end
  #
  # it 'six is six' do
  #   (6).should == 6
  # end
  #
  # it 'eight is ten' do
  #   (4+4).should == 10
  # end
end
