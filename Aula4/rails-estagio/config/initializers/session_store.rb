# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_turma-junho-2015_session',
  :secret      => '0b8b01cb29a0e81af07056c3c493b71afc5b448713c6852a48aba04a8ac0ea7a9b271cc3f433d54abf9f4b6fb17a80da2c9fd68f36f1c2650e0681156208f5f6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
