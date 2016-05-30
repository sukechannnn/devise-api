# -*- coding: utf-8 -*-
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

  devise :database_authenticatable, :registerable, # :async,
         :rememberable, :trackable, :validatable, :encryptable,
         :recoverable, :confirmable,
         :omniauthable, omniauth_providers: [:twitter]

  self.table_name = 'mmember'
  self.primary_key = 'uid'

  validates :email1, presence: true
  validates :email1, uniqueness: true, allow_blank: true, if: :email1_changed?
  validates :email1, format: { with: email_regexp }, allow_blank: true, if: :email1_changed?
  validates :email1, email: { strict_mode: true }

  # 会員
  scope :normal, -> { where(memstate: 1) }
  # 退会
  scope :cancel, -> { where(memstate: 9) }
  # 会員からベーシックアカウントを除外
  scope :exclude_basicinc, -> { where.not('email1 REGEXP ?', '@basicinc\.jp$') }
  # FerretPLUSからの登録
  scope :old_signed_up, -> { where(created_at: nil) }
  # 新ポータルからの登録
  scope :new_signed_up, -> { where.not(created_at: nil) }

  # facebookからの登録
  scope :facebook, -> { where.not(facebook_id: nil) }
  # twitterからの登録
  scope :twitter, -> { where.not(twitter_id: nil) }
  # yahooからの登録
  scope :yahoojp, -> { where.not(yahoojp_id: nil) }

  ## Database authenticatable
  # field :email,              type: String, default: ""
  # field :encrypted_password, type: String, default: ""

  ## Recoverable
  # field :reset_password_token,   type: String
  # field :reset_password_sent_at, type: Time

  ## Rememberable
  # field :remember_created_at, type: Time

  ## Trackable
  # field :sign_in_count,      type: Integer, default: 0
  # field :current_sign_in_at, type: Time
  # field :last_sign_in_at,    type: Time
  # field :current_sign_in_ip, type: String
  # field :last_sign_in_ip,    type: String

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time

  # field :role, type: Integer, default: FREE

  def name
    self.nname || self.email1
  end

  def email
    self.email1
  end

  def email=(new_email1)
    # もしemailが空の時にバリデーションに引っかからずエラーになるようなら、この下の部分コメントアウト
    # return false if new_email1.blank?
    self.email1 = new_email1
    names = new_email1.split('@')
    names[0] ||= ''
    self.nname ||= names[0].gsub(/[^A-Za-z0-9]/, '').slice!(0, 20)
    # TODO: サービスコードはパラメータを参照して入れるようにする
    # self.service ||= 4 # 新ポータルサービスコード
  end

  def encrypted_password
    self.passwd
  end

  def encrypted_password=(new_passwd)
    self.passwd = new_passwd
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def encrypted_password_changed?
    false
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if email = conditions.delete(:email)
      self.find_by(email1: email, memstate: '1')
    else
      super
    end
  end

  def password_salt
    'no salt'
  end

  def password_salt=(new_salt)
  end

  # TODO: Pardot通知対応
  # Pardotへメール配信可否を送信
  #  def pardot_mail_opt_update(flag)
  #    pardot = Api::Pardot.new(self.email1)
  #    if "1" == flag
  #      pardot.optin
  #    else
  #      pardot.optout
  #    end
  #  end

  # Pardotへメールアドレスの変更を送信（すでにFerretDB上では新しいメールになってる／非同期）
  #  def pardot_mail_update(old_email)
  #    pardot = Api::Pardot.new(old_email)
  #    pardot.email_change(self.email1)
  #  end

  # Pardotへニックネームの変更を送信
  #  def pardot_nickname_update(nickname)
  #    pardot = Api::Pardot.new(self.email1)
  #    pardot.nickname_change(nickname)
  #  end

  # Pardotへ退会通知
  #  def pardot_delete(param)
  #    return unless param["email1"].present?
  #    pardot = Api::Pardot.new(param["email1"])
  #    pardot.delete
  #  end
end
