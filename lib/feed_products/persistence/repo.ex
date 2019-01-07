defmodule Enterprise.Repo do
  use Ecto.Repo, otp_app: :feed_products, adapter: Ecto.Adapters.MySQL
end