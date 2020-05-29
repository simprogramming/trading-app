task :changing_current_price => :environment do
  PriceUpdateJob.perform_now
end
