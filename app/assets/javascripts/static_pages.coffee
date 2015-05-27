$('.static_pages.calc').ready ->
	StaticPages.calc()

StaticPages=
	calc: ->
		@_selector1()
		@_selector2()
		@_selector3()
		@_selector4()
		@_selector5()
		@_selector6()

	_selector1: ->
		$("#selector1").change((e) ->
	    StaticPages._price()
	  )


	_selector2: ->
		$("#selector2").change((e) ->
	    StaticPages._price()
	  )

	_selector3: ->
		$("#selector3").change((e) ->
	    StaticPages._str3 = $(this).val()
	  )

	_selector4: ->
		$("#selector4").change((e) ->
	    StaticPages._str4 = $(this).val()
	  )

	_selector5: ->
		$("#selector5").change((e) ->
	    StaticPages._str5 = $(this).val()
	  )


	_selector6: ->
		$("#selector6").change((e) ->
	    StaticPages._str6 = $(this).val()
	  )

	_price: ->
		a = $('#selector1').val()
		b = $('#selector2').val()
		c = $('#selector3').val()
		d = $('#selector4').val()
		e = $('#price').text(parseInt(a) + parseInt(b))

