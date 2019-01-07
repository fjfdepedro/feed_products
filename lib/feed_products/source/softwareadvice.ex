defmodule Softwareadvice do

  def process(path) do
    parser(path)
    |> handle_data_yaml
  end

  def parser(path) do
    #parser yaml -> yaml_elixir, added dependency in mix.exs
    body = File.cwd!
    |> Path.join(path) 
    |> File.read
    |> handle_response
    try do
      Poison.decode(body)
    rescue
      e in ArgumentError -> 
        IO.puts """
        error (#{e.message}) -> Poison.decode function error
        """
    end
    
  end

  def handle_response({ :ok, body}) do
    body
  end

  def handle_response({:error, _}) do
    IO.puts """
    error (#{:error}) -> File.read error
    """
  end

  def handle_data_yaml({ :ok, body}) do
    save_data(body["products"])
  end

  def handle_data_yaml(error) do
    error
  end

  def save_data([]) do
    []
  end

  def save_data([head | tail]) do
    company = %Enterprise.Company{name: head["title"], twitter: head["twitter"], categories: head["categories"]}
    Enterprise.Repo.insert(company)
    save_data(tail)
  end
end