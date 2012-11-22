require 'rest-client'
require 'net/http'
require 'json'

module Jira
  
  URL = 'YOUR JIRA URL HERE'
  
  def Jira.request_issues_for_version version
    request = 'YOUR JQL TO EXTRACT ALL JIRA ISSUES PER VERSION'
    requestEncoded = URI::encode(request) 
    response = RestClient.get requestEncoded 
    JSON.parse(response)
  end
  
  def Jira.request_versions
    response = RestClient.get URL + 'project/YOUR PROJECT/versions'
    JSON.parse(response)
  end
  
  def Jira.find_issues_for_versions
    json = Jira.request_versions
    issues = {}
    json.each{ |version|
      name = version['name']
      issues[name]=Jira.request_issues_for_version name
    }
    issues
  end
  
end