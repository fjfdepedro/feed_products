defmodule Enterprise.Application do
  use Application

  def start(_type, _args) do
    children = [
      Enterprise.Repo
    ]

    opts = [strategy: :one_for_one, name: Enterprise.Supervisor]
    Supervisor.start_link(children, opts)
  end
end