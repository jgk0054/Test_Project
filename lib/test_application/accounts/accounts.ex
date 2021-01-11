defmodule TestApplication.Accounts do
  @moduledoc """
  The Account context.
  """

  import Ecto.Query
  alias TestApplication.Repo
  alias TestApplication.Accounts.Account

  def data() do
    Dataloader.Ecto.new(Repo, query: &query/2)
  end

  def query(queryable, _) do
    queryable
  end

  def list_accounts do
    Repo.all(Account)
  end

  def get_account_by_id(%{id: id} = attrs) do
    Account
    |> Repo.get(id)
  end

  def get_account_by_email(%{email: email}) do
    Account
    |> Repo.get_by(email: email)
  end

  def get_account_by_username(%{username: username} = attrs) do
    Account
    |>Repo.get_by(username: username)
  end

  def create_account(attrs \\ %{}) do
    %Account{}
    |> Account.changeset(attrs)
    |> Repo.insert()
  end

  def update_account(%{id: id, username: username, email: email, bio: bio} = attrs) do
    get_account_by_id(%{id: id})
    |> IO.inspect
    |> Account.changeset(attrs)
    |> IO.inspect
    |> Repo.update()
  end

  def delete_account(%{id: id} = attrs) do
    id
    |> get_account_by_id()
    |> Repo.delete()
  end
end
