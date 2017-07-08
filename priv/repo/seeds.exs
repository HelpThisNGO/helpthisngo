# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Helpthisngo.Repo.insert!(%Helpthisngo.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Helpthisngo.Repo.delete_all Helpthisngo.User

Helpthisngo.User.changeset(%Helpthisngo.User{}, %{name: "Test User", email: "testuser@example",
password: "secret", password_confirmation: "secret"})
|> Helpthisngo.Repo.insert!

