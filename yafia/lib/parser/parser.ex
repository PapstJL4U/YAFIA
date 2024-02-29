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
      "adc"
    ])
  end

  @doc """
  Returns a List, that is split along the divider pattern.
  """
  def split(input_string) when is_binary(input_string) do
    String.split(input_string, divider(), trim: true)
  end
end
