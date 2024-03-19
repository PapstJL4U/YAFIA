defmodule GuiltyGearModern do
  @moduledoc """
  Defines possible inputs for GuiltyGear
  """

  def inputs() do
    Standards.inputs()
    ++ ArcsysAdditional.inputs()
    ++ GuiltyGearM.inputs()
    ++ Extras.inputs()
    ++ Complex.inputs()
  end
end
