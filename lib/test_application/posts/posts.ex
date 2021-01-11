defmodule TestApplication.Posts do
  import Ecto.Query
  alias TestApplication.Repo
  alias TestApplication.Posts.Post
  alias TestApplication.Accounts.Account

  def data() do
    Dataloader.Ecto.new(Repo, query: &query/2)
  end

  def query(queryable, _) do
    queryable
  end

  def list_posts do
    Repo.all(Post)
  end

  def get_post(id) do
    Repo.get(Post, id)
  end

  # Gonna try a join command here.
  def find_posts_by_user(%{user_id: user_id}) do
    IO.puts("You put the cute in EXECUTE THIS FUCKING FUNCITON ;)")
    query =
      from post in Post,
        where: post.user_id == ^user_id,
        select: post
    query
    |> Repo.all()
  end

  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  def delete_post(%{id: id}) do
    id
    |> get_post()
    |> Repo.delete()
  end
end
