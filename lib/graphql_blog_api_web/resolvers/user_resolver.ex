defmodule Blog.UserResolver do
  def find(%{id: id}, _info) do
    case Blog.Repo.get(User, id) do
      nil  -> {:error, "User id #{id} not found"}
      user -> {:ok, user}
    end
  end
end