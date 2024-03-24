defmodule GuiltyGearXrd do
  @moduledoc """
  Defines possible inputs for standard Guilty Gear inputs.
  """

  def inputs() do
    Standards.inputs()
    ++ ArcsysAdditional.inputs()
    ++ GuiltyGear.inputs()
    ++ Extras.inputs()
    ++ Complex.inputs()
  end
end
