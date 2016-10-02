defmodule Peepchat.Router do
  use Peepchat.Web, :router

  pipeline :api do
    plug :accepts, ["json","json-api"]
  end

  scope "/api", Peepchat do
    pipe_through :api
    # Registration
    post "register", RegistrationController, :create
    # Route to Session Controller
    resources("session", SessionController, only: [:index])
  end
end
