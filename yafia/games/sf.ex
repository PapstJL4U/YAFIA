defmodule StreetFighter do
  @moduledoc """
  Defines possible inputs for Street Fighter
  """

  def inputs() do
    Standards.inputs()
    ++ SixButtons.inputs()
    ++ Complex.inputs()
    ++ Extras.inputs()
  end
end
