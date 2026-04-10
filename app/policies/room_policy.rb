class RoomPolicy < ApplicationPolicy
  def index?
    user.admin? || user.supervisor? || user.operador? # Apenas admins e supervisores podem acessar
  end

  def update?
    user.admin? || user.supervisor? # Apenas admins e supervisores podem atualizar
  end
  def new?
    user.admin? || user.supervisor? # Apenas admins e supervisores podem criar
  end
  def create?
    user.admin? || user.supervisor? # Apenas admins e supervisores podem criar
  end
  def destroy?
    user.admin? || user.supervisor? # Apenas admins e supervisores podem excluir
  end
end
