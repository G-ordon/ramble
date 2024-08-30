defmodule RambleWeb.PageController do
  use RambleWeb, :controller

   def index(conn, _params) do
    users = Ramble.Accounts.list_users()
    render(conn, :index, users: users)
  end
  def home(conn, _params) do
    render(conn, :home)
  end
  def show(conn, %{"id" => id}) do
    users = Ramble.Accounts.get_user!(id)
    render(conn, "show.html", user: users)
    end
end
