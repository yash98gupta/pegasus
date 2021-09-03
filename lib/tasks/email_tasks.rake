desc 'send digest email'
task send_digest_email: :environment do
  # ... set options if any

  Cart.all.each do |c|
    if Date.today() >= c.end_date - 7
      ReminderMailer.reminder_email(User.find_by(id: c.student_id)).deliver_now!
    end
  end

end
