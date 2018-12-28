defmodule CliTest do
  use ExUnit.Case
  doctest FeedProducts

  test "nil returned by option parsing with only one or two args" do
    assert FeedProducts.CLI.parse_args(["f",  "anything"]) == :file
    assert FeedProducts.CLI.parse_args(["file", "anything"]) == :file
    assert FeedProducts.CLI.parse_args(["unknow"]) == :file
  end

  test "parsing capterra" do
    assert FeedProducts.CLI.parse_args(["capterra", "file", "feed-products/capterra.yaml"]) == { "capterra", "feed-products/capterra.yaml" }
  end

  test "parsing softwareadvice" do
    assert FeedProducts.CLI.parse_args(["softwareadvice", "file", "feed-products/softwareadvice.json"]) == { "softwareadvice", "feed-products/softwareadvice.json"}
  end
end
