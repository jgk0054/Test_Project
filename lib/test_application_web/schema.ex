defmodule TestApplicationWeb.Schema do
  use Absinthe.Schema

  alias TestApplication.Repo

  alias TestApplicationWeb.Middlewares.HandleChangesetErrors

  # Import dataloader stuff
  alias TestApplication.Accounts
  alias TestApplication.Links
  alias TestApplication.Posts
  # Import queries, mutations, and data objects.
  import_types(Absinthe.Type.Custom)
  import_types(TestApplicationWeb.Schema.Links)
  import_types(TestApplicationWeb.Schema.Accounts)
  import_types(TestApplicationWeb.Schema.Posts)

  @doc """
  Creates a Dataloader from the Ecto Repo with General and Specialized sources.
  """
  def dataloader do
    source = Dataloader.Ecto.new(Repo)

    Dataloader.new()
    |> Dataloader.add_source(Repo, source)
    |> Dataloader.add_source(Accounts, Accounts.data())
    |> Dataloader.add_source(Links, Links.data())
    |> Dataloader.add_source(Posts, Posts.data())
  end

  @doc """
  Adds the `dataloader` to the context so it's available to resolvers, etc.
  """
  def context(ctx) do
    Map.put(ctx, :loader, dataloader())
  end

  @doc """
  Tells Absinthe to run the appropriate callbacks for the middleware.
  """
  def plugins do
    [Absinthe.Middleware.Dataloader | Absinthe.Plugin.defaults()]
  end

  @doc """
  Applies a custom HandleChangesetErrors to mutations. Otherwise, just return
  the middleware as-is.
  """
  def middleware(middleware, _field, %{identifier: :mutation}) do
    middleware ++ [HandleChangesetErrors]
  end

  def middleware(middleware, _field, _object), do: middleware

  query do
    import_fields(:account_queries)
    import_fields(:link_queries)
    import_fields(:blog_queries)
  end

  mutation do
    import_fields(:account_mutations)
    import_fields(:link_mutations)
    import_fields(:blog_mutations)
  end
end
