class Tweet
  attr_reader :text, :tweet_registration_time, :error ,:user
  @@tweetslist = []

  def initialize(text,user)
    return @error = "無効な値です。" if text == ""
    user.add_tweet(self)
    @text = text
    @user = user
    @tweet_registration_time = Time.now.to_s
    @@tweetslist << self
  end

  def self.tweet_count
    @@tweetslist.count
  end

  def self.tweetslist
    if @@tweetslist == []
      "ツイートはありません。"
    else
      @@tweetslist.each do |tweet|
        puts tweet.yourtweet
      end
    end
  end

  def yourtweet
    "\n#{text}\nby:#{@user.name}\nat:#{tweet_registration_time}"
  end

end