class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :identities, dependent: :destroy

  scope :yet_to_win, -> { where(drawn_at: nil) }

  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user

    if user.nil?
      email = auth.info.email
      user = User.find_by(email: email)

      if user.nil?
        user = User.new(
          name: auth.extra.raw_info.name,
          username: auth.info.nickname || auth.uid,
          email: email,
          password: Devise.friendly_token[0, 20],
          avatar_url: auth.extra.raw_info.avatar_url || ''
        )
        user.save!
      end
    end

    if identity.user != user
      identity.user = user
      identity.save!
    end

    user
  end

  def winner!
    update(drawn_at: Time.now)
  end
end
