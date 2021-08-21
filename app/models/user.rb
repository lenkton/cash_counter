class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def balance
    paid - owed
  end

  private

  def paid
    Payment
      .where(user_id: id)
      .sum(:amount)
  end

  def owed
    (Invoice.sum(:amount) / 3).round(2)
  end
end
