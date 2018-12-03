class Tweet
  attr_reader :text, :tweet_registration_time
  @@tweet_count = 0
  @@tweetslist = []

  def initialize(text,user)
    user.add_tweet(self)
    @user = user
    @text = text
    @tweet_registration_time = Time.now
    @@tweet_count += 1
    @@tweetslist << self
  end

  def self.tweet_count
    @@tweet_count
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