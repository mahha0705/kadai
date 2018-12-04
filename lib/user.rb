class User
	attr_reader :name, :user_registration_time, :tweets ,:error
  @@user_list = []

  def initialize(name)
    return @error = "無効な値です。" if name == ""
    @name = name
    @user_registration_time = Time.now.to_s
    @tweets = []
    @@user_list << self
  end

  def self.user_list
    @@user_list
  end

  def self.find(input_name)
    user = @@user_list.find { |user| user.name  == input_name}
    user = User.new(input_name) if user == nil
    user
  end

  def add_tweet(tweet)
    tweets << tweet
  end

  def show_tweet
    if tweets == []
      "\nツイートはありません。"
    else
      tweets.each do |tweet|
        puts tweet.yourtweet
      end
    end
  end

end