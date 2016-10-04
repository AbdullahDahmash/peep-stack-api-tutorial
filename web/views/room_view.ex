defmodule Peepchat.RoomView do
  use Peepchat.Web, :view

  def render("index.json", %{rooms: rooms}) do
    %{data: render_many(rooms, Peepchat.RoomView, "room.json")}
  end

  def render("show.json", %{room: room}) do
    %{data: render_one(room, Peepchat.RoomView, "room.json")}
  end

  def render("room.json", %{room: room}) do
    %{id: room.id,
      name: room.name,
      owner_id: room.owner_id}
  end
end
