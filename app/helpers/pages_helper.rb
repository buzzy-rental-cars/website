module PagesHelper
  def display_order_values(page)
    if page.id
      (1..Page.all.count).to_a
    else
      (1..(Page.all.count + 1)).to_a
    end
  end
end
