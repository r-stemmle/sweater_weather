module Kelvin
  def kelvin_to_fh(kelvin)
    f = (kelvin - 273.15) * (9/5) + 32
    f.round(2)
  end
end
