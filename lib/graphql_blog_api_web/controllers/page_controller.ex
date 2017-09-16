defmodule GraphqlBlogApiWeb.PageController do
  use GraphqlBlogApiWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
