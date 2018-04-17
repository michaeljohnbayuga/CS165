class RatingsController < ApplicationController
	def index
		#
	end

   	def rate1

   		find = Rating.where(:user_id => current_user.id, :show_id => params[:id])

   		if find.blank?
		    	@rating = Rating.new
		    	@rating.user_id = current_user.id
		    	@rating.show_id = params[:id]
		    	@rating.rtg = 1.0
			@rating.save
		else
			find.update_all(:rtg => 1.0)
		end

    		redirect_back(fallback_location: root_path)
  	end

  	def rate2
   		find = Rating.where(:user_id => current_user.id, :show_id => params[:id])

   		if find.blank?
		    	@rating = Rating.new
		    	@rating.user_id = current_user.id
		    	@rating.show_id = params[:id]
		    	@rating.rtg = 2.0
			@rating.save
		else
			find.update_all(:rtg => 2.0)
		end

    		redirect_back(fallback_location: root_path)
  	end

  	def rate3
   		find = Rating.where(:user_id => current_user.id, :show_id => params[:id])

   		if find.blank?
		    	@rating = Rating.new
		    	@rating.user_id = current_user.id
		    	@rating.show_id = params[:id]
		    	@rating.rtg = 3.0
			@rating.save
		else
			find.update_all(:rtg => 3.0)
		end

    		redirect_back(fallback_location: root_path)
  	end

  	def rate4
   		find = Rating.where(:user_id => current_user.id, :show_id => params[:id])

   		if find.blank?
		    	@rating = Rating.new
		    	@rating.user_id = current_user.id
		    	@rating.show_id = params[:id]
		    	@rating.rtg = 4.0
			@rating.save
		else
			find.update_all(:rtg => 4.0)
		end

    		redirect_back(fallback_location: root_path)
  	end

  	def rate5
   		find = Rating.where(:user_id => current_user.id, :show_id => params[:id])

   		if find.blank?
		    	@rating = Rating.new
		    	@rating.user_id = current_user.id
		    	@rating.show_id = params[:id]
		    	@rating.rtg = 5.0
			@rating.save
		else
			find.update_all(:rtg => 5.0)
		end

    		redirect_back(fallback_location: root_path)
  	end

end
