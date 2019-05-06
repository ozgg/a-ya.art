User.class_eval do
  def profile_name
    profile = data['profile'].to_h
    result = "#{profile['name']} #{profile['surname'].upcase}"
    result.blank? ? screen_name : result
  end
end
