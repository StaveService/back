module Helpers
    def index(object, page)
      items = object.page(page).per(10)
      { data: items, pagination: pagination(items) }
    end

    def search(object, page, q)
      index(object.ransack(q).result, page)
    end

    def pagination(result)
      { total_pages: result.total_pages }
    end

    def bookmark_current_user(object, current_user_id)
      object.find_by(user_id: current_user_id) if current_user_id
    end
end