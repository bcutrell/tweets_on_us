module OauthMocking
  def login_with_oauth(provider = :twitter)
    visit "/auth/#{provider}"
  end
end
