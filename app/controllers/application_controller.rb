require 'twitter/authentication_helpers'

class ApplicationController < ActionController::Base
  include Twitter::AuthenticationHelpers
  protect_from_forgery

  private

  def client
    Twitter.configure do |config|
      config.consumer_key = ENV['CONSUMER_KEY']
      config.consumer_secret = ENV['CONSUMER_SECRET']
      config.oauth_token = session['access_token']
      config.oauth_token_secret = session['access_secret']
    end
    @client ||= Twitter::Client.new
  end
  helper_method :client
end
