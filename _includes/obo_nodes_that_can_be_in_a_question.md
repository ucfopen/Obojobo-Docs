{% assign pages = site.pages | where: "can_be_in_a_question", 'true' %} {% assign titles = pages |
page_titles %} {% assign node_names = titles | obo_node_names_for_version %} {% for node_name in node_names %} {{ node_name | obo_node }}{% if forloop.last ==
false %},{% endif %} {% endfor %}
