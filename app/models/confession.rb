class Confession < ActiveRecord::Base

  enum status: [:pending, :accepted, :reject]

  class << self
    def each_month year
      confessions = Confession.accepted.where("year(created_at) = #{Time.now.year}")
        .order(:created_at).group_by do |confession|
        confession.created_at.month
      end
      confessions_per_month = confessions.map do |confession|
        {name: Date::MONTHNAMES[confession.first], y: confession.last.size}
      end
    end
  end
end
