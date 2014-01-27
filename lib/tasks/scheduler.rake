
  desc 'Pull post data for brands in Stamprr'
    task :post_data => :environment do
      puts 'Pulling posts'
      Brand.get_posts
      puts 'DONE!'
    end
