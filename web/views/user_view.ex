defmodule Peepchat.UserView do
  use Peepchat.Web, :view

  def render("index.json", %{user: users}) do
    %{data: render_many(users, Peepchat.UserView, "user.json")}
  end

  def render("show.json", %{user: users}) do
    %{data: render_one(users, Peepchat.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      "type": "user",
      "id": user.id,
      "attributes": %{
        "email": user.email
      }
    }
  end
end
