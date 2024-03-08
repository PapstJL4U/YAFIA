defmodule Parser do
  @moduledoc """
  Parses a string to find fighting input
  """

  @doc """
  Returns a pattern that can be used to divide a strings,
  """
  def divider do
    :binary.compile_pattern([
      ">",
      " ",
      ",",
      "->",
      "~",
      "dl.",
      "delay",
      "jc",
      "hjc",
      "sjc",
      "dc",
      "adc",
      "xx"
    ])
  end

  @doc """
  Returns a List, that is split along the divider pattern.
  """
  def split(input) when is_binary(input) do
    String.split(input, divider(), trim: true)
  end

  @doc """
  Returns a List split along whitespace.
  """
  def split_ws(input) when is_binary(input) do
    String.split(input, " ", trim: true)
  end
end
