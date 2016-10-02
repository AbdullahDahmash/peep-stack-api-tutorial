defmodule Peepchat.SessionController do
  use Peepchat.Web, :controller

  import Ecto.Query, only: [where: 2]
  import Comeonin.Bcrypt
  import Logger

  alias Peepchat.User

  def create(conn, %{"grant_type" => "password",
    "username" => username,
    "password" => password}) do
  	try do
  	  user = User
      |> where(email: ^username)
      |> Repo.one!
      cond do

        checkpw(password, user.password_hash) ->
          # Successful login
          Logger.info("User" <> username <> " just logged in")
          { :ok, jwt, _} = Guardian.encode_and_sign(user, :token)
          conn
          |> json(%{access_token: jwt})

        true ->
          # Unsuccessful login
          Logger.warning "User " <> username <> " just failed to login"
          conn
          |> put_status(401)
          |> render(Peepchat.ErrorView, "401.json") # 401
      end

    rescue
      e ->
        IO.inspect e
        Logger.error "Unexpected error while attempting to login user " <> username
        conn
        |> put_status(401)
        |> render(Peepchat.ErrorView, "401.json")
  	end
  end

  def create(conn, %{"grant_type" => _}) do
  	## Handle unknown grant type
  	throw "Unsupported grant_type"
  end
end
