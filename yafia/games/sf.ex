defmodule StreetFighter do
  @moduledoc """
  Defines possible inputs for StreetFighter
  """

  def inputs() do
    Standards.inputs()
    ++ SixButtons.inputs()
    ++ Complex.inputs()
    ++ Extras.inputs()
  end
end
