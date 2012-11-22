require_relative '../lib/network/jira'

describe 'Jira Issues Service' do
  
  it "should return the issues associated with a milestone" do
      response = Jira.request_issues_for_version 'REID - 0.1.1-M1'
  end
  
  it "should return the versions of reid" do
      response  = Jira.request_versions
  end
  
  it "should return the issues associated with versions" do
      response = Jira.find_issues_for_versions
  end
end
