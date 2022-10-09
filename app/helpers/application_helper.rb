module ApplicationHelper
  def inra string
    "'#{string}'"
  end

  def inmota string
    "'#{string.gsub('<br/>', '\r\n')}'"
  end
end
