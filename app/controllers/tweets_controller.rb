class TweetsController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]

    def index
        @tweets = Tweet.all
        @rank_tweets = Tweet.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
    end

    def new
        @tweet = Tweet.new
    end
    
    def create
        tweet = Tweet.new(tweet_params)
        tweet.user_id = current_user.id
        if tweet.save!
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    def show
        @tweet = Tweet.find(params[:id])
        @comments = @tweet.comments
        @comment = Comment.new
    end

    def edit
        @tweet = Tweet.find(params[:id])
    end

    def update
        tweet = Tweet.find(params[:id])
        if tweet.update(tweet_params)
            redirect_to tweets_path, notice: "ツイートを更新しました！"
        else
            flash.now[:alert] = "ツイートの更新に失敗しました。"
            render :edit
        end
    end

    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to action: :index
    end
    
    private
    def tweet_params
        params.require(:tweet).permit(:name, :date, :about, :image)
    end
end
