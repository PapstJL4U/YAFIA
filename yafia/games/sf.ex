defmodule StreetFighter do
  @moduledoc """
  Defines possible inputs for StreetFighter
  """

  def inputs() do
    Standards.info()
    ++ SixButtons.info()
    ++ Complex.info()
    ++ Extras.info()
  end
end
