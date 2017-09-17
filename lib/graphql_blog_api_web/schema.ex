defmodule Blog.Schema do
  use Absinthe.Schema
  import_types Blog.Schema.Types
    
  query do
    @desc "Get all blog posts"
    field :posts, list_of(:post) do
      resolve &Blog.PostResolver.all/2
    end
  
    @desc "Get a user of the blog"
    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &Blog.UserResolver.find/2
    end
  end

end

