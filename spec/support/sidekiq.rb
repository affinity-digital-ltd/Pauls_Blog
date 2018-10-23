Sidekiq::Testing.fake!

RSpec::Sidekiq.configure do |config|
  config.warn_when_jobs_not_processed_by_sidekiq = true
end

RSpec.configure do |config|
  config.before(:each) do
    Sidekiq::Worker.clear_all
  end
end