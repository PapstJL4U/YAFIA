defmodule Sip do
  use Application
  alias Yafia
  alias GuiltyGearXrd
  alias StreetFighter

  def start(_type, _args) do
    children = []
    Supervisor.start_link(children, strategy: :one_for_one)
    [game | combo] = []
    c = Enum.at(combo, 0)
    IO.puts("Decoding...")
    IO.puts("Game: " <> game)
    IO.puts("Combo: " <> c)
    g = getGame(game)
    Yafia.create_im(c, g)
    Yafia.combine_im()
    IO.puts("neat")
    ["hello"]
  end

  def getGame(game) do
    case game do
      "gg" -> GuiltyGearXrd.inputs()
      "sf" -> StreetFighter.inputs()
      _ -> System.stop(1)
    end
  end
end
