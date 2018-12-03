class User
	attr_reader :name, :user_registration_time, :tweets
  @@user_list = []

  def self.user_list
    @@user_list
  end

  def initialize(name)
    @name = name
    @user_registration_time = Time.now
    @tweets = []
    @@user_list << self
  end

  def self.find(input_name)
    user = @@user_list.find { |user| user.name  == input_name}
    user = User.new(input_name) if user == nil
    return user
  end

  def add_tweet(tweet)
    tweets << tweet
  end

  def show_tweet
    if tweets == []
      puts "\nツイートはありません。"
    else
      tweets.each do |tweet|
        puts tweet.yourtweet(tweet)
      end
    end
  end

end