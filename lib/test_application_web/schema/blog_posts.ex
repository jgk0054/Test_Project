defmodule TestApplicationWeb.Schema.Posts do
  use Absinthe.Schema.Notation
  alias TestApplicationWeb.Posts.PostResolver

  @desc "A Blog post."
  object :post do
    field(:id, :id)
    field(:title, :string)
    field(:body, :string)
    field(:user_id, :id)
  end

  object :blog_queries do
    @desc "Get all posts"
    field :all_posts, non_null(list_of(non_null(:post))) do
      resolve(&PostResolver.all/3)
    end

    @desc "Get one post by ID"
    field :get_post_by_id, non_null(:post) do
      arg(:id, non_null(:string))
      resolve(&PostResolver.find_post/3)
    end

    @desc "Get a list of posts from a single user ID."
    field :get_posts_by_user_id, non_null(list_of(non_null(:post))) do
      arg(:user_id, non_null(:id))
      resolve(&PostResolver.find_posts_by_user/3)
    end
  end

  object :blog_mutations do
    @desc "Create a Post"
    field :create_post, :post do
      arg(:title, non_null(:string))
      arg(:body, non_null(:string))
      arg(:user_id, non_null(:id))
      resolve(&PostResolver.create_post/3)
    end

    @desc "Update a post"
    field :update_post, :post do
      arg(:title, non_null(:string))
      arg(:body, non_null(:string))
      arg(:user_id, non_null(:id))
      arg(:id, non_null(:string))

      resolve(&PostResolver.update_post/3)
    end

    @desc "Delete a Post"
    field :delete_post, :post do
      arg(:id, non_null(:string))
      resolve(&PostResolver.delete_post/3)
    end
  end
end
