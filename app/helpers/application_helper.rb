module ApplicationHelper
  def normalize_date(my_date)
    my_date.to_datetime.strftime('%d %B %Y at %T')
  end

  def normalize_category(categories)
    str = ''
    unless categories==[]
      categories.each_with_index do |category, index|
        str += '#' + category['title']
        if index < @data['categories'].length - 1
          str += ', '
        end
      end
      return str
    end
    '#'
  end
end
