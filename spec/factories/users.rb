FactoryGirl.define do
  factory :user do
    # sequence(:uid) {|n| n}
    # sequence(:email1) {|n|"username+#{n}@basicinc.jp"}
    uid 1
    email1 'username+1@basicinc.jp'
    # email1 "username@basicinc.jp"
    # email2 nil
    password 'password'
    # encrypted_password "5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8"
    password_confirmation 'password'
    # memstate 1
    # regdate nil
    nname 'username'
    # corporation nil
    # byear 0
    # bmon 0
    # sex 0
    # addr1 nil
    # addr2 nil
    # addr3 nil
    # job nil
    # marry 0
    # ref 0
    # service 4
    # url1 nil
    # url2 nil
    # url3 nil
    # url4 nil
    # url5 nil
    last_login_date Time.zone.now
    # basic_flg "0"
    # oauth "0"
    # id_facebook nil
    # id_twitter nil
    # reset_password_token nil
    # reset_password_sent_at nil
    # remember_created_at nil
    # sign_in_count 1
    current_sign_in_at Time.zone.now
    last_sign_in_at Time.zone.now
    # current_sign_in_ip "127.0.0.1"
    # last_sign_in_ip "127.0.0.1"
    created_at Time.zone.now
    updated_at Time.zone.now
    # confirmation_token "token..."
    # confirmed_at nil
    # confirmation_sent_at "2015-07-31 06:52:35"
    # unconfirmed_email nil
    # mail_magazine_flg "1"
    # facebook_id nil
    # twitter_id nil
    # yahoojp_id nil
    # google_id nil
    # google_oauth2_id nil
  end
end
