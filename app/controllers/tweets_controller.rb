class TweetsController < ApplicationController
    before_action :authenticate_user!

    def index
        @tweets = current_user.tweets
    end

    def new
      @tweet = Tweet.new
    end

    def show
      @tweet = Tweet.find_by(id: params[:id])
    end

    def create
      @tweet = Tweet.create(tweet_params)
      current_user.tweets << @tweet
      if @tweet.save
        redirect_to tweets_path
      else
        render new_tweet_path
      end
    end

    def update
      @tweet = Tweet.find_by_id(params[:id])
      if @tweet.update(tweet_params)
        redirect_to @tweet
      else
        render "edit"
      end
    end

    def edit
      @tweet = Tweet.find_by_id(params[:id])
    end


    def destroy
      @tweet = Tweet.find_by_id(params[:id])
      @tweet.destroy
      redirect_to tweets_path
    end

    private

    def tweet_params
      params.require(:tweet).permit(:body)
    end
end
