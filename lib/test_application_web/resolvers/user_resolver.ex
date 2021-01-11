defmodule TestApplicationWeb.AccountsResolver do
  alias TestApplication.Accounts
  @not_found {:error, :not_found}

  def all(_root, _args, _info) do
    {:ok, Accounts.list_accounts()}
  end

  def find_by_username(_root, args, _info) do
    case Accounts.get_account_by_username(args) do
      nil -> @not_found
      account -> {:ok, account}
    end
  end

  def find_by_email(_root, args, _info) do
    case Accounts.get_account_by_email(args) do
      nil -> @not_found
      account -> {:ok, account}
    end
  end

  def find_by_id(_root, args, _info) do
    case Accounts.get_account_by_id(args) do
      nil -> @not_found
      account -> {:ok, account}
    end
  end

  def create_user(_root, args, _info) do
    case Accounts.create_account(args) do
      {:ok, account} ->
        {:ok, account}

      _error ->
        {:error, "Could not create account"}
    end
  end

  def update_user(_root, args, _info) do
    case Accounts.update_account(args) do
      {:ok, account} ->
        {:ok, account}

      _error ->
        {:error, "Could not update account"}
    end
  end

  def delete_user(_root, args, _info) do
    case Accounts.delete_account(args) do
      {:ok, account} ->
        {:ok, account}

      _error ->
        {:error, "Could not remove Account"}
    end
  end
end
