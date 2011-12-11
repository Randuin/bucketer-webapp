jQuery ->
  $('#buckets_form').submit ->
    buckets.setInitialUI()
    $.ajax( {
      url: "/buckets/steps",
      data: $('#buckets_form').serialize(),
      type: 'post',
      success: (data) ->
        if (data.reponse == "error")
          $('#error-modal .modal-error-message').text(data.message)
          $('#error-modal').reveal()
        else
        buckets.setData(data)
    } )
    false

buckets =
  setInitialUI: ->
    buckets.a_max = parseInt($('#buckets_bucket_a_size').val())
    buckets.b_max = parseInt($('#buckets_bucket_b_size').val())

    $('#bucket_a .headliner').text('Max: ' + buckets.a_max)
    $('#bucket_b .headliner').text('Max: ' + buckets.b_max)

  playBackSteps: ->
    for iteration in buckets.steps
      do (iteration) ->
        a_value = iteration[0]
        height_a = ( 400 * ( a_value / buckets.a_max ) )

        # This should go into the same animation queue for the containers
        # so that the numbers will sync correctly with the animation
        $('#bucket_a .content').queue (next) ->
          $('#bucket_a .value').text("Current: " + a_value)
          next()

        $('#bucket_a .content').animate
          height: height_a + 'px'
          'slow'
          'swing'

        b_value = iteration[1]
        height_b = ( 400 * ( b_value / buckets.b_max ) )

        $('#bucket_b .content').queue (next) ->
          $('#bucket_b .value').text("Current: " + b_value)
          next()

        $('#bucket_b .content').animate
          height: height_b + 'px'
          'slow'
          'swing'

  setData: (data) ->
    buckets.steps = data
    buckets.playBackSteps()
