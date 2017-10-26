OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '290907961316111', 'c49fcccc7af5fcb69abd23753cb7c075',
        :display => 'popup',
        :scope => 'email,user_friends',
        :info_fields => 'name,email'
end