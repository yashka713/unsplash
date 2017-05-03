module ApplicationHelper
  def normalize_date(my_date)
    my_date.to_datetime.strftime('Created %d %B %Y at %T')
  end

  def normalize_category(categories)
    str = ''
    categories.each_with_index do |category, index|
      str += category['title']
      if index < @data['categories'].length - 1
        str += ', '
      end
    end
    str
  end
end
