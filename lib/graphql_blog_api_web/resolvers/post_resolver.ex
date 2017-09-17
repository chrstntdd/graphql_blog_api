defmodule Blog.PostResolver do
  def all(_args, _info) do
    {:ok, Blog.Repo.all(Blog.Post)}
  end

  def create(args, _info) do
    %Post{}
    |> Post.changeset(args)
    |> Blog.Repo.insert
  end
end