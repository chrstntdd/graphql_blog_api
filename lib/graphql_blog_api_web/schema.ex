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

  mutation do
    @desc "Create a post"
    field :post, type: :post do
      ang :title, non_null(:string)
      arg :body, non_null(:string)
      arg :posted-at, non_null(:string)

      resolve &Blog.PostResolver.create/2
    end
  end

end

