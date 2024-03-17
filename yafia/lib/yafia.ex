defmodule Yafia do
  @moduledoc """
  Documentation for `Yafia`.
  """
  alias Images.MoveImage
  alias Images.ImageMagick
  use Application

  @doc """
  Hello world.

  ## Examples

      iex> Yafia.hello()
      :world

  """
  def hello do
    :world
  end

  def ci do
    MoveImage.crop_input(0, 0, 55, 56)
  end

  def test() do
    String.downcase("5 K > 2 S > 5 H > 63214 K ~ H")
    |> Parser.split_ws()
    |> Parser.find(GuiltyGearXrd.inputs())
    |> Enum.with_index(1)
    |> Enum.each(fn x -> ImageMagick.sys_crop(x) end)
  end

  @spec create_im(String.t(), list()) :: :ok
  def create_im(input \\ "2 mp , 4 mp > hp qcb mk srk 2p", game \\ StreetFighter.inputs())
  def create_im("", _), do: IO.puts("Error: No Input-String.")

  def create_im(input, game) do
    String.downcase(input)
    |> Parser.split_ws()
    |> Parser.find(game)
    |> Enum.with_index(1)
    |> Enum.each(fn x -> ImageMagick.sys_crop(x) end)
  end

  @spec combine_im() :: any()
  def combine_im() do
    ImageMagick.combine()
  end

  @spec main(String.t()) :: any()
  def main(args) when is_binary(args) do
    IO.puts(args)
    [game | combo] = ["gg", "5 K > 2 S > 5 H > 63214 K ~ H"]
    c = Enum.at(combo, 0)
    IO.puts("Decoding...")
    IO.puts("Game: " <> game)
    IO.puts("Combo: " <> c)
    g = get_game(game)
    Yafia.create_im(c, g)
    Yafia.combine_im()
    IO.puts("Finished.")
  end

  defp get_game(game) do
    case game do
      "gg" -> GuiltyGearXrd.inputs()
      "sf" -> StreetFighter.inputs()
      _ -> System.stop(1)
    end
  end

  def start(_type, _args) do
    main("")
    children = []
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
