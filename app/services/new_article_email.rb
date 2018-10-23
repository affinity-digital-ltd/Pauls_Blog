class NewArticleEmail

  def initialize
    self.template_id = Integer(ENV.fetch('MAIL_CHIMP_TEMPLATE_KEY'))
    self.list_id = ENV.fetch('MAIL_CHIMP_LIST_ID')
    self.gibbon = Gibbon::Request.new(symbolize_keys: true)
  end

  attr_accessor :template_id, :list_id, :gibbon

  def self.call
    new.call
  end 

  def call
    begin
      campaign = gibbon.campaigns.create(body: body)
      campaign_id = campaign.fetch(:id)
      gibbon.campaigns(campaign_id).actions.send.create
    rescue Gibbon::MailChimpError => e
      puts "Oh dear, we seem to have a problem: #{e.message} - #{e.raw_body}"
    end
  end

  def recipients
    {
      list_id: list_id
    }
  end

  def settings
    {
      subject_line: "New article added to Paul's Blog",
      title: "Paul's Blog",
      from_name: "Paul Brighton",
      reply_to: "paul@paulbrighton.com",
      template_id: template_id
    }
  end
  
  def body
    {
      type: "regular",
      recipients: recipients,
      settings: settings
    }
  end
end
