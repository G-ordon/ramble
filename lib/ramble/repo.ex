defmodule Ramble.Repo do
  use Ecto.Repo,
    otp_app: :ramble,
    adapter: Ecto.Adapters.Postgres
end
