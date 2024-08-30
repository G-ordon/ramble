# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Ramble.Repo.insert!(%Ramble.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Ramble.Repo
alias Ramble.Accounts.User

# Insert users with specific IDs
%User{id: 1, name: "Gordon"} |> Repo.insert!(on_conflict: :nothing)
%User{id: 2, name: "Okoth"} |> Repo.insert!(on_conflict: :nothing)
%User{id: 3, name: "James"} |> Repo.insert!(on_conflict: :nothing)
