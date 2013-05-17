# All post related routes go here.


get "/posts" do
  @posts = Post.all
  erb :posts
end


get "/posts/new" do
  # takes user to the page with new post form
  erb :new_post
end

get "/posts/:post_id" do
  # p "#{params}"
  @post = Post.find(params[:post_id])
  erb :post
end


post "/" do
  new_post = Post.create(:title => params[:post_title],
                         :body  => params[:post_body])
  @post_id = new_post.id
  erb :post
end


# get the edit post form of the post with this id
get "/posts/:post_id/edit" do
  @post = Post.find(params[:post_id])
  erb :edit_post
end

# edit post form sends a put request here.
post "/posts/:post_id" do
  @post = Post.find(params[:post_id])
  @post.update_attributes(:title => params[:updated_title],
                          :body => params[:updated_body])

  redirect "/posts/#{@post.id}"
end

  # deletes the post with this id
post "/posts/:post_id/delete" do
  @post = Post.find(params[:post_id])

  Post.delete(@post.id)
  redirect "/posts"
end











