jQuery(function($) {
  var form = $('.accounts-signup #stripe-form'),
      button = form.find('button');

  form.submit(function(event) {
    // Ensure the user does not submit the form twice
    disableSubmit();

    Stripe.card.createToken(form, stripeResponseHandler);

    // Prevent the form from submitting with the default action
    return false;
  });

  var stripeResponseHandler = function(status, response) {
    if (response.error) {
      showErrors(response);
      enableSubmit();
    } else {
      insertToken(stripeToken(response));
      form.get(0).submit();
    }
  };

  function showErrors (response) {
    form.find('.payment-errors').text(response.error.message);
  }

  function disableSubmit () {
    button.prop('disabled', true);
  }

  function enableSubmit () {
    button.prop('disabled', false);
  }

  function stripeToken (response) {
    return response.id;
  }

  function insertToken (token) {
    form.append($('<input type="hidden" name="stripe_token" />').val(token));
  }
});

