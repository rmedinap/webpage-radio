require 'spec_helper'

describe Contacto do
  it "has a valid factory" do
    expect(create(:contacto)).to be_valid
  end

  it "is valid with nombre, email y mensaje" do
    expect(build(:contacto)).to be_valid
  end
  it "is invalid without nombre" do
    expect(build(:contacto, nombre: nil)).to \
      have(1).errors_on(:nombre)
  end
  it "is invalid without an email address" do
    expect(build(:contacto, email: nil)).to  \
      have(1).errors_on(:email)
  end
  it "is invalid without mensaje" do
    expect(build(:contacto, mensaje: nil)).to \
      have(1).errors_on(:mensaje)
  end
end
