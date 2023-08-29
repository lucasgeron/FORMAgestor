class NegotiationGeneratorJob < ApplicationJob
  queue_as :default

  def perform(task_name, *args)
    case task_name
      when :for_course
        for_course(*args)
      when :for_calendar
        for_calendar(*args)
    end
   end

   private

   def for_course(course)
    calendars = App::Calendar.by_client(course.client_id)
    calendars.each do |calendar|
      Rails.logger.debug  App::Negotiation.create(client_id: course.client_id, calendar_id: calendar.id, course_id: course.id)
    end
   end

   def for_calendar(calendar)
    courses = App::Course.by_client(calendar.client_id)
    courses.each do |course|
      Rails.logger.debug  App::Negotiation.create(client_id: calendar.client_id, calendar_id: calendar.id, course_id: course.id)
    end
   end

end
