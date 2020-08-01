module AttendancesHelper
  def attendance_state(attedances)
    #受け取ったAttendancesオブジェクトが当日と一致するか評価する。
    if Date.current == attendance.worked_on
      return '出勤' if attendance.started_at.nil?
      return '退勤' if attendance.started_at.present? && attendance.finished_at.nil?
    end
    #どれにも当てはまらなった場合はfalseを返す
    false
  end
end
