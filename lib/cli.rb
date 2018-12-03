require "byebug"
require "date"

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
      puts "ツイートはありません。"
    else
      tweets.each do |tweet|
        puts tweet.yourtweet(tweet)
      end
    end
  end
end


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

while true do
  line1 = "----------------------------"
  line2 = "............................"
  line3 = "~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  line4 = "****************************"

  puts "\n\n#{line1}"
  puts "ようこそRubyツイッターへ"
  puts "#{line1}\n\n"

  puts "\n\n#{line3}タイムライン#{line3}"
  puts "投稿されたツイート:#{Tweet.tweet_count}件"
  Tweet.tweetslist
  puts "\n\n[a]ログイン"
  puts "[b]終了"
  puts "入力待機中........"
  input = gets.chomp

  if input == "a"
    puts "\n\n#{line2}[a]ログイン#{line2}"
   	puts "名前を入力してください"
   	input_name = gets.chomp

    if User.user_list == []
      user = User.new(input_name)
    else
      user = User.find(input_name)
    end

    puts "\n\nログイン完了"

    while true do
      puts "\n\n#{line3}ログイン中のユーザー#{line3}"
      puts "#{user.name}さん:#{user.tweets.count}件のツイート"
      puts "登録:#{user.user_registration_time}"

      puts "\n\n#{line3}タイムライン#{line3}"
      Tweet.tweetslist

      puts "\n\n#{line3}メニュー#{line3}"
      puts "[c]ツイートする"
      puts "[d]自分のツイート一覧"
      puts "[e]ログアウト"

      input = gets.chomp

      if input == "c" #つぶやく
        puts "\n\nツイート入力待ち....."
        text = gets.chomp
        tweet = Tweet.new(text,user)
        puts line4
        tweet = tweet.yourtweet(tweet)
        puts line4
      elsif input == "d"
        puts "\n\n#{line3}#{user.name}さんのツイート一覧#{line3}"
        user.show_tweet
        puts "エンター入力....."
        input = gets.chomp
      elsif input == "e"
        break
      else
        puts "入力された値は無効な値です。"
      end
    end

  elsif input == "b"
    puts "バイバイ...."
    exit
  else
    puts "入力された値は無効な値です。"
  end

end