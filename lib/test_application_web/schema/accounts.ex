defmodule TestApplicationWeb.Schema.Accounts do
  use Absinthe.Schema.Notation
  alias TestApplicationWeb.AccountsResolver

  @desc "An Account"
  object :account do
    field(:id, non_null(:id))
    field(:username, non_null(:string))
    field(:email, non_null(:string))
    field(:bio, :string)
  end

  object :account_queries do
    @desc "Get all Accounts"
    field :all_accounts, non_null(list_of(non_null(:account))) do
      resolve(&AccountsResolver.all/3)
    end

    @desc "Get one account by ID"
    field :get_account_by_id, non_null(:account) do
      arg(:id, non_null(:string))
      resolve(&AccountsResolver.find_by_id/3)
    end

    @desc "Get one account by Email"
    field :get_account_by_email, non_null(:account) do
      arg(:email, non_null(:string))

      resolve(&AccountsResolver.find_by_email/3)
      |> IO.inspect()
    end

    @desc "Get one account by username"
    field :get_account_by_username, non_null(:account) do
      arg(:username, non_null(:string))
      resolve(&AccountsResolver.find_by_username/3)
    end
  end

  object :account_mutations do
    @desc "Create an Account"
    field :create_account, :account do
      arg(:username, non_null(:string))
      arg(:email, non_null(:string))
      arg(:bio, :string)
      resolve(&AccountsResolver.create_user/3)
    end

    @desc "Update an Account"
    field :update_account, :account do
      arg(:username, non_null(:string))
      arg(:email, non_null(:string))
      arg(:id, non_null(:string))
      arg(:bio, :string)
      resolve(&AccountsResolver.update_user/3)
    end

    @desc "Delete an Account"
    field :delete_account, :account do
      arg(:id, non_null(:string))
      resolve(&AccountsResolver.delete_user/3)
    end
  end
end
