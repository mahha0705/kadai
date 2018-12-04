class Tweet
  attr_reader :text, :tweet_registration_time, :error
  @@tweetslist = []

  def initialize(text,user)
    return @error = "無効な値です。" if text == ""
    user.add_tweet(self)
    @user = user
    @text = text
    @tweet_registration_time = Time.now.to_s
    @@tweetslist << self
  end

  def self.tweet_count
    @@tweetslist.count
  end

  def yourtweet(tweet)
    "\n#{tweet.text}\nby:#{@user.name}\nat:#{tweet.tweet_registration_time}"
  end

  def self.tweetslist
    if @@tweetslist == []
      puts "ツイートはありません。"
    else
      @@tweetslist.each do |tweet|
        puts tweet.yourtweet(tweet)
      end
    end
  end

end