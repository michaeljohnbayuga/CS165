class DailyreportsController < ApplicationController
  def index
      @dailyreports = Dormer.select('dormers.name,dormers.room_number,dailyreports.status,dailyreports.created_at').joins("left JOIN dailyreports ON dailyreports.student_number=dormers.student_number").all.order('dormers.room_number,dormers.name,dailyreports.created_at')
  end
 
end

