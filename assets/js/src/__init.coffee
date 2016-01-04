'use strict'

window.Uno = Uno =
  version: '2.6.9'

  search:
    container: -> $('#results')
    form: (action) -> $('#search-container')[action]()

  loadingBar: (action) -> $('.pace')[action]()

  context: ->
    # get the context from the first class name of body
    # https://github.com/TryGhost/Ghost/wiki/Context-aware-Filters-and-Helpers
    className = document.body.className.split(' ')[0].split('-')[0]
    if className is '' then 'error' else className

  app: do -> document.body

  is: (property, value) -> this.app.dataset[property] is value

  timeAgo: (selector) ->
    $(selector).each ->
      postDate = $(this).html()
      postDateInDays = Math.floor((Date.now() - new Date(postDate)) / 86400000)

      if postDateInDays is 0 then postDateInDays = 'today'
      else if postDateInDays is 1 then postDateInDays = 'yesterday'
      else postDateInDays = "#{postDateInDays} days ago"

      $(this).html(postDateInDays)
      $(this).mouseover -> $(this).html postDate
      $(this).mouseout -> $(this).html postDateInDays

  device: ->
    w = window.innerWidth
    h = window.innerHeight
    return 'mobile' if (w <= 480)
    return 'tablet' if (w <= 1024)
    'desktop'
