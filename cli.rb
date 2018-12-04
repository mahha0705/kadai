require "byebug"
require "date"
require "./lib/user.rb"
require "./lib/tweet.rb"
require "./lib/constant.rb"
include Constant

puts Constant::STARTDISPLAY
while true do
  #--------------タイムライン----------------------------
  puts Constant::TIMELINE
  puts "投稿されたツイート:#{Tweet.tweets_count}件"
  Tweet.tweets_list
  #--------------最初のメニュー---------------------------
  puts Constant::MENU
  puts "\n[a]ログイン\n\n[b]終了\n\n入力待機中......."
  input = gets.chomp
  #--------------名前入力--------------------------------
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
    #--------------ログインユーザー----------------------
    while true do
      puts Constant::LOGINUSER
      puts "\n#{user.name}さん:(#{user.tweets.count}件のツイート)\n登録:(#{user.registration_time})"
    #--------------タイムライン-----------------------------
      puts Constant::TIMELINE
      Tweet.tweets_list
    #--------------ログイン後のメニュー----------------------
      puts Constant::MENU
      puts "\n[c]ツイートする\n\n[d]自分のツイート一覧\n\n[e]ログアウト\n\n入力待機中......"
      input = gets.chomp
      #--------------ツイート入力---------------------------
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
      #--------------自分のツイート一覧---------------------------
      elsif input == "d"
        puts Constant::YOURTWEETS
        user.show_mytweets
        puts "\n戻る？"
        gets.chomp
      #--------------ログアウト---------------------------
      elsif input == "e"
        break
      #--------------エラー発生---------------------------
      else
        puts "入力された値は無効な値です。"
      end
    end
  #--------------終了---------------------------
  elsif input == "b"
    puts "バイバイ......"
    exit
  #--------------エラー発生----------------------
  else
    puts "入力された値は無効な値です。"
  end
end