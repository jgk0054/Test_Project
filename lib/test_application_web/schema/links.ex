defmodule TestApplicationWeb.Schema.Links do
  use Absinthe.Schema.Notation
  alias TestApplicationWeb.LinksResolver

  @desc "A link with a description."
  object :link do
    field(:id, non_null(:id))
    field(:url, non_null(:string))
    field(:description, non_null(:string))
  end

  object :link_queries do
    @desc "Get all links"
    field :all_links, non_null(list_of(non_null(:link))) do
      resolve(&LinksResolver.all_links/3)
    end

    @desc "Get one link"
    field :get_link, :link do
      arg(:id, non_null(:id))
      resolve(&LinksResolver.get_link/3)
    end
  end

  object :link_mutations do
    @desc "Create a new link"
    field :create_link, :link do
      arg(:url, non_null(:string))
      arg(:description, non_null(:string))

      resolve(&LinksResolver.create_link/3)
    end

    @desc "Remove a link"
    field :delete_link, :link do
      arg(:id, non_null(:string))
      resolve(&LinksResolver.delete_link/3)
    end
  end
end
