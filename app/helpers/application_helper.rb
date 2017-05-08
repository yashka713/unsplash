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

  def previous_page(page)
    numb = page.request.last_uri.query.split('=')[1].to_i
    if numb.nil? || numb <= 0
      1
    else
      numb -= 1
    end
  end

  def next_page(page)
    numb = page.request.last_uri.query.split('=')[1].to_i
    if numb.nil? || numb <= 0
      1
    else
      numb += 1
    end
  end
end
