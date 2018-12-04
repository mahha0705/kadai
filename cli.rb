require "byebug"
require "date"
require "./lib/user.rb"
require "./lib/tweet.rb"
require "./lib/constant.rb"
include Constant

puts "\n\n#{Constant::LINE1}\nようこそRubyツイッターへ\n#{Constant::LINE1}"

while true do
  puts "\n\n#{Constant::LINE1}タイムライン#{Constant::LINE1}"
  puts "投稿されたツイート:#{Tweet.tweet_count}件"
  Tweet.tweetslist

  puts "\n\n#{Constant::LINE1}メニュー#{Constant::LINE1}"
  puts "\n[a]ログイン"
  puts "\n[b]終了"
  puts "\n入力待機中........"
  input = gets.chomp

  if input == "a"
    puts "\n\n#{Constant::LINE1}ログイン#{Constant::LINE1}"

    while true do
      puts "名前を入力してください......"
      input_name = gets.chomp
      user = User.find(input_name)
      if user.error
        puts user.error
      else
        puts "\n\nログイン完了しました......"
      break
      end
    end

    while true do
      puts "\n\n#{Constant::LINE1}タイムライン#{Constant::LINE1}"
      Tweet.tweetslist

      puts "\n\n#{Constant::LINE1}ログイン中のユーザー#{Constant::LINE1}"
      puts "\n#{user.name}さん:#{user.tweets.count}件のツイート"
      puts "\n登録:#{user.user_registration_time}"

      puts "\n\n#{Constant::LINE1}メニュー#{Constant::LINE1}"
      puts "\n[c]ツイートする"
      puts "\n[d]自分のツイート一覧"
      puts "\n[e]ログアウト"
      puts "\n入力待機中........"

      input = gets.chomp

      if input == "c"
        while true do
          puts "\n\nツイート入力待ち....."
          text = gets.chomp
          tweet = Tweet.new(text,user)
          if tweet.error
            puts tweet.error
          else
            break
          end
        end

      elsif input == "d"
        puts "\n\n#{Constant::LINE1}#{user.name}さんのツイート一覧#{Constant::LINE1}"
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