defmodule GuiltyGearXrd do
  @moduledoc """
  Defines possible inputs for StreetFighter
  """

  def inputs() do
    Standards.info()
    ++ GuiltyGear.info()
    ++ Complex.info()
    ++ Extras.info()
  end
end
