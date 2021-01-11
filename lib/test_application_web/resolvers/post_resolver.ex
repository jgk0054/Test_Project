defmodule TestApplicationWeb.Posts.PostResolver do
  alias TestApplication.Posts
  @not_found {:error, :not_found}

  def all(_root, _args, _info) do
    {:ok, Posts.list_posts()}
  end

  def find_posts_by_user(_root, args, _info) do
    {:ok, Posts.find_posts_by_user(args)}
  end

  def find_post(_root, %{id: id}, _info) do
    case Posts.get_post(id) do
      nil -> @not_found
      post -> {:ok, post}
    end
  end

  def create_post(_root, args, _info) do
    case Posts.create_post(args) do
      {:ok, post} ->
        {:ok, post}

      error ->
        {:error, "Could not create post."}
    end
  end

  def update_post(_root, args, _info) do
    case Posts.update_post(args) do
      {:ok, post} ->
        {:ok, post}

      error ->
        {:error, "Could not update post."}
    end
  end

  def delete_post(_root, args, _info) do
    case Posts.delete_post(args) do
      {:ok, post} ->
        {:ok, post}

      error ->
        {:error, "Could not delete post."}
    end
  end
end
