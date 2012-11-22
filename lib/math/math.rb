require_relative '../network/jira'

module JiraMath
  def JiraMath.return_time_per_version
    issues = Jira.find_issues_for_versions
    sum = {}
    issues.each do |key,value|
      versionTimming = 0
      value["issues"].each do |valueField|
        valueField["fields"].each do |keyField,fieldValue|
          if fieldValue["timeSpentSeconds"] != nil
            versionTimming += fieldValue["timeSpentSeconds"]
          end
        end 
      end
      sum[key]=versionTimming
    end
    sum
  end
  
  def JiraMath.return_graph_total_time
    data = {}
    values = []
    result = JiraMath.return_time_per_version
    result.each do |key,value|
          tick = {}
          tick['label'] = key
          tick['values'] = (value/60)/60
          values << tick
    end
    data['label'] = result.keys
    data['values'] = values
    data
  end
  
end
