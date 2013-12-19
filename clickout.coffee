# TODO test
# TODO add example (cofee, full example, gif)
# TODO add js and minifield version
# TODO set minimum jQuery version
# TODO discuss about add feature to close by Esc key?

###
  @description Allows to close element when click out of it (like background layer for modals but without it - you dont need to use `background` element that block page content)
  @var target - click event target
  @var containerClass - CSS class of container inside which opened element is present
  @var container - container jQuery object
  @var openedElSelector - selector for opened element (or elements), which can be closed.
  @var closeFunc - function that close opened element (default: $.hide())
  @shortcuts e - event, el - element
###
class Clickout
  # set class vars and event handler
  constructor: (options) ->
    @containerClass = options.containerClass
    return unless @present( $(@containerClass) )
    @container = $(@containerClass)
    @openedElSelector = options.openedElSelector
    @closeFunc = jQuery.isFunction(options.close) || @defaultCloseFunc

    $('body').on 'click', @clickHandler


  clickHandler: (e) =>
    @target = $(e.target)
    return if @ignorableTarget()

    openedEl = @container.find(@openedElSelector)
    return unless @present( openedEl )

    @closeFunc openedEl


  targetIsActiveEl: ->
    # Tag names are, by convention, returned capitalized.
    @target.prop('tagName') == 'A'


  # target or target parent has containerClass
  targetIsContainer: ->
    (@target.hasClass @containerClass) or (@target.closest(@containerClass).length > 0)


  ignorableTarget: ->
    @targetIsContaner() or @targetIsActiveEl()


  present: (el) ->
    el.length > 0


  defaultCloseFunc: (el) ->
    el.hide()
