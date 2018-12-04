class User
	attr_reader :name, :registration_time, :tweets ,:error
  @@users_list = []

  def initialize(name)
    return @error = "無効な値です。" if name == ""
    @name = name
    @registration_time = Time.now.to_s
    @tweets = []
    @@users_list << self
  end

  def self.users_list
    @@users_list
  end

  def self.find(input_name)
    user = @@users_list.find { |user| user.name  == input_name}
    user = User.new(input_name) if user == nil
    user
  end

  def add_mytweet(tweet)
    tweets << tweet
  end

  def show_mytweets
    if tweets == []
      puts "\nツイートはありません。\n"
    else
      tweets.each do |tweet|
        puts tweet.tweet_block
      end
    end
  end

end