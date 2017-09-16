defmodule GraphqlBlogApiWeb.Router do
  use Phoenix.Router
   
  forward "/", Absinthe.Plug,
  schema: Blog.Schema
end
