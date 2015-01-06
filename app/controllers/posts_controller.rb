class PostsController < ApplicationController

	def new
		@user = User.find(params[:user_id])
		@post = Post.new # since posts are a completely nested resource they may want to be aware of the user to complete the association
		# @post = @user.posts.new # not required if you are using form_for [@user, @post]
	end

	def edit
		@user = User.find(params[:user_id])
		@post = @user.posts(params[:id])

	end

	def create
		@user = User.find(params[:user_id])
		@post = @user.posts.create(params[:post].permit(:title, :body))
		redirect_to user_path(@user)
	end

	def update
		@user = User.find(params[:user_id])
		@post = @user.posts.find(params[:id]) # type (should be posts, not post to access the assocation)
		
		if @post.update(params[:post].permit(:title, :body))
			redirect_to user_path(@user)
		else
			render 'edit'
		end
	end

	def destroy # I will check the view code, but if you do not pass a method: :delete to the link_to it wont trigger the destroy action
		@user = User.find(params[:user_id])
  		@post = @user.posts(params[:id])

  		@post.destroy

  		render user_path(@user)
	end
end
