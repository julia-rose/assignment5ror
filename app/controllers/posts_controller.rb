class PostsController < ApplicationController

	def new
		@user = User.find(params[:user_id])
		@post = Post.new
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
		@post = @user.post.find(params[:id])
		
		if @post.update(params[:post].permit(:title, :body))
			redirect_to user_path(@user)
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:user_id])
  		@post = @user.posts(params[:id])

  		@post.destroy

  		render user_path(@user)
	end
end
