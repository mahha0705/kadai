require "byebug"
require "date"
require "./lib/user.rb"
require "./lib/tweet.rb"
require "./lib/constant.rb"
include Constant

puts Constant::STARTDISPLAY

while true do
  puts Constant::TIMELINE
  puts "投稿されたツイート:#{Tweet.tweets_count}件"
  Tweet.tweets_list

  puts Constant::MENU
  puts "\n[a]ログイン\n\n[b]終了\n\n入力待機中......."
  input = gets.chomp

  if input == "a"
    puts Constant::LOGIN

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
      puts Constant::LOGINUSER
      puts "\n#{user.name}さん:(#{user.tweets.count}件のツイート)\n登録:(#{user.registration_time})"

      puts Constant::TIMELINE
      Tweet.tweets_list

      puts Constant::MENU
      puts "\n[c]ツイートする\n\n[d]自分のツイート一覧\n\n[e]ログアウト\n\n入力待機中......"

      input = gets.chomp

      if input == "c"
        while true do
          puts "\nツイート入力待ち....."
          text = gets.chomp
          tweet = Tweet.new(text,user)
          if tweet.error
            puts tweet.error
          else
            break
          end
        end

      elsif input == "d"
        puts Constant::YOURTWEETS
        user.show_mytweets
        puts "\n戻る？"
        gets.chomp

      elsif input == "e"
        break

      else
        puts "入力された値は無効な値です。"
      end
    end

  elsif input == "b"
    puts "バイバイ......"
    exit

  else
    puts "入力された値は無効な値です。"
  end
end