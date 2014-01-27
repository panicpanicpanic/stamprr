ActiveAdmin.register Post do
  index do
    column "Date", :post_date
    column "Copy", :post_copy
    column "Total Reach", :post_total_reach
    column "Total Engagements", :post_total_engagement
    column "Tags", :tag_list, :sortable => false
    default_actions
  end
end
