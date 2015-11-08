require 'hominid'

class NewsletterController < ApplicationController
  def signup
    email = params[:email]
    unless email.nil? || email.strip.empty?
      register(email)
    end
    "Success."
  end

  private
    def register(email)
      api_key = Rails.configuration.x.mailchimp_api_key
      list_name = Rails.configuration.x.mailchimp_list_name
      mailchimp = Hominid::API.new(api_key)
      list_id = mailchimp.find_list_id_by_name(list_name)
      raise "Unable to retrieve list id from MailChimp API." unless list_id

      double_optin = true
      update_existing = true
      replace_interests = true
      send_welcome = true
      mailchimp.list_subscribe(list_id, email, {}, 'html', double_optin, update_existing, replace_interests, send_welcome)
    end
end
