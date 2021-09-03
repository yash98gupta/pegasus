Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'homepage/show' => "homepage#show"
  root 'homepage#show'

  post 'homepage/inquiry_create' => "homepage#inquiry_create"

  delete 'homepage/inquiry_delete/:id' => "homepage#inquiry_delete", :as => 'delete_inquiry2'

  get 'courses/integrated' => "courses#integrated"
  get 'courses/class6' => "courses#class6"
  get 'courses/class7' => "courses#class7"
  get 'courses/class8' => "courses#class8"
  get 'courses/class9' => "courses#class9"
  get 'courses/class10' => "courses#class10"
  get 'courses/class11' => "courses#class11"
  get 'courses/class12' => "courses#class12"

  get 'dashboard/show' => "dashboard#show"

  get 'admin/dashboard' => "admin#dashboard"

  get 'admin/admin8' => "admin#admin8"
  get 'admin/admin9' => "admin#admin9"
  get 'admin/admin10' => "admin#admin10"
  get 'admin/admin11' => "admin#admin11"
  get 'admin/admin12' => "admin#admin12"
  get 'admin/admin_common' => "admin#admin_common" , :as => 'admin_common'

  delete 'admin/destroy_user/:id' => "admin#destroy_user", :as => 'delete_inquiry'

  get 'admin/student/:id' => "admin#student", :as => 'student_profile_admin'

  get 'courses/subject' => "courses#subject"
  post 'courses/subject_create' => "courses#subject_create"

  get 'cart/new/:id' => "cart#new", :as => 'add_subject'
  post 'cart/create' => "cart#create"
  delete 'cart/destroy/:id' => "cart#destroy", :as => 'delete_subject'
  delete 'cart/renew/:id' => "cart#renew", :as => 'renew_subject'

  get 'cart/edit/:id' => "cart#edit", :as => 'edit_subject'

  patch "cart/update/:id" => "cart#update"

  get 'cart/receipt/:student_id/:subject_id' => "cart#receipt", :as => 'receipt_subject'

  get 'receipt/index' => "receipt#index", :as => 'receipt_index'

  get 'dashboard/subject/:id' => "dashboard#subject", :as => 'dashboard_subject'

  get 'scorecard/upload_result_new' => "scorecard#upload_result_new", :as => 'upload_test_result'

  post 'scorecard/upload_result_create' => "scorecard#upload_result_create"

  get 'admin/admin_leaderboard' => 'admin#admin_leaderboard', :as => 'admin_leaderboard'

  get 'admin/admin_leaderboard_subject' => 'admin#admin_leaderboard_subject', :as => 'admin_leaderboard_subject'

  get 'dashboard/leaderboard' => "dashboard#leaderboard", :as => "leaderboard_student"

  post 'razorpay/pay' => "razorpay#pay"

  get 'admin/choose_subjects' => "admin#choose_subjects"

  # get 'dashboard/schedule/:id' => "dashboard#schedule"
  get 'notes/study_material_new/' => "notes#study_material_new"
  post 'notes/study_material_create' => "notes#study_material_create"
  delete 'notes/notes_delete/:id' => "notes#notes_delete", :as => 'delete_notes'

  get 'test/test_new/' => "test#test_new"
  post 'test/test_create' => "test#test_create"
  delete 'test/test_delete/:id' => "test#test_delete", :as => 'delete_test'

  get 'assigment/assignment_new/' => "assigment#assignment_new"
  post 'assigment/assignment_create' => "assigment#assignment_create"
  delete 'assigment/assignment_delete/:id' => "assigment#assignment_delete", :as => 'delete_assignment'

  get 'video/video_new/' => "video#video_new"
  post 'video/video_create' => "video#video_create"
  delete 'video/video_delete/:id' => "video#video_delete", :as => 'delete_video'

  get 'ncertsol/ncertsol_new/' => "ncertsol#ncertsol_new"
  post 'ncertsol/ncertsol_create' => "ncertsol#ncertsol_create"
  delete 'ncertsol/ncertsol_delete/:id' => "ncertsol#ncertsol_delete", :as => 'delete_ncertsol'

  get 'timetable/timetable_new/' => "timetable#timetable_new"
  post 'timetable/timetable_create' => "timetable#timetable_create"
  delete 'timetable/timetable_delete/:id' => "timetable#timetable_delete", :as => 'delete_timetable'

  get 'doubt/new' => "doubt#new", :as => "doubt_new"
  post 'doubt/create' => "doubt#create"
  delete 'doubt/doubt_delete/:id' => "doubt#doubt_delete", :as => 'delete_doubt'

  post 'doubt/create_comment' => "doubt#create_comment"
  delete 'doubt/comment_delete/:id' => "doubt#comment_delete", :as => 'delete_comment'
  # get 'dashboard/ncert_solutions/:id' => "dashboard#ncert_solutions"
  # get 'dashboard/tests/:id' => "dashboard#tests"
  # get 'dashboard/assignment/:id' => "dashboard#assignment"
  # get 'dashboard/video/:id' => "dashboard#video"
  # get 'dashboard/doubts/:id' => "dashboard#doubts"



end
