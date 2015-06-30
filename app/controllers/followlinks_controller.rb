class FollowlinksController < ApplicationController
  def create
  	@followlink = current_user.followlinks.build(followee_id: params[:followee_id])
  	@followlink.save
  	redirect_to allusers_path
  end

  def destroy
  	@followlink = current_user.followlinks.find(params[:id])
  	@followlink.destroy
  	redirect_to allusers_path
  end
end
