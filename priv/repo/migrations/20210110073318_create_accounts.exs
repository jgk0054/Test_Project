defmodule TestApplication.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add(:username, :string)
      add(:email, :string)
      add(:bio, :string)
    end

    create table(:posts) do
      add(:title, :string)
      add(:body, :string)
      add(:user_id, :id)
    end

    create table (:test) do
      add(:field, :string)
    end
  end
end
