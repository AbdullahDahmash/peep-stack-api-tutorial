defmodule Peepchat.UserTest do
  use Peepchat.ModelCase

  alias Peepchat.User

  @valid_attrs %{email: "make@example.com",
    password: "abcde12345",
    password_confirmation: "abcde12345"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "mis-matched password_confirmation doesn't work" do
    changeset = User.changeset(%User{}, %{email: "joe@example.com",
      password: "312sadsad12dcqweqw",
      password_confirmation: "qeqw13123qwewqe"})
    refute changeset.valid?
  end

  test "missing password_confirmation doesn't work" do
    changeset = User.changeset(%User{}, %{email: "joe@example.com",
      password: "312sadsad12dcqweqw"})
    refute changeset.valid?
  end

  test "short password won't work" do
    changeset = User.changeset(%User{}, %{email: "joe@example.com",
      password: "1234",
      password_confirmation: "1234"})
    refute changeset.valid?
  end
end
