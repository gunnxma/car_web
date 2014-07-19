class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  WillPaginate.per_page = 20
  
  SEX = [{id: 1, name: '男'}, {id: 2, name: '女'}]
  
  def current_user
    if !cookies[:user_id]
      nil
    else
      User.find(cookies[:user_id])
    end
  end
  
  def check_power
    if !current_user
      redirect_to :controller => :index, :action => :login
    else
      check_action unless current_user.id == 1
    end
  end
  
  def check_action
    # todo check current_user has current_action power
  end
  
  def get_car_no
    max_no = CarNo.maximum(:no)
    if max_no
      max_no = max_no + 1
    else
      max_no = 1
    end
    CarNo.create(:no => max_no)
    (DateTime.now.strftime("%Y%m%d").to_i*1000 + max_no).to_s
  end
  
  def get_customer_no
    max_no = CustomerNo.maximum(:no)
    if max_no
      max_no = max_no + 1
    else
      max_no = 1
    end
    CustomerNo.create(:no => max_no)
    (DateTime.now.strftime("%Y%m%d").to_i*1000 + max_no).to_s
  end
end

  # A custom renderer class for WillPaginate that produces markup suitable for use with Semantic.
  class SemanticPagination < WillPaginate::ActionView::LinkRenderer
    ELLIPSIS = "&hellip;"

    def to_html
      list_items = pagination.map do |item|
        case item
          when Fixnum
            page_number(item)
          else
            send(item)
        end
      end.join(@options[:link_separator])

      tag("div", list_items, class: "ui pagination menu")
    end

    def container_attributes
      super.except(*[:link_options])
    end

    protected

    def page_number(page)
      link_options = @options[:link_options] || {}

      if page == current_page
        link(page, nil, :class => "active item")
      else
        link(page, page, :class => "item")
      end
    end

    def previous_or_next_page(page, text, classname)
      link_options = @options[:link_options] || {}

      if page
        #tag("li", link(text, page, link_options), class: classname)
        link(tag("i", nil, class: classname), page, class: "icon item")
      else
        #tag("li", tag("span", text), class: "%s disabled" % classname)
        link(tag("i", nil, class: classname), nil, class: "icon item")
      end
    end

    def gap
      tag("li", link(ELLIPSIS, "#"), class: "disabled")
    end

    def previous_page
      num = @collection.current_page > 1 && @collection.current_page - 1
      previous_or_next_page(num, @options[:previous_label], "left arrow icon")
    end

    def next_page
      num = @collection.current_page < @collection.total_pages && @collection.current_page + 1
      previous_or_next_page(num, @options[:next_label], "right arrow icon")
    end

    def ul_class
      ["pagination", @options[:class]].compact.join(" ")
    end
  end
