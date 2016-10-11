class Profile < ApplicationRecord
  # NOTE: Rails might have added the association belongs_to :user for you when you run the migrations.
  # This is not necessary for this time of association and can be removed from the Profile model.
  # belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :bio, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

end
