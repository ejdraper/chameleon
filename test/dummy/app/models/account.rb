# Dummy Account-like model for use in tests
class Account
  def self.all
    [self.new]
  end
  
  def api_token
    "987654321"
  end

  def value
    5
  end

  def previous
    3
  end
end
