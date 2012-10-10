# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :video_session do
    klu
    end_timestamp "2012-09-25 15:46:18"
    begin_timestamp "2012-09-25 15:46:18"
    video_system_session_id "MyString"
    calling_user_id {FactoryGirl.create(:user).id}
    calling_user_type 'registered'
  end
  factory :anonymous_video_session, class: VideoSession do
    klu
    end_timestamp "2012-09-25 15:46:18"
    begin_timestamp "2012-09-25 15:46:18"
    video_system_session_id "MyString"
    calling_user_id 'pt32742jddddj23'
    calling_user_type 'anonymous'
  end
  factory :kluuu_video_session, class: VideoSession do
    klu {FactoryGirl.create(:kluuu)}
    end_timestamp "2012-09-25 15:46:18"
    begin_timestamp "2012-09-25 15:46:18"
    video_system_session_id "MyString"
    calling_user_id {FactoryGirl.create(:user).id}
    calling_user_type 'registered'
  end
  factory :no_kluuu_video_session, class: VideoSession do
    klu {FactoryGirl.create(:no_kluuu)}
    end_timestamp "2012-09-25 15:46:18"
    begin_timestamp "2012-09-25 15:46:18"
    video_system_session_id "MyString"
    calling_user_id {FactoryGirl.create(:user).id}
    calling_user_type 'registered'
  end
end
