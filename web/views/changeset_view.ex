defmodule Peepchat.ChangesetView do
  use Peepchat.Web, :view
  import Logger

  @doc """
  Traverses and translates changeset errors.
  See `Ecto.Changeset.traverse_errors/2` and
  `Peepchat.ErrorHelpers.translate_error/1` for more details.
  """
  def translate_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, &translate_error/1)
  end

  def render("error.json-api", %{changeset: changeset}) do
    # When encoded, the changeset returns its errors
    # as a JSON object. So we just pass it forward.
    JaSerializer.EctoErrorSerializer.format(changeset)
  end
end
