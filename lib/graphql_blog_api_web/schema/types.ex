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
    field :posted_at, :time
    field :author, :user
  end

  scalar :time, description: "ISOz time" do
    parse &Timex.DateFormat.parse(&1.value, "{ISOz}")
    serialize &Timex.DateFormat.format!(&1, "{ISOz}")
  end

  enum :contact_type do
    value :phone
    value :email
  end

  input_object :contact_input do
    field :type, non_null(:contact_type)
    field :value, non_null(:string)
  end
end
