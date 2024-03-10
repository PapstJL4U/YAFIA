defmodule Parser do
  @moduledoc """
  Parses a string to find fighting input
  """

  @doc """
  Returns a pattern (list of dividing symbols) that can be used to divide a strings,
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
  Returns a Command list, that is split along the internal Divider pattern.
  It only contains moves. No Cancels like jc, adc, xx, ...
  """
  @spec split(String.t()) :: list(String.t())
  def split(input) when is_binary(input) do
    String.split(input, divider(), trim: true)
  end

  @doc """
  Returns a Command list split along whitespace.
  """
  @spec split_ws(String.t()) :: list(String.t())
  def split_ws(input) when is_binary(input) do
    String.split(input, " ", trim: true)
  end

  @spec find(list(), keyword(), integer()) :: list()
  def find(moves, game, index \\ 0)
  def find(_, [], _), do: IO.puts("Error, No game selected!")
  def find([], _, _), do: []

  def find(moves, game, index) do
    with [move | others] = moves do
      for {img, parts} <- game,
          Map.has_key?(parts, move),
          do: [{index, img, Map.fetch!(parts, move)}] ++ find(others, game, index + 1)
    end
  end
end
