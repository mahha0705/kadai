class Tweet
  attr_reader :text, :registration_time, :error ,:user
  @@tweets_list = []

  def initialize(text,user)
    return @error = "無効な値です。" if text == ""
    user.add_mytweet(self)
    @text = text
    @user = user
    @registration_time = Time.now.to_s
    @@tweets_list << self
  end

  def self.tweets_count
    @@tweets_list.count
  end

  def self.tweets_list
    if @@tweets_list == []
      puts "\nツイートはありません。\n"
    else
      @@tweets_list.each do |tweet|
        puts tweet.tweet_block
      end
    end
  end

  def tweet_block
    "\n#{text}\nby:#{@user.name} at:(#{registration_time})\n"
  end

end