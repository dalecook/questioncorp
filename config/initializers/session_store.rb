# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_questioncorp_session',
  :secret      => 'fcdc5d037ae2032c2df823587fc4c4b457fc688c9849ae30a5003be324a3acc9c02061ff1aa444c729232dcb43147f77593247c31f7ddee3e1603fdb1780585a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
