defmodule Blog.Schema.Types do
  use Absinthe.Schema.Notation

  object :post do
    field :id, :id
    field :title, :string
    field :body, :string
  end

  @desc "A user of the blog"
  object :user do
    field :id, :id
    field :name, :string
    field :email, :string
    field :posts, list_of(:post)
  end

  @desc "A blog post"
  object :post do
    field :title, :string
    field :body, :string
    field :author, :user
  end
end
