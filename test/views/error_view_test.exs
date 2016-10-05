defmodule Peepchat.ErrorViewTest do
  use Peepchat.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.json-api" do
    assert render(Peepchat.ErrorView, "404.json-api", []) ==
           %{"errors" => [%{code: 404, title: "Page not found"}]}
  end

  test "render 500.json-api" do
    assert render(Peepchat.ErrorView, "500.json-api", []) ==
           %{"errors" => [%{code: 500, title: "Internal Server Error"}]}
  end

end
