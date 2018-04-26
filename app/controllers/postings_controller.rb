class PostingsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update, :destroy]

def index
  puts "The time is: #{Time.now}"
  @postings = Posting.all
end

def create
  @posting = Posting.new(posting_params)
  if @posting.save
      # flash[:notice] = "You have successfully created a posting #{@posting.name}!"
      redirect_to '/'
    else
      render :new
    end
end

def destroy
  @posting = Posting.find(params[:id])
  if @posting.destroy
    flash[:alert] = "You have successfully deleted #{@posting.posting_post_id}!"
    redirect_to '/'
  end
end

private

  def posting_params
    params.require(:posting).permit(:posting_link,
                                    :posting_title,
                                    :posting_body,
                                    :posting_price,
                                    :posting_bedroom,
                                    :posting_square_feet,
                                    :posting_location,
                                    :posting_address,
                                    :posting_email,
                                    :posting_phone,
                                    :posting_housing_type,
                                    :posting_date_posted,
                                    :posting_post_id,
                                    :posting_parking,
                                    :posting_furnished,
                                    :posting_wheelchair,
                                    :contacted,
                                    )
  end
end
