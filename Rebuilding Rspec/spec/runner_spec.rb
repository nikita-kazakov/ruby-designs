require '../runner_v2.rb'
describe 'expectations' do
  it 'can expect values' do
    # (1+1).should == 2
    expect(1+1).to eq(2)
  end

  # it 'can fail' do
  #   (1+1).should == 3
  # end
end