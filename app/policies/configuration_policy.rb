class ConfigurationPolicy < ApplicationPolicy
  def index?
    user.admin? || user.supervisor?  # Apenas admins e supervisores podem acessar
  end
end
