defmodule Blog.PostResolver do
  def all(_args, _info) do
    {:ok, Blog.Repo.all(Blog.Post)}
  end

  def create(params, _info) do
    {contact_params, user_params} = Map.pop(params, :contact)
  
    with {:ok, contact} <- create_contact(contact_params),
    {:ok, user} <- create_user(user_params, contact) do
      {:ok, %{user | contact: contact}}
    end
  end
  
  defp create_contact(params) do
    params
    |> Contact.changeset
    |> Blog.Repo.insert
  end
  
  defp create_user(params, contact) do
    params
    |> Map.put(:contact_id, contact.id)
    |> User.changeset
    |> Blog.Repo.insert
  end
end