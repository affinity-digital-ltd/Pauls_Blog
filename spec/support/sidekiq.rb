Sidekiq::Testing.fake!

RSpec::Sidekiq.configure do |config|
  config.warn_when_jobs_not_processed_by_sidekiq = true
end

RSpec.configure do |config|
  config.before(:each) do
    Sidekiq::Worker.clear_all
  end

  config.around(:example, sidekiq: -> (mode) { !!mode }) do |example|
    unless %i(inline fake disable).include?(example.metadata.fetch(:sidekiq))
      raise "sidekiq_mode must be :inline, :fake or :disable"
    end
    Sidekiq::Testing.send("#{example.metadata.fetch(:sidekiq)}!".to_sym) do
      example.run
    end
  end
end