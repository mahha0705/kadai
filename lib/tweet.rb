class Tweet
  attr_reader :text, :tweet_registration_time
  @@tweetslist = []

  def initialize(text,user)
    user.add_tweet(self)
    @user = user
    @text = text
    @tweet_registration_time = Time.now
    @@tweetslist << self
  end

  def self.tweet_count
    @@tweetslist.count
  end

  def yourtweet(tweet)
    puts "\n#{tweet.text}"
    puts "by #{@user.name} at #{tweet.tweet_registration_time}"
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