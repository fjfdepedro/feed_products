# This is the main entry point of feed products project
# For convention is named FeedProducts.CLI
# Have a run function, start this app with this command line
defmodule FeedProducts.CLI do
  
  def main(args) do
    args
      |> parse_args 
      |> process
      |> import_values
  end

  def parse_args(args) do
    parse = OptionParser.parse(args, switches: [ file: :string],
                                     aliases:  [ f:    :file   ])
   
    case parse do

    { [ file: true ], _} 
      -> :file

    {  _, [source, _, path], _ }  
      -> { source, path }

    _ -> :file

    end
  end

  def process(:file) do
    IO.puts """
    error -> bad args (source, file, path)
    """
    System.halt(0)
  end

  def process({ source, path }) do
    #todo review is this solution is the better 
    try do
      apply(String.to_existing_atom("Elixir.#{String.capitalize(source)}"), :parser, [path])
    rescue
      e in ArgumentError -> 
        IO.puts """
        error (#{e.message}) -> not exit #{source} function of source to data import
        """
    end
  end

  def import_values(data) do
    #todo import values in database
    #add this class in mix for import data values in mongodb database {:mongodb, "~> 0.4.7"}
    #add this class in mix for import data values in mongodb database {:mariaex, "~> 0.8.3"}
    IO.puts "import data->#{data}"
  end

end