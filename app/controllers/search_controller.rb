class SearchController < ApplicationController

  def search
    @model = params[:model]
    @method = params[:method]
    @content = params[:content]
    @records = search_for(@model, @method, @content)
  end
  
  def search_for(model, method, content)
    if model == 'user'
      if method == 'match_forward'
        User.where("name LIKE?", "#{content}%")
      elsif method == 'match_rear'
        User.where("name LIKE?", "%#{content}")
      elsif method == 'match_completely'
        User.where(name: content)
      elsif method == 'match_partially'
        User.where("name LIKE?", "%#{content}%")
      end
    else model == 'user'
      if method == 'match_forward'
        Book.where("title LIKE?", "#{content}%")
      elsif method == 'match_rear'
        Book.where("title LIKE?", "%#{content}")
      elsif method == 'match_completely'
        Book.where(title: content)
      elsif method == 'match_partially'
        Book.where("title LIKE?", "%#{content}%")
      end
    end
  end

end
