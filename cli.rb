require "byebug"
require "date"
require "./lib/user.rb"
require "./lib/tweet.rb"

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