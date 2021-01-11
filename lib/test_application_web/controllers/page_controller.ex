defmodule TestApplicationWeb.PageController do
  use TestApplicationWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
