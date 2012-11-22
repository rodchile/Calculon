require_relative '../lib/math/math'


describe 'Arithmetic Operations over JIRA issues' do

  it "should return the total amount of time per version" do
    response = JiraMath.return_time_per_version
  end

end
