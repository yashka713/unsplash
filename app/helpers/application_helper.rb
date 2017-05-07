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

  def previous_page(page)
    page = page.request.last_uri.to_s.split('=')[1].to_i
    if page.nil? || page <= 0
      1
    else
      page -= 1
    end
  end

  def next_page(page)
    page = page.request.last_uri.to_s.split('=')[1].to_i
    if page.nil? || page <= 0
      1
    else
      page += 1
    end
  end
end
