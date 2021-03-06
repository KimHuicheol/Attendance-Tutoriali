module AttendancesHelper
  def attendance_state(attendance)
    #受け取ったAttendanceオブジェクトが当日と一致するか評価。
    if Date.current == attendance.worked_on
      return '出勤' if attendance.started_at.nil?
      return '退勤' if attendance.started_at.present? && attendance.finished_at.nil?
    end
    # どれも当てはまらなかった場合はfalseを返す。
    false
  end
  
  # 出勤時間と退勤時間を取得し、在社時間を計算して返す。
  def working_times(start, finish)
    format("%.2f", (((finish - start) / 60) / 60.0))
  end
end
