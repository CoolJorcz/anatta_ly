%div.search_bar
    %h4 Search your friends' items
    %span.index_search= form_tag root_path, method: 'get'
    = text_field_tag :search, params[:search], placeholder: "Find Items"
