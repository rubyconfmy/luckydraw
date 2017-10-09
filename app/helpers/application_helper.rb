module ApplicationHelper
  HAPPY_EMOJIS = [
    "389", 
    "381",
    "38A",
    "388",
    "382",
    "380",
    "601",
    "602",
    "603",
    "604",
    "605",
    "606",
    "607",
    "608",
    "609",
    "60A",
    "60B",
    "60C",
    "60D",
    "60F",
    "618",
    "61A",
    "61C",
    "61D",
  ]

  SAD_EMOJIS = [
    "612",
    "613",
    "614",
    "615",
    "616",
    "623",
    "628",
    "631",
    "635",
    "61E",
    "620",
    "621",
    "622",
    "623",
    "624",
    "625",
    "628",
    "629",
    "630",
    "631",
    "632",
    "633",
  ]

  def get_emojis(mood: :happy, count: 1)
    emojis = self.class.const_get("#{mood}_emojis".upcase).sample(count)
    emojis.reduce(''.html_safe) { |x, emoji| x << content_tag(:span, "&#x1F#{emoji};".html_safe) }
  end
end
