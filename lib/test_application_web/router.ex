defmodule TestApplicationWeb.Router do
  use TestApplicationWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/graphiql" do
    pipe_through(:api)

    forward("/", Absinthe.Plug.GraphiQL,
      schema: TestApplicationWeb.Schema,
      interface: :simple,
      context: %{pubsub: TestApplicationWeb.Endpoint}
    )
  end

  scope "/", TestApplicationWeb do
    pipe_through(:browser)

    get("/*path", PageController, :index)
  end
end
