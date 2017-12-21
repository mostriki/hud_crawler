class PostingsController < ApplicationController

def index
  @postings = Posting.all
  postings_portland = Posting.craigslist_scraper("https://portland.craigslist.org/search/apa?bundleDuplicates=1&availabilityMode=0")
end

def new
  @posting = Posting.new
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
