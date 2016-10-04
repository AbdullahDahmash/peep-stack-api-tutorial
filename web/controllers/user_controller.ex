defmodule Peepchat.UserController do
  use Peepchat.Web, :controller

  alias Peepchat.User
  plug Guardian.Plug.EnsureAuthenticated, handler: Peepchat.AuthErrorHandler

  def current(conn, _) do
    require IEx
    IEx.pry
    user = conn
    |> Guardian.Plug.current_resource

    conn
    |> render(Peepchat.UserView, "show.json", user: user)
  end
end
