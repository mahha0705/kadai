require 'rspec'
require_relative "../lib/user.rb"
require_relative "../lib/tweet.rb"

describe Tweet do

  describe "#initialize" do
    before do
      @user = User.new("sakurai")
      @tweet = Tweet.new("hello",@user)
    end
    context "文章が入力された場合" do
      it "ツイート文がインスタンス変数に登録されること" do
        expect(@tweet.text).to eq "hello"
      end
    end
    context " ""が入力された場合 " do
      it "エラーが発生すること" do
        tweet = Tweet.new("",@user)
        expect(tweet.error).to eq "無効な値です。"
      end
    end
    it "ユーザー情報が登録されること" do
      expect(@tweet.user).to be @user
    end
    it "登録した時刻を記録すること" do
      current_time = Time.now.to_s
      expect(@tweet.registration_time.to_s).to eq current_time
    end
    after do
      @@tweets_list = []
    end
    #"@@tweets_listにツイートの情報が追加されること"は後述の"self.tweets_list"のテストで追加確認ができるので、ここでは確認しない。
    #add_mytweetメゾットはuser_specで確認済み
  end

  describe "#self.tweets_count" do
    context " ツイート総数が0の場合 " do
      it "0が表示されること" do
        expect(Tweet.tweets_count).to eq 0
      end
    end
    context " ツイート総数が2の場合 " do
      it "2が表示されること" do
        user1 = User.new("sakurai")
        Tweet.new("hello",user1)
        user2 = User.new("櫻井")
        Tweet.new("hello",user2)
        expect(Tweet.tweets_count).to eq 2
      end
    end
    after do
      @@tweets_list = []
    end
  end

  describe "self.tweets_list" do
    before do
      @user1 = User.new("sakurai")
      @user2 = User.new("櫻井")
    end
    context "ツイートをしていない場合" do
      it "ツイートはありませんと表示されること" do
        expect { Tweet.tweets_list }.to output("\nツイートはありません。\n").to_stdout
      end
    end
    context "任意のユーザーが2件ツイートをしている場合" do
      it "ツイートが2件表示される" do
        tweet1 = Tweet.new("hello",@user1)
        tweet2 = Tweet.new("byebye",@user2)
        current_time = Time.now.to_s
        expect { Tweet.tweets_list }.to output("\nhello\nby:sakurai at:(#{current_time})\n\nbyebye\nby:櫻井 at:(#{current_time})\n").to_stdout
      end
    end
    after do
      @@users_list = []
    end
  end

  describe "#tweet_block" do
    before do
      @user = User.new("sakurai")
      @tweet = Tweet.new("hello",@user)
    end
    it "ツイートが表示されること" do
      current_time = Time.now.to_s
      expect(@tweet.tweet_block).to eq "\nhello\nby:sakurai at:(#{current_time})\n"
    end
    after do
      @@tweets_list = []
    end
  end

end

