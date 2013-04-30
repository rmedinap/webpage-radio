class AuspiciadoresController < InheritedResources::Base


def create
  create!{auspiciadores_path}
end

def update
  update!{auspiciadores_path}
end



end
