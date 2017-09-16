defmodule Blog.PostResolver do
  def all(_args, _info) do
    {:ok, Blog.Repo.all(Blog.Post)}
  end
end