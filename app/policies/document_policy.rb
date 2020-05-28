class DocumentPolicy < ApplicationPolicy
  class Scope
    def resolve
      scope.all
    end
  end

  def index?
    return true
  end
end
