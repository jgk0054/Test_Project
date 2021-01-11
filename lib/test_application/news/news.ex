defmodule TestApplication.Links do
  @moduledoc """
  The Links context.
  """

  import Ecto.Query
  alias TestApplication.Repo
  alias TestApplication.Links.Link

  def data() do
    Dataloader.Ecto.new(Repo, query: &query/2)
  end
  
  def query(queryable, _) do
    queryable
  end

  def list_links do
    Repo.all(Link)
  end

  def get_link!(id) do
    Repo.get(Link, id)
  end

  def create_link(attrs \\ %{}) do
    %Link{}
    |> Link.changeset(attrs)
    |> Repo.insert()
  end

  def update_link(%Link{} = link, attrs) do
    link
    |> Link.changeset(attrs)
    |> Repo.update()
  end

  def delete_link(%{id: id}) do
    id
    |> get_link!()
    |> Repo.delete()
  end

  def change_link(%Link{} = link, attrs \\ %{}) do
    Link.changeset(link, attrs)
  end
end
