defmodule TestApplicationWeb.LinksResolver do
  alias TestApplication.Links
  @not_found {:error, :not_found}

  def all_links(_root, _args, _info) do
    {:ok, Links.list_links()}
  end

  def get_link(_root, %{id: id}, _info) do
    case Links.get_link!(id) do
      nil -> @not_found
      link -> {:ok, link}
    end
  end

  def create_link(_root, args, _info) do
    # TODO: add detailed error message handling later
    case Links.create_link(args) do
      {:ok, link} ->
        {:ok, link}

      _error ->
        {:error, "could not create link"}
    end
  end

  def delete_link(_root, args, _info) do
    case Links.delete_link(args) do
      {:ok, link} ->
        {:ok, link}

      _error ->
        {:error, "Could not remove link"}
    end
  end
end
