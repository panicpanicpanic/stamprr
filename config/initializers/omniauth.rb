Rails.application.config.middleware.use OmniAuth::Builder do
  
  provider :google_oauth2, client_id = "108436715439.apps.googleusercontent.com", client_secret = "429u_n-9XmF8DG2cBplAri62"

end
