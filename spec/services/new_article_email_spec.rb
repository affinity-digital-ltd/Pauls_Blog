require 'rails_helper'

RSpec.describe NewArticleEmail do
  describe "Sending a mailchimp campaign", type: :request do
    before do
      request = file_fixture('mailchimp_request.json').read
      response = file_fixture('mailchimp_response.json').read
      status_response = file_fixture('mailchimp_status.json').read
      
      stub_request(:post, "https://us17.api.mailchimp.com/3.0/campaigns").
        with(body: request).
        to_return(status: 200, body: response, headers: {})

      stub_request(:post, "https://us17.api.mailchimp.com/3.0/campaigns/ce342c1702/actions/send").
        with(body: "null").
        to_return(status: 204)
    end

    it "should make a request to Mailchimp" do
      response = NewArticleEmail.call
      expect(response).to eq nil
    end
  end
end