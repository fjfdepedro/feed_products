defmodule Capterra do

  def process(path) do
    parser(path)
    |> handle_data_yaml
  end

  def parser(path) do
    #parser yaml -> yaml_elixir, added dependency in mix.exs
    File.cwd! 
    |> Path.join(path) 
    |> YamlElixir.read_from_file
    |> handle_response
  end

  def handle_response({ :ok, body}) do
    { :ok, body}
  end

  def handle_response({:error, _}) do
    IO.puts """
    error (#{:error}) -> YamlElixir error
    """
  end

  def handle_data_yaml({ :ok, body}) do
    save_data(body)
  end

  def handle_data_yaml(error) do
    error
  end

  def save_data([]) do
    []
  end

  def save_data([head | tail]) do
    company = %Enterprise.Company{name: head["name"], twitter: head["twitter"], categories: head["tags"]}
    Enterprise.Repo.insert(company)
    save_data(tail)
  end
end