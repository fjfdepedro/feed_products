# This is the main entry point of feed products project
# For convention is named FeedProducts.CLI
# Have a run function, start this app with this command line
defmodule FeedProducts.CLI do
  
  def run(args) do
    parse_args(args)
  end

  def parse_args(args) do
    parse = OptionParser.parse(args, switches: [ file: :string],
                                     aliases:  [ f:    :file   ])
   
    case parse do

    { [ file: true ], _} 
      -> :file

    {  _, [product, _, path], _ }  
      -> { product, path }

    _ -> :file

    end
  end

end