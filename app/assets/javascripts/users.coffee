# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$('.users.calc').ready ->
	Users.calc()

Users =

	_selects: ['user_current_league', 'user_desired_league', 'user_current_division', 'user_desired_division','user_lp_per_win']

	_prices: [0, 10, 10, 10, 10, 15, 15, 15, 15, 15, 20, 25, 25, 25, 25, 30, 40, 40, 40, 40, 60, 100, 100, 100, 100, 400, 600 ]

	calc: ->
		@_show_reg_form()
		@_select_changes()
		@_calc_price()
		@_select_changes_wins_count()

	_select_changes: ->
		@_selects.forEach (e)->
			$("##{e}").change ->
				Users._calc_price()

	_show_reg_form: ->
		$('.show_reg').click ->
			$('#h_reg').show()
			$(@).hide()

	_calc_price: ->
		cur_lg = $('#user_current_league').val()
		cur_dv = $('#user_current_division').val()
		des_lg = $('#user_desired_league').val()
		des_dv = $('#user_desired_division').val()
		lp = $('#user_lp_per_win').val()

		if cur_lg == '5'
			cur = 26
			des = parseInt(des_lg) * 5 + parseInt(des_dv)
		else if des_lg == '5'
			des = 26
			cur = parseInt(cur_lg) * 5 + parseInt(cur_dv)
		else
			cur = parseInt(cur_lg) * 5 + parseInt(cur_dv)
			des = parseInt(des_lg) * 5 + parseInt(des_dv)

		if cur >= des
			price = 0
		else
			price = @_prices[cur...des].reduce (prev, cur) ->
				prev + cur

		if lp == '1'
			price = price * 1
		else
			price = price * 1.25

		$('#calc_price').text("Price: " + price + " €")
		$('#calc_price1').val(price)