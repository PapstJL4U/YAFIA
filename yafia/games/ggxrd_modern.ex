defmodule GuiltyGearModern do
  @moduledoc """
  Defines possible inputs for Guilty Gear Xrd with "modern|metal" design.
  """

  def inputs() do
    Standards.inputs()
    ++ ArcsysAdditional.inputs()
    ++ GuiltyGearM.inputs()
    ++ Extras.inputs()
    ++ Complex.inputs()
  end
end
