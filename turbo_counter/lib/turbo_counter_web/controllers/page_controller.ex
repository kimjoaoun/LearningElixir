defmodule TurboCounterWeb.PageController do
  use TurboCounterWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
