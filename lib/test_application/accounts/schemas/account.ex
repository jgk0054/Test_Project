defmodule TestApplication.Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "accounts" do
    field :username, :string
    field :email, :string
    field :bio, :string
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:username, :email, :bio])
    |> validate_required([:username, :email])
  end
end
