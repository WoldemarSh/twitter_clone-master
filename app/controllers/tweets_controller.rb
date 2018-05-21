class TweetsController < ApplicationController
  def index
    @tweets = Tweet.paginate(:page => params[:page], :per_page => 5)
  end
  def new
  	@tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def show

  end

  def update
  end


  def destroy
  	@tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to root_path
  end


 private

 def tweet_params
 	params.require(:tweet).permit(:text)
 end

end
