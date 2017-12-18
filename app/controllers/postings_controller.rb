class PostingsController < ApplicationController

def index
  @postings = Posting.all
end

def show
  @posting = Posting.find(params[:id])
end

def new
  @posting = Posting.new
end

def create
  @posting = Posting.new(product_params)

end

def edit
  @posting = Posting.find(params[:id])
end

def update
  @posting = Posting.find(params[:id])

end

def destroy
  @posting = Posting.find(params[:id])

end

private

  def posting_params
    params.require(:posting).permit(:posting_link,
                                    :posting_title,
                                    :posting_body,
                                    :posting_price,
                                    :posting_bedroom,
                                    :posting_square_feet,
                                    :posting_specific_location,
                                    :posting_address,
                                    :posting_email,
                                    :posting_phone,
                                    :posting_housing_type,
                                    :posting_date_posted,
                                    :posting_post_id,
                                    :posting_parking,
                                    :posting_furnished,
                                    :posting_wheelchair,
                                    :complete,
                                    :discrimination)
  end
end
