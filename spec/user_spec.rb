require 'rspec'
require_relative "../lib/user.rb"
require_relative "../lib/tweet.rb"


describe User do

  describe "#initialize" do

    before do
      @user = User.new("sakurai")
    end

    context "文字が入力された場合" do
      it "ユーザー名が登録できること" do
        expect(@user.name).to eq "sakurai"
      end
    end

    context " ""が入力された場合 " do
      it "エラーが発生すること" do
        user = User.new("")
        expect(user.error).to eq "無効な値です。"
      end
    end

    it "@@user_listにユーザーの情報が追加されること" do
      expect(User.user_list).to eq [@user]
    end

    it "登録した時刻を記録すること" do
      current_time = Time.now.to_s
      expect(@user.user_registration_time.to_s).to eq current_time
    end

    it "tweets配列が生成されること" do
      expect(@user.tweets).to eq []
    end

    #ユーザーリストの初期化
    after do
      @@user_list = []
    end
  end

  describe "self.user_list" do
    before(:all) do #既に登録済みの場合の適用のため:all指定
      @user1 = User.new("櫻井")
      @user2 = User.new("sakurai")
    end
    context "すでにユーザーが登録されている場合" do
      it "ユーザーリストが配列で表示できること" do
        expect(User.user_list).to eq [@user1,@user2]
      end
    end

    context "まだユーザーが登録されていない場合" do
      it "空配列が表示できること" do
        expect(User.user_list).to eq []
      end
    end

    #ユーザーリストの初期化
    after do
      @@user_list = []
    end
  end

  describe "self.find(input_name)" do
    before do
      @user = User.new("sakurai")
    end

    context "既存のユーザーの場合" do
      it "ユーザー情報を取ってこれること" do
        #同一インスタンスの確認なので、beを使用
        expect(User.find("sakurai")).to be @user
      end
    end

    context "新規のユーザーの場合" do
      it "新規でユーザーが登録されること" do
        expect(User.new("櫻井")).to be User.find("櫻井")
      end
    end
    after do
      @@user_list = []
    end

  end

  describe "add_tweet(tweet)" do
    before do
      @user = User.new("sakurai")
    end

    context "文字が入力された場合" do
      it "ユーザーのツイートが追加される" do
        text = "櫻井です"
        tweet = Tweet.new(text,@user)
        expect(@user.add_tweet(tweet)).to eq @user.tweets
      end
    end

    context " ""が入力された場合 " do
      it "ツイートが追加されず、エラーが発生する" do
        text = ""
        tweet = Tweet.new(text,@user)
        expect(tweet.error).to eq "無効な値です。"
      end
    end

    after do
      @@user_list = []
    end
  end

  describe "show_tweet" do
    before do
      @user = User.new("sakurai")
    end

    context "ツイートをしていない場合" do
      it "ツイートはありませんと表示されること" do
        expect(@user.show_tweet).to eq "\nツイートはありません。"
      end
    end

    # context "ツイートをしている場合" do
    #   it "自分のツイートが表示される" do
    #     tweet1 = Tweet.new("hello",@user)
    #     tweet2 = Tweet.new("byebye",@user)
    #     expect(@user.show_tweet).to eq  tweet1.yourtweet(tweet1)
    #   end
    # end
    # after do
    #   @@user_list = []
    # end
  end
end

