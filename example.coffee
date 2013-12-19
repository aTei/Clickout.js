$ ->
  new Clickout
    containerClass: 'find-holidays'
    openedElSelector: '.opened.find-holidays-item',
    close: (el) ->
      el.find('.find-holidays-item-close').trigger 'click'
