defmodule CliTest do
  use ExUnit.Case
  doctest FeedProducts

  test "nil returned by function parse_args with only one or two args" do
    assert FeedProducts.CLI.parse_args(["f",  "anything"]) == :file
    assert FeedProducts.CLI.parse_args(["file", "anything"]) == :file
    assert FeedProducts.CLI.parse_args(["unknow"]) == :file
  end

  test "parsing function parse_args -> capterra" do
    assert FeedProducts.CLI.parse_args(["capterra", "file", "files/capterra.yaml"]) == { "capterra", "files/capterra.yaml" }
  end

  test "parsing function parse_args -> softwareadvice" do
    assert FeedProducts.CLI.parse_args(["softwareadvice", "file", "files/softwareadvice.json"]) == { "softwareadvice", "files/softwareadvice.json"}
  end

  test "parsing function process -> call to capterra module" do
    assert FeedProducts.CLI.process({"capterra", ["files/capterra.yaml"]}) == 'capterra'
  end

  test "parsing function process -> call to softwareadvice module" do
    assert FeedProducts.CLI.process({"softwareadvice", ["files/softwareadvice.json"]}) == 'softwareadvice'
  end

  #todo create test for parse json and yaml
  #todo create test for import data in ddbb

end
