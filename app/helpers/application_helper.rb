module ApplicationHelper
  def normalize_date(my_date)
    my_date.to_datetime.strftime('%d %B %Y at %T')
  end

  def normalize_category(categories)
    str = ''
    unless categories == []
      categories.each_with_index do |category, index|
        str += '#' + category['title']
        str += ', ' if index < @data['categories'].length - 1
      end
      return str
    end
    '#'
  end
end
